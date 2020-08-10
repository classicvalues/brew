# frozen_string_literal: true

require "download_strategy"
require "cli/parser"
require "utils/github"
require "tmpdir"
require "bintray"

module Homebrew
  module_function

  def pr_pull_args
    Homebrew::CLI::Parser.new do
      usage_banner <<~EOS
        `pr-pull` [<options>] <pull_request> [<pull_request> ...]

        Download and publish bottles, and apply the bottle commit from a
        pull request with artifacts generated by GitHub Actions.
        Requires write access to the repository.
      EOS
      switch "--no-publish",
             description: "Download the bottles, apply the bottle commit and "\
                          "upload the bottles to Bintray, but don't publish them."
      switch "--no-upload",
             description: "Download the bottles and apply the bottle commit, "\
                          "but don't upload to Bintray."
      switch "-n", "--dry-run",
             description: "Print what would be done rather than doing it."
      switch "--clean",
             description: "Do not amend the commits from pull requests."
      switch "--branch-okay",
             description: "Do not warn if pulling to a branch besides master (useful for testing)."
      switch "--resolve",
             description: "When a patch fails to apply, leave in progress and allow user to resolve, "\
                          "instead of aborting."
      switch "--warn-on-upload-failure",
             description: "Warn instead of raising an error if the bottle upload fails. "\
                          "Useful for repairing bottle uploads that previously failed."
      flag   "--workflow=",
             description: "Retrieve artifacts from the specified workflow (default: `tests.yml`)."
      flag   "--artifact=",
             description: "Download artifacts with the specified name (default: `bottles`)."
      flag   "--bintray-org=",
             description: "Upload to the specified Bintray organisation (default: `homebrew`)."
      flag   "--tap=",
             description: "Target tap repository (default: `homebrew/core`)."
      flag   "--root-url=",
             description: "Use the specified <URL> as the root of the bottle's URL instead of Homebrew's default."
      flag   "--bintray-mirror=",
             description: "Use the specified Bintray repository to automatically mirror stable URLs "\
                          "defined in the formulae (default: `mirror`)."

      min_named 1
    end
  end

  def setup_git_environment!
    # Passthrough Git environment variables
    ENV["GIT_COMMITTER_NAME"] = ENV["HOMEBREW_GIT_NAME"] if ENV["HOMEBREW_GIT_NAME"]
    ENV["GIT_COMMITTER_EMAIL"] = ENV["HOMEBREW_GIT_EMAIL"] if ENV["HOMEBREW_GIT_EMAIL"]

    # Depending on user configuration, git may try to invoke gpg.
    return unless Utils.popen_read("git config --get --bool commit.gpgsign").chomp == "true"

    begin
      gnupg = Formula["gnupg"]
    rescue FormulaUnavailableError
      nil
    else
      if gnupg.any_version_installed?
        path = PATH.new(ENV.fetch("PATH"))
        path.prepend(gnupg.installed_prefix/"bin")
        ENV["PATH"] = path
      end
    end
  end

  def signoff!(pr, tap:, args:)
    message = Utils.popen_read "git", "-C", tap.path, "log", "-1", "--pretty=%B"
    subject = message.lines.first.strip

    # Skip the subject and separate lines that look like trailers (e.g. "Co-authored-by")
    # from lines that look like regular body text.
    trailers, body = message.lines.drop(1).partition { |s| s.match?(/^[a-z-]+-by:/i) }

    # Approving reviewers also sign-off on merge
    trailers += GitHub.approved_reviews(tap.user, "homebrew-#{tap.repo}", pr).map do |r|
      "Signed-off-by: #{r["name"]} <#{r["email"]}>\n"
    end
    trailers = trailers.uniq.join.strip
    body = body.join.strip.gsub(/\n{3,}/, "\n\n")

    close_message = "Closes ##{pr}."
    body += "\n\n#{close_message}" unless body.include? close_message
    new_message = [subject, body, trailers].join("\n\n").strip

    if args.dry_run?
      puts "git commit --amend --signoff -m $message"
    else
      safe_system "git", "-C", tap.path, "commit", "--amend", "--signoff", "--allow-empty", "-q", "-m", new_message
    end
  end

  def cherry_pick_pr!(pr, path: ".", args:)
    if args.dry_run?
      puts <<~EOS
        git fetch --force origin +refs/pull/#{pr}/head
        git merge-base HEAD FETCH_HEAD
        git cherry-pick --ff --allow-empty $merge_base..FETCH_HEAD
      EOS
    else
      safe_system "git", "-C", path, "fetch", "--quiet", "--force", "origin", "+refs/pull/#{pr}/head"
      merge_base = Utils.popen_read("git", "-C", path, "merge-base", "HEAD", "FETCH_HEAD").strip
      commit_count = Utils.popen_read("git", "-C", path, "rev-list", "#{merge_base}..FETCH_HEAD").lines.count

      # git cherry-pick unfortunately has no quiet option
      ohai "Cherry-picking #{commit_count} commit#{"s" unless commit_count == 1} from ##{pr}"
      cherry_pick_args = "git", "-C", path, "cherry-pick", "--ff", "--allow-empty", "#{merge_base}..FETCH_HEAD"
      result = args.verbose? ? system(*cherry_pick_args) : quiet_system(*cherry_pick_args)

      unless result
        if args.resolve?
          odie "Cherry-pick failed: try to resolve it."
        else
          system "git", "-C", path, "cherry-pick", "--abort"
          odie "Cherry-pick failed!"
        end
      end
    end
  end

  def check_branch(path, ref, args:)
    branch = Utils.popen_read("git", "-C", path, "symbolic-ref", "--short", "HEAD").strip

    return if branch == ref || args.clean? || args.branch_okay?

    opoo "Current branch is #{branch}: do you need to pull inside #{ref}?"
  end

  def formulae_need_bottles?(tap, original_commit, args:)
    return if args.dry_run?

    changed_formulae(tap, original_commit).any? do |f|
      !f.bottle_unneeded? && !f.bottle_disabled?
    end
  end

  def mirror_formulae(tap, original_commit, publish: true, org:, repo:, args:)
    changed_formulae(tap, original_commit).select do |f|
      stable_urls = [f.stable.url] + f.stable.mirrors
      stable_urls.grep(%r{^https://dl.bintray.com/#{org}/#{repo}/}) do |mirror_url|
        if args.dry_run?
          puts "brew mirror #{f.full_name}"
        else
          odebug "Mirroring #{mirror_url}"
          mirror_args = ["mirror", f.full_name]
          mirror_args << "--debug" if args.debug?
          mirror_args << "--verbose" if args.verbose?
          mirror_args << "--bintray-org=#{org}" if org
          mirror_args << "--bintray-repo=#{repo}" if repo
          mirror_args << "--no-publish" unless publish
          system HOMEBREW_BREW_FILE, *mirror_args
        end
      end
    end
  end

  def changed_formulae(tap, original_commit)
    if Homebrew::EnvConfig.disable_load_formula?
      opoo "Can't check if updated bottles are necessary as formula loading is disabled!"
      return
    end

    Utils.popen_read("git", "-C", tap.path, "diff-tree",
                     "-r", "--name-only", "--diff-filter=AM",
                     original_commit, "HEAD", "--", tap.formula_dir)
         .lines.map do |line|
      next unless line.end_with? ".rb\n"

      name = "#{tap.name}/#{File.basename(line.chomp, ".rb")}"
      begin
        Formula[name]
      rescue Exception # rubocop:disable Lint/RescueException
        # Make sure we catch syntax errors.
        next
      end
    end.compact
  end

  def download_artifact(url, dir, pr)
    token, username = GitHub.api_credentials
    case GitHub.api_credentials_type
    when :env_username_password, :keychain_username_password
      curl_args = ["--user", "#{username}:#{token}"]
    when :env_token
      curl_args = ["--header", "Authorization: token #{token}"]
    when :none
      raise Error, "Credentials must be set to access the Artifacts API"
    end

    # Download the artifact as a zip file and unpack it into `dir`. This is
    # preferred over system `curl` and `tar` as this leverages the Homebrew
    # cache to avoid repeated downloads of (possibly large) bottles.
    FileUtils.chdir dir do
      downloader = GitHubArtifactDownloadStrategy.new(url, "artifact", pr, curl_args: curl_args, secrets: [token])
      downloader.fetch
      downloader.stage
    end
  end

  def pr_pull
    args = pr_pull_args.parse

    bintray_user = ENV["HOMEBREW_BINTRAY_USER"]
    bintray_key = ENV["HOMEBREW_BINTRAY_KEY"]
    bintray_org = args.bintray_org || "homebrew"

    if bintray_user.blank? || bintray_key.blank?
      odie "Missing HOMEBREW_BINTRAY_USER or HOMEBREW_BINTRAY_KEY variables!" if !args.dry_run? && !args.no_upload?
    end

    workflow = args.workflow || "tests.yml"
    artifact = args.artifact || "bottles"
    mirror_repo = args.bintray_mirror || "mirror"
    tap = Tap.fetch(args.tap || CoreTap.instance.name)

    setup_git_environment!

    args.named.uniq.each do |arg|
      arg = "#{tap.default_remote}/pull/#{arg}" if arg.to_i.positive?
      url_match = arg.match HOMEBREW_PULL_OR_COMMIT_URL_REGEX
      _, user, repo, pr = *url_match
      odie "Not a GitHub pull request: #{arg}" unless pr

      check_branch tap.path, "master", args: args

      ohai "Fetching #{tap} pull request ##{pr}"
      Dir.mktmpdir pr do |dir|
        cd dir do
          original_commit = Utils.popen_read("git", "-C", tap.path, "rev-parse", "HEAD").chomp
          cherry_pick_pr!(pr, path: tap.path, args: args)
          signoff!(pr, tap: tap, args: args) unless args.clean?

          unless args.no_upload?
            mirror_formulae(tap, original_commit,
                            org: bintray_org, repo: mirror_repo, publish: !args.no_publish?,
                            args: args)
          end

          unless formulae_need_bottles?(tap, original_commit, args: args)
            ohai "Skipping artifacts for ##{pr} as the formulae don't need bottles"
            next
          end

          url = GitHub.get_artifact_url(user, repo, pr, workflow_id: workflow, artifact_name: artifact)
          download_artifact(url, dir, pr)

          next if args.no_upload?

          upload_args = ["pr-upload"]
          upload_args << "--debug" if args.debug?
          upload_args << "--verbose" if args.verbose?
          upload_args << "--no-publish" if args.no_publish?
          upload_args << "--dry-run" if args.dry_run?
          upload_args << "--warn-on-upload-failure" if args.warn_on_upload_failure?
          upload_args << "--root_url=#{args.root_url}" if args.root_url
          upload_args << "--bintray-org=#{bintray_org}"
          safe_system HOMEBREW_BREW_FILE, *upload_args
        end
      end
    end
  end
end

class GitHubArtifactDownloadStrategy < AbstractFileDownloadStrategy
  def fetch
    ohai "Downloading #{url}"
    if cached_location.exist?
      puts "Already downloaded: #{cached_location}"
    else
      begin
        curl "--location", "--create-dirs", "--output", temporary_path, url,
             *meta.fetch(:curl_args, []),
             secrets: meta.fetch(:secrets, [])
      rescue ErrorDuringExecution
        raise CurlDownloadStrategyError, url
      end
      ignore_interrupts do
        cached_location.dirname.mkpath
        temporary_path.rename(cached_location)
        symlink_location.dirname.mkpath
      end
    end
    FileUtils.ln_s cached_location.relative_path_from(symlink_location.dirname), symlink_location, force: true
  end

  private

  def resolved_basename
    "artifact.zip"
  end
end
