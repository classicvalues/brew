# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `elftools` gem.
# Please instead update this file by running `tapioca generate --exclude json`.

# typed: true

module ELFTools
end

module ELFTools::Constants
  include(::ELFTools::Constants::DF)
  include(::ELFTools::Constants::DT)
  include(::ELFTools::Constants::EM)
  include(::ELFTools::Constants::ET)
  include(::ELFTools::Constants::PT)
  include(::ELFTools::Constants::SHT)
  include(::ELFTools::Constants::STB)
  include(::ELFTools::Constants::STT)
end

module ELFTools::Constants::DF
end

ELFTools::Constants::DF::DF_1_CONFALT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_DIRECT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_DISPRELDNE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_DISPRELPND = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_EDITED = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_ENDFILTEE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_GLOBAL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_GLOBAUDIT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_GROUP = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_IGNMULDEF = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_INITFIRST = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_INTERPOSE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_LOADFLTR = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_NODEFLIB = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_NODELETE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_NODIRECT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_NODUMP = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_NOHDR = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_NOKSYMS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_NOOPEN = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_NORELOC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_NOW = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_ORIGIN = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_SINGLETON = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_SYMINTPOSE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_1_TRANS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_BIND_NOW = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_ORIGIN = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_STATIC_TLS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_SYMBOLIC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DF::DF_TEXTREL = T.let(T.unsafe(nil), Integer)

module ELFTools::Constants::DT
end

ELFTools::Constants::DT::DT_ADDRRNGHI = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_ADDRRNGLO = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_BIND_NOW = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_DEBUG = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_ENCODING = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_FINI = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_FINI_ARRAY = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_FINI_ARRAYSZ = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_FLAGS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_FLAGS_1 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_GNU_HASH = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_HASH = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_HIOS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_HIPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_INIT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_INIT_ARRAY = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_INIT_ARRAYSZ = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_JMPREL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_LOOS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_LOPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_NEEDED = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_NULL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_PLTGOT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_PLTREL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_PLTRELSZ = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_REL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_RELA = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_RELACOUNT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_RELAENT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_RELASZ = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_RELCOUNT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_RELENT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_RELSZ = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_RPATH = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_RUNPATH = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_SONAME = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_STRSZ = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_STRTAB = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_SYMBOLIC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_SYMENT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_SYMTAB = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_TEXTREL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_VALRNGHI = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_VALRNGLO = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_VERDEF = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_VERDEFNUM = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_VERNEED = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::DT::DT_VERNEEDNUM = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::ELFMAG = T.let(T.unsafe(nil), String)

module ELFTools::Constants::EM
  class << self
    def mapping(val); end
  end
end

ELFTools::Constants::EM::EM_386 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_486 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_68K = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_860 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_88K = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_AARCH64 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_ALPHA = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_ALTERA_NIOS2 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_ARM = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_AVR32 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_BLACKFIN = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_BPF = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_CRIS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_CYGNUS_M32R = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_CYGNUS_MN10300 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_FRV = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_H8_300 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_IA_64 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_M32 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_M32R = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_MICROBLAZE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_MIPS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_MIPS_RS3_LE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_MIPS_RS4_BE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_MN10300 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_NONE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_OPENRISC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_PARISC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_PPC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_PPC64 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_S390 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_S390_OLD = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_SH = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_SPARC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_SPARC32PLUS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_SPARCV9 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_SPU = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_TILEGX = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_TILEPRO = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_TI_C6000 = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::EM::EM_X86_64 = T.let(T.unsafe(nil), Integer)

module ELFTools::Constants::ET
  class << self
    def mapping(type); end
  end
end

ELFTools::Constants::ET::ET_CORE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::ET::ET_DYN = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::ET::ET_EXEC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::ET::ET_NONE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::ET::ET_REL = T.let(T.unsafe(nil), Integer)

module ELFTools::Constants::PT
end

ELFTools::Constants::PT::PT_DYNAMIC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_GNU_EH_FRAME = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_GNU_RELRO = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_GNU_STACK = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_HIOS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_HIPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_INTERP = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_LOAD = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_LOOS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_LOPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_NOTE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_NULL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_PHDR = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_SHLIB = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::PT::PT_TLS = T.let(T.unsafe(nil), Integer)

module ELFTools::Constants::SHT
end

ELFTools::Constants::SHT::SHT_DYNAMIC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_DYNSYM = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_HASH = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_HIPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_HIUSER = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_LOPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_LOUSER = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_NOBITS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_NOTE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_NULL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_PROGBITS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_REL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_RELA = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_SHLIB = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_STRTAB = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::SHT::SHT_SYMTAB = T.let(T.unsafe(nil), Integer)

module ELFTools::Constants::STB
end

ELFTools::Constants::STB::STB_GLOBAL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STB::STB_GNU_UNIQUE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STB::STB_HIOS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STB::STB_HIPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STB::STB_LOCAL = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STB::STB_LOOS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STB::STB_LOPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STB::STB_NUM = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STB::STB_WEAK = T.let(T.unsafe(nil), Integer)

module ELFTools::Constants::STT
end

ELFTools::Constants::STT::STT_ARM_TFUNC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_COMMON = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_FILE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_FUNC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_GNU_IFUNC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_HIOS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_HIPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_LOOS = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_LOPROC = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_NOTYPE = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_NUM = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_OBJECT = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_SECTION = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_SPARC_REGISTER = T.let(T.unsafe(nil), Integer)

ELFTools::Constants::STT::STT_TLS = T.let(T.unsafe(nil), Integer)

module ELFTools::Dynamic
  def each_tags(&block); end
  def tag_at(n); end
  def tag_by_type(type); end
  def tags; end
  def tags_by_type(type); end

  private

  def endian; end
  def str_offset; end
end

class ELFTools::Dynamic::Tag
  def initialize(header, stream, str_offset); end

  def header; end
  def name; end
  def name?; end
  def stream; end
  def value; end
end

ELFTools::Dynamic::Tag::TYPE_WITH_NAME = T.let(T.unsafe(nil), Array)

class ELFTools::ELFClassError < ::ELFTools::ELFError
end

class ELFTools::ELFDataError < ::ELFTools::ELFError
end

class ELFTools::ELFError < ::StandardError
end

class ELFTools::ELFFile
  def initialize(stream); end

  def build_id; end
  def each_sections(&block); end
  def each_segments(&block); end
  def elf_class; end
  def elf_type; end
  def endian; end
  def header; end
  def machine; end
  def num_sections; end
  def num_segments; end
  def offset_from_vma(vma, size = T.unsafe(nil)); end
  def patches; end
  def save(filename); end
  def section_at(n); end
  def section_by_name(name); end
  def sections; end
  def sections_by_type(type, &block); end
  def segment_at(n); end
  def segment_by_type(type); end
  def segments; end
  def segments_by_type(type, &block); end
  def stream; end
  def strtab_section; end

  private

  def create_section(n); end
  def create_segment(n); end
  def identify; end
  def loaded_headers; end
end

class ELFTools::ELFMagicError < ::ELFTools::ELFError
end

class ELFTools::LazyArray
  def initialize(size, &block); end

  def [](i); end
end

module ELFTools::Note
  def each_notes; end
  def notes; end

  private

  def create_note(cur); end
  def endian; end
end

class ELFTools::Note::Note
  def initialize(header, stream, offset); end

  def desc; end
  def description; end
  def header; end
  def name; end
  def offset; end
  def stream; end
end

ELFTools::Note::SIZE_OF_NHDR = T.let(T.unsafe(nil), Integer)

class ELFTools::Relocation
  def initialize(header, stream); end

  def header; end
  def r_info_sym; end
  def r_info_type; end
  def stream; end
  def symbol_index; end
  def type; end

  private

  def mask_bit; end
end

module ELFTools::Sections
end

class ELFTools::Sections::DynamicSection < ::ELFTools::Sections::Section
  include(::ELFTools::Dynamic)

  def tag_start; end
end

class ELFTools::Sections::NoteSection < ::ELFTools::Sections::Section
  include(::ELFTools::Note)

  def note_start; end
  def note_total_size; end
end

class ELFTools::Sections::NullSection < ::ELFTools::Sections::Section
  def null?; end
end

class ELFTools::Sections::RelocationSection < ::ELFTools::Sections::Section
  def each_relocations(&block); end
  def num_relocations; end
  def rela?; end
  def relocation_at(n); end
  def relocations; end

  private

  def create_relocation(n); end
end

class ELFTools::Sections::Section
  def initialize(header, stream, offset_from_vma: T.unsafe(nil), strtab: T.unsafe(nil), **_kwargs); end

  def data; end
  def header; end
  def name; end
  def null?; end
  def stream; end
  def type; end

  class << self
    def create(header, stream, *args, **kwargs); end
  end
end

class ELFTools::Sections::StrTabSection < ::ELFTools::Sections::Section
  def name_at(offset); end
end

class ELFTools::Sections::SymTabSection < ::ELFTools::Sections::Section
  def initialize(header, stream, section_at: T.unsafe(nil), **_kwargs); end

  def each_symbols(&block); end
  def num_symbols; end
  def symbol_at(n); end
  def symbol_by_name(name); end
  def symbols; end
  def symstr; end

  private

  def create_symbol(n); end
end

class ELFTools::Sections::Symbol
  def initialize(header, stream, symstr: T.unsafe(nil)); end

  def header; end
  def name; end
  def stream; end
end

module ELFTools::Segments
end

class ELFTools::Segments::DynamicSegment < ::ELFTools::Segments::Segment
  include(::ELFTools::Dynamic)

  def tag_start; end
end

class ELFTools::Segments::InterpSegment < ::ELFTools::Segments::Segment
  def interp_name; end
end

class ELFTools::Segments::LoadSegment < ::ELFTools::Segments::Segment
  def file_head; end
  def file_tail; end
  def mem_head; end
  def mem_size; end
  def mem_tail; end
  def offset_in?(offset, size = T.unsafe(nil)); end
  def offset_to_vma(offset); end
  def size; end
  def vma_in?(vma, size = T.unsafe(nil)); end
  def vma_to_offset(vma); end
end

class ELFTools::Segments::NoteSegment < ::ELFTools::Segments::Segment
  include(::ELFTools::Note)

  def note_start; end
  def note_total_size; end
end

class ELFTools::Segments::Segment
  def initialize(header, stream, offset_from_vma: T.unsafe(nil)); end

  def data; end
  def executable?; end
  def header; end
  def readable?; end
  def stream; end
  def type; end
  def writable?; end

  class << self
    def create(header, stream, *args, **kwargs); end
  end
end

module ELFTools::Structs
end

class ELFTools::Structs::ELF32_Phdr < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

class ELFTools::Structs::ELF32_sym < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

class ELFTools::Structs::ELF64_Phdr < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

class ELFTools::Structs::ELF64_sym < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

class ELFTools::Structs::ELFStruct < ::BinData::Record
  def elf_class; end
  def elf_class=(_); end
  def offset; end
  def offset=(_); end
  def patches; end

  class << self
    def inherited(subclass); end
    def new(*args); end
    def pack(val, bytes); end
    def self_endian; end
  end
end

ELFTools::Structs::ELFStruct::CHOICE_SIZE_T = T.let(T.unsafe(nil), Hash)

class ELFTools::Structs::ELF_Dyn < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

class ELFTools::Structs::ELF_Ehdr < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

class ELFTools::Structs::ELF_Nhdr < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

ELFTools::Structs::ELF_Phdr = T.let(T.unsafe(nil), Hash)

class ELFTools::Structs::ELF_Rel < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

class ELFTools::Structs::ELF_Rela < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

class ELFTools::Structs::ELF_Shdr < ::ELFTools::Structs::ELFStruct
  class << self
    def inherited(subclass); end
    def new(*args); end
  end
end

ELFTools::Structs::ELF_sym = T.let(T.unsafe(nil), Hash)

module ELFTools::Util
  extend(::ELFTools::Util::ClassMethods)
end

module ELFTools::Util::ClassMethods
  def align(num, bit); end
  def cstring(stream, offset); end
  def select_by_type(enum, type); end
  def to_constant(mod, val); end
end
