const __time64_t = Clonglong

const time_t = __time64_t

struct __JL_Ctag_33
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{xml_attribute}
end

function Base.getproperty(x::__JL_Ctag_33, f::Symbol)
    f === :stqe_next && return Ptr{xml_attribute}(getfield(x, f))
    return getfield(x, f)
end

struct xml_attribute
    data::NTuple{4168,UInt8}
end

function Base.getproperty(x::Ptr{xml_attribute}, f::Symbol)
    f === :key && return Ptr{NTuple{2080,Cchar}}(x + 0)
    f === :value && return Ptr{NTuple{2080,Cchar}}(x + 2080)
    f === :list_entries && return Ptr{Cvoid}(x + 4160)
    return getfield(x, f)
end

function Base.getproperty(x::xml_attribute, f::Symbol)
    r = Ref{xml_attribute}(x)
    ptr = Base.unsafe_convert(Ptr{xml_attribute}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{xml_attribute}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function lxw_new_attribute_str(key, value)
    @ccall libxlsxwriter.lxw_new_attribute_str(
        key::Cstring,
        value::Cstring,
    )::Ptr{xml_attribute}
end

function lxw_new_attribute_int(key, value)
    @ccall libxlsxwriter.lxw_new_attribute_int(
        key::Cstring,
        value::Int32,
    )::Ptr{xml_attribute}
end

function lxw_new_attribute_dbl(key, value)
    @ccall libxlsxwriter.lxw_new_attribute_dbl(
        key::Cstring,
        value::Cdouble,
    )::Ptr{xml_attribute}
end

function lxw_name_to_row(row_str)
    @ccall libxlsxwriter.lxw_name_to_row(row_str::Cstring)::UInt32
end

function lxw_name_to_col(col_str)
    @ccall libxlsxwriter.lxw_name_to_col(col_str::Cstring)::UInt16
end

function lxw_name_to_col_2(col_str)
    @ccall libxlsxwriter.lxw_name_to_col_2(col_str::Cstring)::UInt16
end

function lxw_name_to_row_2(row_str)
    @ccall libxlsxwriter.lxw_name_to_row_2(row_str::Cstring)::UInt32
end

const lxw_row_t = UInt32

const lxw_col_t = UInt16

@cenum lxw_boolean::UInt32 begin
    LXW_FALSE = 0
    LXW_TRUE = 1
    LXW_EXPLICIT_FALSE = 2
end

@cenum lxw_error::UInt32 begin
    LXW_NO_ERROR = 0
    LXW_ERROR_MEMORY_MALLOC_FAILED = 1
    LXW_ERROR_CREATING_XLSX_FILE = 2
    LXW_ERROR_CREATING_TMPFILE = 3
    LXW_ERROR_READING_TMPFILE = 4
    LXW_ERROR_ZIP_FILE_OPERATION = 5
    LXW_ERROR_ZIP_PARAMETER_ERROR = 6
    LXW_ERROR_ZIP_BAD_ZIP_FILE = 7
    LXW_ERROR_ZIP_INTERNAL_ERROR = 8
    LXW_ERROR_ZIP_FILE_ADD = 9
    LXW_ERROR_ZIP_CLOSE = 10
    LXW_ERROR_FEATURE_NOT_SUPPORTED = 11
    LXW_ERROR_NULL_PARAMETER_IGNORED = 12
    LXW_ERROR_PARAMETER_VALIDATION = 13
    LXW_ERROR_PARAMETER_IS_EMPTY = 14
    LXW_ERROR_SHEETNAME_LENGTH_EXCEEDED = 15
    LXW_ERROR_INVALID_SHEETNAME_CHARACTER = 16
    LXW_ERROR_SHEETNAME_START_END_APOSTROPHE = 17
    LXW_ERROR_SHEETNAME_ALREADY_USED = 18
    LXW_ERROR_32_STRING_LENGTH_EXCEEDED = 19
    LXW_ERROR_128_STRING_LENGTH_EXCEEDED = 20
    LXW_ERROR_255_STRING_LENGTH_EXCEEDED = 21
    LXW_ERROR_MAX_STRING_LENGTH_EXCEEDED = 22
    LXW_ERROR_SHARED_STRING_INDEX_NOT_FOUND = 23
    LXW_ERROR_WORKSHEET_INDEX_OUT_OF_RANGE = 24
    LXW_ERROR_WORKSHEET_MAX_URL_LENGTH_EXCEEDED = 25
    LXW_ERROR_WORKSHEET_MAX_NUMBER_URLS_EXCEEDED = 26
    LXW_ERROR_IMAGE_DIMENSIONS = 27
    LXW_MAX_ERRNO = 28
end

struct lxw_datetime
    year::Cint
    month::Cint
    day::Cint
    hour::Cint
    min::Cint
    sec::Cdouble
end

@cenum lxw_custom_property_types::UInt32 begin
    LXW_CUSTOM_NONE = 0
    LXW_CUSTOM_STRING = 1
    LXW_CUSTOM_DOUBLE = 2
    LXW_CUSTOM_INTEGER = 3
    LXW_CUSTOM_BOOLEAN = 4
    LXW_CUSTOM_DATETIME = 5
end

struct lxw_formats
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_format}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_format}}
end

function Base.getproperty(x::lxw_formats, f::Symbol)
    f === :stqh_first && return Ptr{lxw_format}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_format}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_tuples
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_tuple}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_tuple}}
end

function Base.getproperty(x::lxw_tuples, f::Symbol)
    f === :stqh_first && return Ptr{lxw_tuple}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_tuple}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_custom_properties
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_custom_property}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_custom_property}}
end

function Base.getproperty(x::lxw_custom_properties, f::Symbol)
    f === :stqh_first && return Ptr{lxw_custom_property}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_custom_property}}(getfield(x, f))
    return getfield(x, f)
end

struct __JL_Ctag_12
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_tuple}
end

function Base.getproperty(x::__JL_Ctag_12, f::Symbol)
    f === :stqe_next && return Ptr{lxw_tuple}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_tuple
    data::NTuple{24,UInt8}
end

function Base.getproperty(x::Ptr{lxw_tuple}, f::Symbol)
    f === :key && return Ptr{Cstring}(x + 0)
    f === :value && return Ptr{Cstring}(x + 8)
    f === :list_pointers && return Ptr{Cvoid}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_tuple, f::Symbol)
    r = Ref{lxw_tuple}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_tuple}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_tuple}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_30
    data::NTuple{32,UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_30}, f::Symbol)
    f === :string && return Ptr{Cstring}(x + 0)
    f === :number && return Ptr{Cdouble}(x + 0)
    f === :integer && return Ptr{Int32}(x + 0)
    f === :boolean && return Ptr{UInt8}(x + 0)
    f === :datetime && return Ptr{lxw_datetime}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_30, f::Symbol)
    r = Ref{__JL_Ctag_30}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_30}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_30}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_31
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_custom_property}
end

function Base.getproperty(x::__JL_Ctag_31, f::Symbol)
    f === :stqe_next && return Ptr{lxw_custom_property}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_custom_property
    data::NTuple{56,UInt8}
end

function Base.getproperty(x::Ptr{lxw_custom_property}, f::Symbol)
    f === :type && return Ptr{lxw_custom_property_types}(x + 0)
    f === :name && return Ptr{Cstring}(x + 8)
    f === :u && return Ptr{__JL_Ctag_30}(x + 16)
    f === :list_pointers && return Ptr{Cvoid}(x + 48)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_custom_property, f::Symbol)
    r = Ref{lxw_custom_property}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_custom_property}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_custom_property}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct sst_rb_tree
    rbh_root::Ptr{Cvoid} # rbh_root::Ptr{sst_element}
end

function Base.getproperty(x::sst_rb_tree, f::Symbol)
    f === :rbh_root && return Ptr{sst_element}(getfield(x, f))
    return getfield(x, f)
end

struct sst_order_list
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{sst_element}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{sst_element}}
end

function Base.getproperty(x::sst_order_list, f::Symbol)
    f === :stqh_first && return Ptr{sst_element}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{sst_element}}(getfield(x, f))
    return getfield(x, f)
end

struct __JL_Ctag_18
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{sst_element}
end

function Base.getproperty(x::__JL_Ctag_18, f::Symbol)
    f === :stqe_next && return Ptr{sst_element}(getfield(x, f))
    return getfield(x, f)
end

struct __JL_Ctag_19
    rbe_left::Ptr{Cvoid} # rbe_left::Ptr{sst_element}
    rbe_right::Ptr{Cvoid} # rbe_right::Ptr{sst_element}
    rbe_parent::Ptr{Cvoid} # rbe_parent::Ptr{sst_element}
    rbe_color::Cint
end

function Base.getproperty(x::__JL_Ctag_19, f::Symbol)
    f === :rbe_left && return Ptr{sst_element}(getfield(x, f))
    f === :rbe_right && return Ptr{sst_element}(getfield(x, f))
    f === :rbe_parent && return Ptr{sst_element}(getfield(x, f))
    return getfield(x, f)
end

struct sst_element
    data::NTuple{64,UInt8}
end

function Base.getproperty(x::Ptr{sst_element}, f::Symbol)
    f === :index && return Ptr{UInt32}(x + 0)
    f === :string && return Ptr{Cstring}(x + 8)
    f === :is_rich_string && return Ptr{UInt8}(x + 16)
    f === :sst_order_pointers && return Ptr{Cvoid}(x + 24)
    f === :sst_tree_pointers && return Ptr{Cvoid}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::sst_element, f::Symbol)
    r = Ref{sst_element}(x)
    ptr = Base.unsafe_convert(Ptr{sst_element}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{sst_element}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_sst
    file::Ptr{Libc.FILE}
    string_count::UInt32
    unique_count::UInt32
    order_list::Ptr{sst_order_list}
    rb_tree::Ptr{sst_rb_tree}
end

function lxw_sst_new()
    @ccall libxlsxwriter.lxw_sst_new()::Ptr{lxw_sst}
end

function lxw_sst_free(sst)
    @ccall libxlsxwriter.lxw_sst_free(sst::Ptr{lxw_sst})::Cvoid
end

function lxw_get_sst_index(sst, string, is_rich_string)
    @ccall libxlsxwriter.lxw_get_sst_index(
        sst::Ptr{lxw_sst},
        string::Cstring,
        is_rich_string::UInt8,
    )::Ptr{sst_element}
end

function lxw_sst_assemble_xml_file(self)
    @ccall libxlsxwriter.lxw_sst_assemble_xml_file(self::Ptr{lxw_sst})::Cvoid
end

struct lxw_hash_order_list
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_hash_element}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_hash_element}}
end

function Base.getproperty(x::lxw_hash_order_list, f::Symbol)
    f === :stqh_first && return Ptr{lxw_hash_element}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_hash_element}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_hash_bucket_list
    slh_first::Ptr{Cvoid} # slh_first::Ptr{lxw_hash_element}
end

function Base.getproperty(x::lxw_hash_bucket_list, f::Symbol)
    f === :slh_first && return Ptr{lxw_hash_element}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_hash_table
    num_buckets::UInt32
    used_buckets::UInt32
    unique_count::UInt32
    free_key::UInt8
    free_value::UInt8
    order_list::Ptr{lxw_hash_order_list}
    buckets::Ptr{Ptr{lxw_hash_bucket_list}}
end

struct __JL_Ctag_13
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_hash_element}
end

function Base.getproperty(x::__JL_Ctag_13, f::Symbol)
    f === :stqe_next && return Ptr{lxw_hash_element}(getfield(x, f))
    return getfield(x, f)
end

struct __JL_Ctag_14
    sle_next::Ptr{Cvoid} # sle_next::Ptr{lxw_hash_element}
end

function Base.getproperty(x::__JL_Ctag_14, f::Symbol)
    f === :sle_next && return Ptr{lxw_hash_element}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_hash_element
    data::NTuple{32,UInt8}
end

function Base.getproperty(x::Ptr{lxw_hash_element}, f::Symbol)
    f === :key && return Ptr{Ptr{Cvoid}}(x + 0)
    f === :value && return Ptr{Ptr{Cvoid}}(x + 8)
    f === :lxw_hash_order_pointers && return Ptr{Cvoid}(x + 16)
    f === :lxw_hash_list_pointers && return Ptr{Cvoid}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_hash_element, f::Symbol)
    r = Ref{lxw_hash_element}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_hash_element}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_hash_element}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function lxw_hash_key_exists(lxw_hash, key, key_len)
    @ccall libxlsxwriter.lxw_hash_key_exists(
        lxw_hash::Ptr{lxw_hash_table},
        key::Ptr{Cvoid},
        key_len::Csize_t,
    )::Ptr{lxw_hash_element}
end

function lxw_insert_hash_element(lxw_hash, key, value, key_len)
    @ccall libxlsxwriter.lxw_insert_hash_element(
        lxw_hash::Ptr{lxw_hash_table},
        key::Ptr{Cvoid},
        value::Ptr{Cvoid},
        key_len::Csize_t,
    )::Ptr{lxw_hash_element}
end

function lxw_hash_new(num_buckets, free_key, free_value)
    @ccall libxlsxwriter.lxw_hash_new(
        num_buckets::UInt32,
        free_key::UInt8,
        free_value::UInt8,
    )::Ptr{lxw_hash_table}
end

function lxw_hash_free(lxw_hash)
    @ccall libxlsxwriter.lxw_hash_free(lxw_hash::Ptr{lxw_hash_table})::Cvoid
end

const lxw_color_t = UInt32

@cenum lxw_format_underlines::UInt32 begin
    LXW_UNDERLINE_NONE = 0
    LXW_UNDERLINE_SINGLE = 1
    LXW_UNDERLINE_DOUBLE = 2
    LXW_UNDERLINE_SINGLE_ACCOUNTING = 3
    LXW_UNDERLINE_DOUBLE_ACCOUNTING = 4
end

@cenum lxw_format_scripts::UInt32 begin
    LXW_FONT_SUPERSCRIPT = 1
    LXW_FONT_SUBSCRIPT = 2
end

@cenum lxw_format_alignments::UInt32 begin
    LXW_ALIGN_NONE = 0
    LXW_ALIGN_LEFT = 1
    LXW_ALIGN_CENTER = 2
    LXW_ALIGN_RIGHT = 3
    LXW_ALIGN_FILL = 4
    LXW_ALIGN_JUSTIFY = 5
    LXW_ALIGN_CENTER_ACROSS = 6
    LXW_ALIGN_DISTRIBUTED = 7
    LXW_ALIGN_VERTICAL_TOP = 8
    LXW_ALIGN_VERTICAL_BOTTOM = 9
    LXW_ALIGN_VERTICAL_CENTER = 10
    LXW_ALIGN_VERTICAL_JUSTIFY = 11
    LXW_ALIGN_VERTICAL_DISTRIBUTED = 12
end

@cenum lxw_format_diagonal_types::UInt32 begin
    LXW_DIAGONAL_BORDER_UP = 1
    LXW_DIAGONAL_BORDER_DOWN = 2
    LXW_DIAGONAL_BORDER_UP_DOWN = 3
end

@cenum lxw_defined_colors::UInt32 begin
    LXW_COLOR_BLACK = 16777216
    LXW_COLOR_BLUE = 255
    LXW_COLOR_BROWN = 8388608
    LXW_COLOR_CYAN = 65535
    LXW_COLOR_GRAY = 8421504
    LXW_COLOR_GREEN = 32768
    LXW_COLOR_LIME = 65280
    LXW_COLOR_MAGENTA = 16711935
    LXW_COLOR_NAVY = 128
    LXW_COLOR_ORANGE = 16737792
    LXW_COLOR_PINK = 16711935
    LXW_COLOR_PURPLE = 8388736
    LXW_COLOR_RED = 16711680
    LXW_COLOR_SILVER = 12632256
    LXW_COLOR_WHITE = 16777215
    LXW_COLOR_YELLOW = 16776960
end

@cenum lxw_format_patterns::UInt32 begin
    LXW_PATTERN_NONE = 0
    LXW_PATTERN_SOLID = 1
    LXW_PATTERN_MEDIUM_GRAY = 2
    LXW_PATTERN_DARK_GRAY = 3
    LXW_PATTERN_LIGHT_GRAY = 4
    LXW_PATTERN_DARK_HORIZONTAL = 5
    LXW_PATTERN_DARK_VERTICAL = 6
    LXW_PATTERN_DARK_DOWN = 7
    LXW_PATTERN_DARK_UP = 8
    LXW_PATTERN_DARK_GRID = 9
    LXW_PATTERN_DARK_TRELLIS = 10
    LXW_PATTERN_LIGHT_HORIZONTAL = 11
    LXW_PATTERN_LIGHT_VERTICAL = 12
    LXW_PATTERN_LIGHT_DOWN = 13
    LXW_PATTERN_LIGHT_UP = 14
    LXW_PATTERN_LIGHT_GRID = 15
    LXW_PATTERN_LIGHT_TRELLIS = 16
    LXW_PATTERN_GRAY_125 = 17
    LXW_PATTERN_GRAY_0625 = 18
end

@cenum lxw_format_borders::UInt32 begin
    LXW_BORDER_NONE = 0
    LXW_BORDER_THIN = 1
    LXW_BORDER_MEDIUM = 2
    LXW_BORDER_DASHED = 3
    LXW_BORDER_DOTTED = 4
    LXW_BORDER_THICK = 5
    LXW_BORDER_DOUBLE = 6
    LXW_BORDER_HAIR = 7
    LXW_BORDER_MEDIUM_DASHED = 8
    LXW_BORDER_DASH_DOT = 9
    LXW_BORDER_MEDIUM_DASH_DOT = 10
    LXW_BORDER_DASH_DOT_DOT = 11
    LXW_BORDER_MEDIUM_DASH_DOT_DOT = 12
    LXW_BORDER_SLANT_DASH_DOT = 13
end

struct __JL_Ctag_23
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_format}
end

function Base.getproperty(x::__JL_Ctag_23, f::Symbol)
    f === :stqe_next && return Ptr{lxw_format}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_format
    data::NTuple{568,UInt8}
end

function Base.getproperty(x::Ptr{lxw_format}, f::Symbol)
    f === :file && return Ptr{Ptr{Libc.FILE}}(x + 0)
    f === :xf_format_indices && return Ptr{Ptr{lxw_hash_table}}(x + 8)
    f === :dxf_format_indices && return Ptr{Ptr{lxw_hash_table}}(x + 16)
    f === :num_xf_formats && return Ptr{Ptr{UInt16}}(x + 24)
    f === :num_dxf_formats && return Ptr{Ptr{UInt16}}(x + 32)
    f === :xf_index && return Ptr{Int32}(x + 40)
    f === :dxf_index && return Ptr{Int32}(x + 44)
    f === :xf_id && return Ptr{Int32}(x + 48)
    f === :num_format && return Ptr{NTuple{128,Cchar}}(x + 52)
    f === :font_name && return Ptr{NTuple{128,Cchar}}(x + 180)
    f === :font_scheme && return Ptr{NTuple{128,Cchar}}(x + 308)
    f === :num_format_index && return Ptr{UInt16}(x + 436)
    f === :font_index && return Ptr{UInt16}(x + 438)
    f === :has_font && return Ptr{UInt8}(x + 440)
    f === :has_dxf_font && return Ptr{UInt8}(x + 441)
    f === :font_size && return Ptr{Cdouble}(x + 448)
    f === :bold && return Ptr{UInt8}(x + 456)
    f === :italic && return Ptr{UInt8}(x + 457)
    f === :font_color && return Ptr{lxw_color_t}(x + 460)
    f === :underline && return Ptr{UInt8}(x + 464)
    f === :font_strikeout && return Ptr{UInt8}(x + 465)
    f === :font_outline && return Ptr{UInt8}(x + 466)
    f === :font_shadow && return Ptr{UInt8}(x + 467)
    f === :font_script && return Ptr{UInt8}(x + 468)
    f === :font_family && return Ptr{UInt8}(x + 469)
    f === :font_charset && return Ptr{UInt8}(x + 470)
    f === :font_condense && return Ptr{UInt8}(x + 471)
    f === :font_extend && return Ptr{UInt8}(x + 472)
    f === :theme && return Ptr{UInt8}(x + 473)
    f === :hyperlink && return Ptr{UInt8}(x + 474)
    f === :hidden && return Ptr{UInt8}(x + 475)
    f === :locked && return Ptr{UInt8}(x + 476)
    f === :text_h_align && return Ptr{UInt8}(x + 477)
    f === :text_wrap && return Ptr{UInt8}(x + 478)
    f === :text_v_align && return Ptr{UInt8}(x + 479)
    f === :text_justlast && return Ptr{UInt8}(x + 480)
    f === :rotation && return Ptr{Int16}(x + 482)
    f === :fg_color && return Ptr{lxw_color_t}(x + 484)
    f === :bg_color && return Ptr{lxw_color_t}(x + 488)
    f === :dxf_fg_color && return Ptr{lxw_color_t}(x + 492)
    f === :dxf_bg_color && return Ptr{lxw_color_t}(x + 496)
    f === :pattern && return Ptr{UInt8}(x + 500)
    f === :has_fill && return Ptr{UInt8}(x + 501)
    f === :has_dxf_fill && return Ptr{UInt8}(x + 502)
    f === :fill_index && return Ptr{Int32}(x + 504)
    f === :fill_count && return Ptr{Int32}(x + 508)
    f === :border_index && return Ptr{Int32}(x + 512)
    f === :has_border && return Ptr{UInt8}(x + 516)
    f === :has_dxf_border && return Ptr{UInt8}(x + 517)
    f === :border_count && return Ptr{Int32}(x + 520)
    f === :bottom && return Ptr{UInt8}(x + 524)
    f === :diag_border && return Ptr{UInt8}(x + 525)
    f === :diag_type && return Ptr{UInt8}(x + 526)
    f === :left && return Ptr{UInt8}(x + 527)
    f === :right && return Ptr{UInt8}(x + 528)
    f === :top && return Ptr{UInt8}(x + 529)
    f === :bottom_color && return Ptr{lxw_color_t}(x + 532)
    f === :diag_color && return Ptr{lxw_color_t}(x + 536)
    f === :left_color && return Ptr{lxw_color_t}(x + 540)
    f === :right_color && return Ptr{lxw_color_t}(x + 544)
    f === :top_color && return Ptr{lxw_color_t}(x + 548)
    f === :indent && return Ptr{UInt8}(x + 552)
    f === :shrink && return Ptr{UInt8}(x + 553)
    f === :merge_range && return Ptr{UInt8}(x + 554)
    f === :reading_order && return Ptr{UInt8}(x + 555)
    f === :just_distrib && return Ptr{UInt8}(x + 556)
    f === :color_indexed && return Ptr{UInt8}(x + 557)
    f === :font_only && return Ptr{UInt8}(x + 558)
    f === :quote_prefix && return Ptr{UInt8}(x + 559)
    f === :list_pointers && return Ptr{Cvoid}(x + 560)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_format, f::Symbol)
    r = Ref{lxw_format}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_format}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_format}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_font
    font_name::NTuple{128,Cchar}
    font_size::Cdouble
    bold::UInt8
    italic::UInt8
    underline::UInt8
    theme::UInt8
    font_strikeout::UInt8
    font_outline::UInt8
    font_shadow::UInt8
    font_script::UInt8
    font_family::UInt8
    font_charset::UInt8
    font_condense::UInt8
    font_extend::UInt8
    font_color::lxw_color_t
end

struct lxw_border
    bottom::UInt8
    diag_border::UInt8
    diag_type::UInt8
    left::UInt8
    right::UInt8
    top::UInt8
    bottom_color::lxw_color_t
    diag_color::lxw_color_t
    left_color::lxw_color_t
    right_color::lxw_color_t
    top_color::lxw_color_t
end

struct lxw_fill
    fg_color::lxw_color_t
    bg_color::lxw_color_t
    pattern::UInt8
end

function lxw_format_new()
    @ccall libxlsxwriter.lxw_format_new()::Ptr{lxw_format}
end

function lxw_format_free(format)
    @ccall libxlsxwriter.lxw_format_free(format::Ptr{lxw_format})::Cvoid
end

function lxw_format_get_xf_index(format)
    @ccall libxlsxwriter.lxw_format_get_xf_index(format::Ptr{lxw_format})::Int32
end

function lxw_format_get_dxf_index(format)
    @ccall libxlsxwriter.lxw_format_get_dxf_index(format::Ptr{lxw_format})::Int32
end

function lxw_format_get_font_key(format)
    @ccall libxlsxwriter.lxw_format_get_font_key(format::Ptr{lxw_format})::Ptr{lxw_font}
end

function lxw_format_get_border_key(format)
    @ccall libxlsxwriter.lxw_format_get_border_key(format::Ptr{lxw_format})::Ptr{lxw_border}
end

function lxw_format_get_fill_key(format)
    @ccall libxlsxwriter.lxw_format_get_fill_key(format::Ptr{lxw_format})::Ptr{lxw_fill}
end

function format_set_font_name(format, font_name)
    @ccall libxlsxwriter.format_set_font_name(
        format::Ptr{lxw_format},
        font_name::Cstring,
    )::Cvoid
end

function format_set_font_size(format, size)
    @ccall libxlsxwriter.format_set_font_size(format::Ptr{lxw_format}, size::Cdouble)::Cvoid
end

function format_set_font_color(format, color)
    @ccall libxlsxwriter.format_set_font_color(
        format::Ptr{lxw_format},
        color::lxw_color_t,
    )::Cvoid
end

function format_set_bold(format)
    @ccall libxlsxwriter.format_set_bold(format::Ptr{lxw_format})::Cvoid
end

function format_set_italic(format)
    @ccall libxlsxwriter.format_set_italic(format::Ptr{lxw_format})::Cvoid
end

function format_set_underline(format, style)
    @ccall libxlsxwriter.format_set_underline(format::Ptr{lxw_format}, style::UInt8)::Cvoid
end

function format_set_font_strikeout(format)
    @ccall libxlsxwriter.format_set_font_strikeout(format::Ptr{lxw_format})::Cvoid
end

function format_set_font_script(format, style)
    @ccall libxlsxwriter.format_set_font_script(
        format::Ptr{lxw_format},
        style::UInt8,
    )::Cvoid
end

function format_set_num_format(format, num_format)
    @ccall libxlsxwriter.format_set_num_format(
        format::Ptr{lxw_format},
        num_format::Cstring,
    )::Cvoid
end

function format_set_num_format_index(format, index)
    @ccall libxlsxwriter.format_set_num_format_index(
        format::Ptr{lxw_format},
        index::UInt8,
    )::Cvoid
end

function format_set_unlocked(format)
    @ccall libxlsxwriter.format_set_unlocked(format::Ptr{lxw_format})::Cvoid
end

function format_set_hidden(format)
    @ccall libxlsxwriter.format_set_hidden(format::Ptr{lxw_format})::Cvoid
end

function format_set_align(format, alignment)
    @ccall libxlsxwriter.format_set_align(format::Ptr{lxw_format}, alignment::UInt8)::Cvoid
end

function format_set_text_wrap(format)
    @ccall libxlsxwriter.format_set_text_wrap(format::Ptr{lxw_format})::Cvoid
end

function format_set_rotation(format, angle)
    @ccall libxlsxwriter.format_set_rotation(format::Ptr{lxw_format}, angle::Int16)::Cvoid
end

function format_set_indent(format, level)
    @ccall libxlsxwriter.format_set_indent(format::Ptr{lxw_format}, level::UInt8)::Cvoid
end

function format_set_shrink(format)
    @ccall libxlsxwriter.format_set_shrink(format::Ptr{lxw_format})::Cvoid
end

function format_set_pattern(format, index)
    @ccall libxlsxwriter.format_set_pattern(format::Ptr{lxw_format}, index::UInt8)::Cvoid
end

function format_set_bg_color(format, color)
    @ccall libxlsxwriter.format_set_bg_color(
        format::Ptr{lxw_format},
        color::lxw_color_t,
    )::Cvoid
end

function format_set_fg_color(format, color)
    @ccall libxlsxwriter.format_set_fg_color(
        format::Ptr{lxw_format},
        color::lxw_color_t,
    )::Cvoid
end

function format_set_border(format, style)
    @ccall libxlsxwriter.format_set_border(format::Ptr{lxw_format}, style::UInt8)::Cvoid
end

function format_set_bottom(format, style)
    @ccall libxlsxwriter.format_set_bottom(format::Ptr{lxw_format}, style::UInt8)::Cvoid
end

function format_set_top(format, style)
    @ccall libxlsxwriter.format_set_top(format::Ptr{lxw_format}, style::UInt8)::Cvoid
end

function format_set_left(format, style)
    @ccall libxlsxwriter.format_set_left(format::Ptr{lxw_format}, style::UInt8)::Cvoid
end

function format_set_right(format, style)
    @ccall libxlsxwriter.format_set_right(format::Ptr{lxw_format}, style::UInt8)::Cvoid
end

function format_set_border_color(format, color)
    @ccall libxlsxwriter.format_set_border_color(
        format::Ptr{lxw_format},
        color::lxw_color_t,
    )::Cvoid
end

function format_set_bottom_color(format, color)
    @ccall libxlsxwriter.format_set_bottom_color(
        format::Ptr{lxw_format},
        color::lxw_color_t,
    )::Cvoid
end

function format_set_top_color(format, color)
    @ccall libxlsxwriter.format_set_top_color(
        format::Ptr{lxw_format},
        color::lxw_color_t,
    )::Cvoid
end

function format_set_left_color(format, color)
    @ccall libxlsxwriter.format_set_left_color(
        format::Ptr{lxw_format},
        color::lxw_color_t,
    )::Cvoid
end

function format_set_right_color(format, color)
    @ccall libxlsxwriter.format_set_right_color(
        format::Ptr{lxw_format},
        color::lxw_color_t,
    )::Cvoid
end

function format_set_diag_type(format, type)
    @ccall libxlsxwriter.format_set_diag_type(format::Ptr{lxw_format}, type::UInt8)::Cvoid
end

function format_set_diag_border(format, style)
    @ccall libxlsxwriter.format_set_diag_border(
        format::Ptr{lxw_format},
        style::UInt8,
    )::Cvoid
end

function format_set_diag_color(format, color)
    @ccall libxlsxwriter.format_set_diag_color(
        format::Ptr{lxw_format},
        color::lxw_color_t,
    )::Cvoid
end

function format_set_quote_prefix(format)
    @ccall libxlsxwriter.format_set_quote_prefix(format::Ptr{lxw_format})::Cvoid
end

function format_set_font_outline(format)
    @ccall libxlsxwriter.format_set_font_outline(format::Ptr{lxw_format})::Cvoid
end

function format_set_font_shadow(format)
    @ccall libxlsxwriter.format_set_font_shadow(format::Ptr{lxw_format})::Cvoid
end

function format_set_font_family(format, value)
    @ccall libxlsxwriter.format_set_font_family(
        format::Ptr{lxw_format},
        value::UInt8,
    )::Cvoid
end

function format_set_font_charset(format, value)
    @ccall libxlsxwriter.format_set_font_charset(
        format::Ptr{lxw_format},
        value::UInt8,
    )::Cvoid
end

function format_set_font_scheme(format, font_scheme)
    @ccall libxlsxwriter.format_set_font_scheme(
        format::Ptr{lxw_format},
        font_scheme::Cstring,
    )::Cvoid
end

function format_set_font_condense(format)
    @ccall libxlsxwriter.format_set_font_condense(format::Ptr{lxw_format})::Cvoid
end

function format_set_font_extend(format)
    @ccall libxlsxwriter.format_set_font_extend(format::Ptr{lxw_format})::Cvoid
end

function format_set_reading_order(format, value)
    @ccall libxlsxwriter.format_set_reading_order(
        format::Ptr{lxw_format},
        value::UInt8,
    )::Cvoid
end

function format_set_theme(format, value)
    @ccall libxlsxwriter.format_set_theme(format::Ptr{lxw_format}, value::UInt8)::Cvoid
end

function format_set_hyperlink(format)
    @ccall libxlsxwriter.format_set_hyperlink(format::Ptr{lxw_format})::Cvoid
end

function format_set_color_indexed(format, value)
    @ccall libxlsxwriter.format_set_color_indexed(
        format::Ptr{lxw_format},
        value::UInt8,
    )::Cvoid
end

function format_set_font_only(format)
    @ccall libxlsxwriter.format_set_font_only(format::Ptr{lxw_format})::Cvoid
end

struct lxw_chart_series_list
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_chart_series}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_chart_series}}
end

function Base.getproperty(x::lxw_chart_series_list, f::Symbol)
    f === :stqh_first && return Ptr{lxw_chart_series}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_chart_series}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_series_data_points
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_series_data_point}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_series_data_point}}
end

function Base.getproperty(x::lxw_series_data_points, f::Symbol)
    f === :stqh_first && return Ptr{lxw_series_data_point}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_series_data_point}}(getfield(x, f))
    return getfield(x, f)
end

@cenum lxw_chart_type::UInt32 begin
    LXW_CHART_NONE = 0
    LXW_CHART_AREA = 1
    LXW_CHART_AREA_STACKED = 2
    LXW_CHART_AREA_STACKED_PERCENT = 3
    LXW_CHART_BAR = 4
    LXW_CHART_BAR_STACKED = 5
    LXW_CHART_BAR_STACKED_PERCENT = 6
    LXW_CHART_COLUMN = 7
    LXW_CHART_COLUMN_STACKED = 8
    LXW_CHART_COLUMN_STACKED_PERCENT = 9
    LXW_CHART_DOUGHNUT = 10
    LXW_CHART_LINE = 11
    LXW_CHART_LINE_STACKED = 12
    LXW_CHART_LINE_STACKED_PERCENT = 13
    LXW_CHART_PIE = 14
    LXW_CHART_SCATTER = 15
    LXW_CHART_SCATTER_STRAIGHT = 16
    LXW_CHART_SCATTER_STRAIGHT_WITH_MARKERS = 17
    LXW_CHART_SCATTER_SMOOTH = 18
    LXW_CHART_SCATTER_SMOOTH_WITH_MARKERS = 19
    LXW_CHART_RADAR = 20
    LXW_CHART_RADAR_WITH_MARKERS = 21
    LXW_CHART_RADAR_FILLED = 22
end

@cenum lxw_chart_legend_position::UInt32 begin
    LXW_CHART_LEGEND_NONE = 0
    LXW_CHART_LEGEND_RIGHT = 1
    LXW_CHART_LEGEND_LEFT = 2
    LXW_CHART_LEGEND_TOP = 3
    LXW_CHART_LEGEND_BOTTOM = 4
    LXW_CHART_LEGEND_TOP_RIGHT = 5
    LXW_CHART_LEGEND_OVERLAY_RIGHT = 6
    LXW_CHART_LEGEND_OVERLAY_LEFT = 7
    LXW_CHART_LEGEND_OVERLAY_TOP_RIGHT = 8
end

@cenum lxw_chart_line_dash_type::UInt32 begin
    LXW_CHART_LINE_DASH_SOLID = 0
    LXW_CHART_LINE_DASH_ROUND_DOT = 1
    LXW_CHART_LINE_DASH_SQUARE_DOT = 2
    LXW_CHART_LINE_DASH_DASH = 3
    LXW_CHART_LINE_DASH_DASH_DOT = 4
    LXW_CHART_LINE_DASH_LONG_DASH = 5
    LXW_CHART_LINE_DASH_LONG_DASH_DOT = 6
    LXW_CHART_LINE_DASH_LONG_DASH_DOT_DOT = 7
    LXW_CHART_LINE_DASH_DOT = 8
    LXW_CHART_LINE_DASH_SYSTEM_DASH_DOT = 9
    LXW_CHART_LINE_DASH_SYSTEM_DASH_DOT_DOT = 10
end

@cenum lxw_chart_marker_type::UInt32 begin
    LXW_CHART_MARKER_AUTOMATIC = 0
    LXW_CHART_MARKER_NONE = 1
    LXW_CHART_MARKER_SQUARE = 2
    LXW_CHART_MARKER_DIAMOND = 3
    LXW_CHART_MARKER_TRIANGLE = 4
    LXW_CHART_MARKER_X = 5
    LXW_CHART_MARKER_STAR = 6
    LXW_CHART_MARKER_SHORT_DASH = 7
    LXW_CHART_MARKER_LONG_DASH = 8
    LXW_CHART_MARKER_CIRCLE = 9
    LXW_CHART_MARKER_PLUS = 10
end

@cenum lxw_chart_pattern_type::UInt32 begin
    LXW_CHART_PATTERN_NONE = 0
    LXW_CHART_PATTERN_PERCENT_5 = 1
    LXW_CHART_PATTERN_PERCENT_10 = 2
    LXW_CHART_PATTERN_PERCENT_20 = 3
    LXW_CHART_PATTERN_PERCENT_25 = 4
    LXW_CHART_PATTERN_PERCENT_30 = 5
    LXW_CHART_PATTERN_PERCENT_40 = 6
    LXW_CHART_PATTERN_PERCENT_50 = 7
    LXW_CHART_PATTERN_PERCENT_60 = 8
    LXW_CHART_PATTERN_PERCENT_70 = 9
    LXW_CHART_PATTERN_PERCENT_75 = 10
    LXW_CHART_PATTERN_PERCENT_80 = 11
    LXW_CHART_PATTERN_PERCENT_90 = 12
    LXW_CHART_PATTERN_LIGHT_DOWNWARD_DIAGONAL = 13
    LXW_CHART_PATTERN_LIGHT_UPWARD_DIAGONAL = 14
    LXW_CHART_PATTERN_DARK_DOWNWARD_DIAGONAL = 15
    LXW_CHART_PATTERN_DARK_UPWARD_DIAGONAL = 16
    LXW_CHART_PATTERN_WIDE_DOWNWARD_DIAGONAL = 17
    LXW_CHART_PATTERN_WIDE_UPWARD_DIAGONAL = 18
    LXW_CHART_PATTERN_LIGHT_VERTICAL = 19
    LXW_CHART_PATTERN_LIGHT_HORIZONTAL = 20
    LXW_CHART_PATTERN_NARROW_VERTICAL = 21
    LXW_CHART_PATTERN_NARROW_HORIZONTAL = 22
    LXW_CHART_PATTERN_DARK_VERTICAL = 23
    LXW_CHART_PATTERN_DARK_HORIZONTAL = 24
    LXW_CHART_PATTERN_DASHED_DOWNWARD_DIAGONAL = 25
    LXW_CHART_PATTERN_DASHED_UPWARD_DIAGONAL = 26
    LXW_CHART_PATTERN_DASHED_HORIZONTAL = 27
    LXW_CHART_PATTERN_DASHED_VERTICAL = 28
    LXW_CHART_PATTERN_SMALL_CONFETTI = 29
    LXW_CHART_PATTERN_LARGE_CONFETTI = 30
    LXW_CHART_PATTERN_ZIGZAG = 31
    LXW_CHART_PATTERN_WAVE = 32
    LXW_CHART_PATTERN_DIAGONAL_BRICK = 33
    LXW_CHART_PATTERN_HORIZONTAL_BRICK = 34
    LXW_CHART_PATTERN_WEAVE = 35
    LXW_CHART_PATTERN_PLAID = 36
    LXW_CHART_PATTERN_DIVOT = 37
    LXW_CHART_PATTERN_DOTTED_GRID = 38
    LXW_CHART_PATTERN_DOTTED_DIAMOND = 39
    LXW_CHART_PATTERN_SHINGLE = 40
    LXW_CHART_PATTERN_TRELLIS = 41
    LXW_CHART_PATTERN_SPHERE = 42
    LXW_CHART_PATTERN_SMALL_GRID = 43
    LXW_CHART_PATTERN_LARGE_GRID = 44
    LXW_CHART_PATTERN_SMALL_CHECK = 45
    LXW_CHART_PATTERN_LARGE_CHECK = 46
    LXW_CHART_PATTERN_OUTLINED_DIAMOND = 47
    LXW_CHART_PATTERN_SOLID_DIAMOND = 48
end

@cenum lxw_chart_label_position::UInt32 begin
    LXW_CHART_LABEL_POSITION_DEFAULT = 0
    LXW_CHART_LABEL_POSITION_CENTER = 1
    LXW_CHART_LABEL_POSITION_RIGHT = 2
    LXW_CHART_LABEL_POSITION_LEFT = 3
    LXW_CHART_LABEL_POSITION_ABOVE = 4
    LXW_CHART_LABEL_POSITION_BELOW = 5
    LXW_CHART_LABEL_POSITION_INSIDE_BASE = 6
    LXW_CHART_LABEL_POSITION_INSIDE_END = 7
    LXW_CHART_LABEL_POSITION_OUTSIDE_END = 8
    LXW_CHART_LABEL_POSITION_BEST_FIT = 9
end

@cenum lxw_chart_label_separator::UInt32 begin
    LXW_CHART_LABEL_SEPARATOR_COMMA = 0
    LXW_CHART_LABEL_SEPARATOR_SEMICOLON = 1
    LXW_CHART_LABEL_SEPARATOR_PERIOD = 2
    LXW_CHART_LABEL_SEPARATOR_NEWLINE = 3
    LXW_CHART_LABEL_SEPARATOR_SPACE = 4
end

@cenum lxw_chart_axis_type::UInt32 begin
    LXW_CHART_AXIS_TYPE_X = 0
    LXW_CHART_AXIS_TYPE_Y = 1
end

@cenum lxw_chart_subtype::UInt32 begin
    LXW_CHART_SUBTYPE_NONE = 0
    LXW_CHART_SUBTYPE_STACKED = 1
    LXW_CHART_SUBTYPE_STACKED_PERCENT = 2
end

@cenum lxw_chart_grouping::UInt32 begin
    LXW_GROUPING_CLUSTERED = 0
    LXW_GROUPING_STANDARD = 1
    LXW_GROUPING_PERCENTSTACKED = 2
    LXW_GROUPING_STACKED = 3
end

@cenum lxw_chart_axis_tick_position::UInt32 begin
    LXW_CHART_AXIS_POSITION_DEFAULT = 0
    LXW_CHART_AXIS_POSITION_ON_TICK = 1
    LXW_CHART_AXIS_POSITION_BETWEEN = 2
end

@cenum lxw_chart_axis_label_position::UInt32 begin
    LXW_CHART_AXIS_LABEL_POSITION_NEXT_TO = 0
    LXW_CHART_AXIS_LABEL_POSITION_HIGH = 1
    LXW_CHART_AXIS_LABEL_POSITION_LOW = 2
    LXW_CHART_AXIS_LABEL_POSITION_NONE = 3
end

@cenum lxw_chart_axis_label_alignment::UInt32 begin
    LXW_CHART_AXIS_LABEL_ALIGN_CENTER = 0
    LXW_CHART_AXIS_LABEL_ALIGN_LEFT = 1
    LXW_CHART_AXIS_LABEL_ALIGN_RIGHT = 2
end

@cenum lxw_chart_axis_display_unit::UInt32 begin
    LXW_CHART_AXIS_UNITS_NONE = 0
    LXW_CHART_AXIS_UNITS_HUNDREDS = 1
    LXW_CHART_AXIS_UNITS_THOUSANDS = 2
    LXW_CHART_AXIS_UNITS_TEN_THOUSANDS = 3
    LXW_CHART_AXIS_UNITS_HUNDRED_THOUSANDS = 4
    LXW_CHART_AXIS_UNITS_MILLIONS = 5
    LXW_CHART_AXIS_UNITS_TEN_MILLIONS = 6
    LXW_CHART_AXIS_UNITS_HUNDRED_MILLIONS = 7
    LXW_CHART_AXIS_UNITS_BILLIONS = 8
    LXW_CHART_AXIS_UNITS_TRILLIONS = 9
end

@cenum lxw_chart_axis_tick_mark::UInt32 begin
    LXW_CHART_AXIS_TICK_MARK_DEFAULT = 0
    LXW_CHART_AXIS_TICK_MARK_NONE = 1
    LXW_CHART_AXIS_TICK_MARK_INSIDE = 2
    LXW_CHART_AXIS_TICK_MARK_OUTSIDE = 3
    LXW_CHART_AXIS_TICK_MARK_CROSSING = 4
end

const lxw_chart_tick_mark = lxw_chart_axis_tick_mark

struct lxw_series_range
    formula::Cstring
    sheetname::Cstring
    first_row::lxw_row_t
    last_row::lxw_row_t
    first_col::lxw_col_t
    last_col::lxw_col_t
    ignore_cache::UInt8
    has_string_cache::UInt8
    num_data_points::UInt16
    data_cache::Ptr{lxw_series_data_points}
end

struct __JL_Ctag_22
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_series_data_point}
end

function Base.getproperty(x::__JL_Ctag_22, f::Symbol)
    f === :stqe_next && return Ptr{lxw_series_data_point}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_series_data_point
    data::NTuple{40,UInt8}
end

function Base.getproperty(x::Ptr{lxw_series_data_point}, f::Symbol)
    f === :is_string && return Ptr{UInt8}(x + 0)
    f === :number && return Ptr{Cdouble}(x + 8)
    f === :string && return Ptr{Cstring}(x + 16)
    f === :no_data && return Ptr{UInt8}(x + 24)
    f === :list_pointers && return Ptr{Cvoid}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_series_data_point, f::Symbol)
    r = Ref{lxw_series_data_point}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_series_data_point}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_series_data_point}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_chart_line
    color::lxw_color_t
    none::UInt8
    width::Cfloat
    dash_type::UInt8
    transparency::UInt8
end

struct lxw_chart_fill
    color::lxw_color_t
    none::UInt8
    transparency::UInt8
end

struct lxw_chart_pattern
    fg_color::lxw_color_t
    bg_color::lxw_color_t
    type::UInt8
end

struct lxw_chart_font
    name::Cstring
    size::Cdouble
    bold::UInt8
    italic::UInt8
    underline::UInt8
    rotation::Int32
    color::lxw_color_t
    pitch_family::UInt8
    charset::UInt8
    baseline::Int8
end

struct lxw_chart_marker
    type::UInt8
    size::UInt8
    line::Ptr{lxw_chart_line}
    fill::Ptr{lxw_chart_fill}
    pattern::Ptr{lxw_chart_pattern}
end

struct lxw_chart_legend
    font::Ptr{lxw_chart_font}
    position::UInt8
end

struct lxw_chart_title
    data::NTuple{80,UInt8}
end

function Base.getproperty(x::Ptr{lxw_chart_title}, f::Symbol)
    f === :name && return Ptr{Cstring}(x + 0)
    f === :row && return Ptr{lxw_row_t}(x + 8)
    f === :col && return Ptr{lxw_col_t}(x + 12)
    f === :font && return Ptr{Ptr{lxw_chart_font}}(x + 16)
    f === :off && return Ptr{UInt8}(x + 24)
    f === :is_horizontal && return Ptr{UInt8}(x + 25)
    f === :ignore_cache && return Ptr{UInt8}(x + 26)
    f === :range && return Ptr{Ptr{lxw_series_range}}(x + 32)
    f === :data_point && return Ptr{lxw_series_data_point}(x + 40)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_chart_title, f::Symbol)
    r = Ref{lxw_chart_title}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_chart_title}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_chart_title}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_chart_point
    line::Ptr{lxw_chart_line}
    fill::Ptr{lxw_chart_fill}
    pattern::Ptr{lxw_chart_pattern}
end

struct lxw_chart_data_label
    value::Cstring
    hide::UInt8
    font::Ptr{lxw_chart_font}
    line::Ptr{lxw_chart_line}
    fill::Ptr{lxw_chart_fill}
    pattern::Ptr{lxw_chart_pattern}
end

struct lxw_chart_custom_label
    data::NTuple{96,UInt8}
end

function Base.getproperty(x::Ptr{lxw_chart_custom_label}, f::Symbol)
    f === :value && return Ptr{Cstring}(x + 0)
    f === :hide && return Ptr{UInt8}(x + 8)
    f === :font && return Ptr{Ptr{lxw_chart_font}}(x + 16)
    f === :line && return Ptr{Ptr{lxw_chart_line}}(x + 24)
    f === :fill && return Ptr{Ptr{lxw_chart_fill}}(x + 32)
    f === :pattern && return Ptr{Ptr{lxw_chart_pattern}}(x + 40)
    f === :range && return Ptr{Ptr{lxw_series_range}}(x + 48)
    f === :data_point && return Ptr{lxw_series_data_point}(x + 56)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_chart_custom_label, f::Symbol)
    r = Ref{lxw_chart_custom_label}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_chart_custom_label}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_chart_custom_label}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum lxw_chart_blank::UInt32 begin
    LXW_CHART_BLANKS_AS_GAP = 0
    LXW_CHART_BLANKS_AS_ZERO = 1
    LXW_CHART_BLANKS_AS_CONNECTED = 2
end

@cenum lxw_chart_position::UInt32 begin
    LXW_CHART_AXIS_RIGHT = 0
    LXW_CHART_AXIS_LEFT = 1
    LXW_CHART_AXIS_TOP = 2
    LXW_CHART_AXIS_BOTTOM = 3
end

@cenum lxw_chart_error_bar_type::UInt32 begin
    LXW_CHART_ERROR_BAR_TYPE_STD_ERROR = 0
    LXW_CHART_ERROR_BAR_TYPE_FIXED = 1
    LXW_CHART_ERROR_BAR_TYPE_PERCENTAGE = 2
    LXW_CHART_ERROR_BAR_TYPE_STD_DEV = 3
end

@cenum lxw_chart_error_bar_direction::UInt32 begin
    LXW_CHART_ERROR_BAR_DIR_BOTH = 0
    LXW_CHART_ERROR_BAR_DIR_PLUS = 1
    LXW_CHART_ERROR_BAR_DIR_MINUS = 2
end

@cenum lxw_chart_error_bar_axis::UInt32 begin
    LXW_CHART_ERROR_BAR_AXIS_X = 0
    LXW_CHART_ERROR_BAR_AXIS_Y = 1
end

@cenum lxw_chart_error_bar_cap::UInt32 begin
    LXW_CHART_ERROR_BAR_END_CAP = 0
    LXW_CHART_ERROR_BAR_NO_CAP = 1
end

struct lxw_series_error_bars
    type::UInt8
    direction::UInt8
    endcap::UInt8
    has_value::UInt8
    is_set::UInt8
    is_x::UInt8
    chart_group::UInt8
    value::Cdouble
    line::Ptr{lxw_chart_line}
end

@cenum lxw_chart_trendline_type::UInt32 begin
    LXW_CHART_TRENDLINE_TYPE_LINEAR = 0
    LXW_CHART_TRENDLINE_TYPE_LOG = 1
    LXW_CHART_TRENDLINE_TYPE_POLY = 2
    LXW_CHART_TRENDLINE_TYPE_POWER = 3
    LXW_CHART_TRENDLINE_TYPE_EXP = 4
    LXW_CHART_TRENDLINE_TYPE_AVERAGE = 5
end

struct __JL_Ctag_11
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_chart_series}
end

function Base.getproperty(x::__JL_Ctag_11, f::Symbol)
    f === :stqe_next && return Ptr{lxw_chart_series}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_chart_series
    data::NTuple{280,UInt8}
end

function Base.getproperty(x::Ptr{lxw_chart_series}, f::Symbol)
    f === :categories && return Ptr{Ptr{lxw_series_range}}(x + 0)
    f === :values && return Ptr{Ptr{lxw_series_range}}(x + 8)
    f === :title && return Ptr{lxw_chart_title}(x + 16)
    f === :line && return Ptr{Ptr{lxw_chart_line}}(x + 96)
    f === :fill && return Ptr{Ptr{lxw_chart_fill}}(x + 104)
    f === :pattern && return Ptr{Ptr{lxw_chart_pattern}}(x + 112)
    f === :marker && return Ptr{Ptr{lxw_chart_marker}}(x + 120)
    f === :points && return Ptr{Ptr{lxw_chart_point}}(x + 128)
    f === :data_labels && return Ptr{Ptr{lxw_chart_custom_label}}(x + 136)
    f === :point_count && return Ptr{UInt16}(x + 144)
    f === :data_label_count && return Ptr{UInt16}(x + 146)
    f === :smooth && return Ptr{UInt8}(x + 148)
    f === :invert_if_negative && return Ptr{UInt8}(x + 149)
    f === :has_labels && return Ptr{UInt8}(x + 150)
    f === :show_labels_value && return Ptr{UInt8}(x + 151)
    f === :show_labels_category && return Ptr{UInt8}(x + 152)
    f === :show_labels_name && return Ptr{UInt8}(x + 153)
    f === :show_labels_leader && return Ptr{UInt8}(x + 154)
    f === :show_labels_legend && return Ptr{UInt8}(x + 155)
    f === :show_labels_percent && return Ptr{UInt8}(x + 156)
    f === :label_position && return Ptr{UInt8}(x + 157)
    f === :label_separator && return Ptr{UInt8}(x + 158)
    f === :default_label_position && return Ptr{UInt8}(x + 159)
    f === :label_num_format && return Ptr{Cstring}(x + 160)
    f === :label_font && return Ptr{Ptr{lxw_chart_font}}(x + 168)
    f === :label_line && return Ptr{Ptr{lxw_chart_line}}(x + 176)
    f === :label_fill && return Ptr{Ptr{lxw_chart_fill}}(x + 184)
    f === :label_pattern && return Ptr{Ptr{lxw_chart_pattern}}(x + 192)
    f === :x_error_bars && return Ptr{Ptr{lxw_series_error_bars}}(x + 200)
    f === :y_error_bars && return Ptr{Ptr{lxw_series_error_bars}}(x + 208)
    f === :has_trendline && return Ptr{UInt8}(x + 216)
    f === :has_trendline_forecast && return Ptr{UInt8}(x + 217)
    f === :has_trendline_equation && return Ptr{UInt8}(x + 218)
    f === :has_trendline_r_squared && return Ptr{UInt8}(x + 219)
    f === :has_trendline_intercept && return Ptr{UInt8}(x + 220)
    f === :trendline_type && return Ptr{UInt8}(x + 221)
    f === :trendline_value && return Ptr{UInt8}(x + 222)
    f === :trendline_forward && return Ptr{Cdouble}(x + 224)
    f === :trendline_backward && return Ptr{Cdouble}(x + 232)
    f === :trendline_value_type && return Ptr{UInt8}(x + 240)
    f === :trendline_name && return Ptr{Cstring}(x + 248)
    f === :trendline_line && return Ptr{Ptr{lxw_chart_line}}(x + 256)
    f === :trendline_intercept && return Ptr{Cdouble}(x + 264)
    f === :list_pointers && return Ptr{Cvoid}(x + 272)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_chart_series, f::Symbol)
    r = Ref{lxw_chart_series}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_chart_series}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_chart_series}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_chart_gridline
    visible::UInt8
    line::Ptr{lxw_chart_line}
end

struct lxw_chart_axis
    title::lxw_chart_title
    num_format::Cstring
    default_num_format::Cstring
    source_linked::UInt8
    major_tick_mark::UInt8
    minor_tick_mark::UInt8
    is_horizontal::UInt8
    major_gridlines::lxw_chart_gridline
    minor_gridlines::lxw_chart_gridline
    num_font::Ptr{lxw_chart_font}
    line::Ptr{lxw_chart_line}
    fill::Ptr{lxw_chart_fill}
    pattern::Ptr{lxw_chart_pattern}
    is_category::UInt8
    is_date::UInt8
    is_value::UInt8
    axis_position::UInt8
    position_axis::UInt8
    label_position::UInt8
    label_align::UInt8
    hidden::UInt8
    reverse::UInt8
    has_min::UInt8
    min::Cdouble
    has_max::UInt8
    max::Cdouble
    has_major_unit::UInt8
    major_unit::Cdouble
    has_minor_unit::UInt8
    minor_unit::Cdouble
    interval_unit::UInt16
    interval_tick::UInt16
    log_base::UInt16
    display_units::UInt8
    display_units_visible::UInt8
    has_crossing::UInt8
    crossing_min::UInt8
    crossing_max::UInt8
    crossing::Cdouble
end

struct __JL_Ctag_25
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_chart}
end

function Base.getproperty(x::__JL_Ctag_25, f::Symbol)
    f === :stqe_next && return Ptr{lxw_chart}(getfield(x, f))
    return getfield(x, f)
end

struct __JL_Ctag_26
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_chart}
end

function Base.getproperty(x::__JL_Ctag_26, f::Symbol)
    f === :stqe_next && return Ptr{lxw_chart}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_chart
    data::NTuple{384,UInt8}
end

function Base.getproperty(x::Ptr{lxw_chart}, f::Symbol)
    f === :file && return Ptr{Ptr{Libc.FILE}}(x + 0)
    f === :type && return Ptr{UInt8}(x + 8)
    f === :subtype && return Ptr{UInt8}(x + 9)
    f === :series_index && return Ptr{UInt16}(x + 10)
    f === :write_chart_type && return Ptr{Ptr{Cvoid}}(x + 16)
    f === :write_plot_area && return Ptr{Ptr{Cvoid}}(x + 24)
    f === :x_axis && return Ptr{Ptr{lxw_chart_axis}}(x + 32)
    f === :y_axis && return Ptr{Ptr{lxw_chart_axis}}(x + 40)
    f === :title && return Ptr{lxw_chart_title}(x + 48)
    f === :id && return Ptr{UInt32}(x + 128)
    f === :axis_id_1 && return Ptr{UInt32}(x + 132)
    f === :axis_id_2 && return Ptr{UInt32}(x + 136)
    f === :axis_id_3 && return Ptr{UInt32}(x + 140)
    f === :axis_id_4 && return Ptr{UInt32}(x + 144)
    f === :in_use && return Ptr{UInt8}(x + 148)
    f === :chart_group && return Ptr{UInt8}(x + 149)
    f === :cat_has_num_fmt && return Ptr{UInt8}(x + 150)
    f === :is_chartsheet && return Ptr{UInt8}(x + 151)
    f === :has_horiz_cat_axis && return Ptr{UInt8}(x + 152)
    f === :has_horiz_val_axis && return Ptr{UInt8}(x + 153)
    f === :style_id && return Ptr{UInt8}(x + 154)
    f === :rotation && return Ptr{UInt16}(x + 156)
    f === :hole_size && return Ptr{UInt16}(x + 158)
    f === :no_title && return Ptr{UInt8}(x + 160)
    f === :has_overlap && return Ptr{UInt8}(x + 161)
    f === :overlap_y1 && return Ptr{Int8}(x + 162)
    f === :overlap_y2 && return Ptr{Int8}(x + 163)
    f === :gap_y1 && return Ptr{UInt16}(x + 164)
    f === :gap_y2 && return Ptr{UInt16}(x + 166)
    f === :grouping && return Ptr{UInt8}(x + 168)
    f === :default_cross_between && return Ptr{UInt8}(x + 169)
    f === :legend && return Ptr{lxw_chart_legend}(x + 176)
    f === :delete_series && return Ptr{Ptr{Int16}}(x + 192)
    f === :delete_series_count && return Ptr{UInt16}(x + 200)
    f === :default_marker && return Ptr{Ptr{lxw_chart_marker}}(x + 208)
    f === :chartarea_line && return Ptr{Ptr{lxw_chart_line}}(x + 216)
    f === :chartarea_fill && return Ptr{Ptr{lxw_chart_fill}}(x + 224)
    f === :chartarea_pattern && return Ptr{Ptr{lxw_chart_pattern}}(x + 232)
    f === :plotarea_line && return Ptr{Ptr{lxw_chart_line}}(x + 240)
    f === :plotarea_fill && return Ptr{Ptr{lxw_chart_fill}}(x + 248)
    f === :plotarea_pattern && return Ptr{Ptr{lxw_chart_pattern}}(x + 256)
    f === :has_drop_lines && return Ptr{UInt8}(x + 264)
    f === :drop_lines_line && return Ptr{Ptr{lxw_chart_line}}(x + 272)
    f === :has_high_low_lines && return Ptr{UInt8}(x + 280)
    f === :high_low_lines_line && return Ptr{Ptr{lxw_chart_line}}(x + 288)
    f === :series_list && return Ptr{Ptr{lxw_chart_series_list}}(x + 296)
    f === :has_table && return Ptr{UInt8}(x + 304)
    f === :has_table_vertical && return Ptr{UInt8}(x + 305)
    f === :has_table_horizontal && return Ptr{UInt8}(x + 306)
    f === :has_table_outline && return Ptr{UInt8}(x + 307)
    f === :has_table_legend_keys && return Ptr{UInt8}(x + 308)
    f === :table_font && return Ptr{Ptr{lxw_chart_font}}(x + 312)
    f === :show_blanks_as && return Ptr{UInt8}(x + 320)
    f === :show_hidden_data && return Ptr{UInt8}(x + 321)
    f === :has_up_down_bars && return Ptr{UInt8}(x + 322)
    f === :up_bar_line && return Ptr{Ptr{lxw_chart_line}}(x + 328)
    f === :down_bar_line && return Ptr{Ptr{lxw_chart_line}}(x + 336)
    f === :up_bar_fill && return Ptr{Ptr{lxw_chart_fill}}(x + 344)
    f === :down_bar_fill && return Ptr{Ptr{lxw_chart_fill}}(x + 352)
    f === :default_label_position && return Ptr{UInt8}(x + 360)
    f === :is_protected && return Ptr{UInt8}(x + 361)
    f === :ordered_list_pointers && return Ptr{Cvoid}(x + 368)
    f === :list_pointers && return Ptr{Cvoid}(x + 376)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_chart, f::Symbol)
    r = Ref{lxw_chart}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_chart}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_chart}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function lxw_chart_new(type)
    @ccall libxlsxwriter.lxw_chart_new(type::UInt8)::Ptr{lxw_chart}
end

function lxw_chart_free(chart)
    @ccall libxlsxwriter.lxw_chart_free(chart::Ptr{lxw_chart})::Cvoid
end

function lxw_chart_assemble_xml_file(chart)
    @ccall libxlsxwriter.lxw_chart_assemble_xml_file(chart::Ptr{lxw_chart})::Cvoid
end

function chart_add_series(chart, categories, values)
    @ccall libxlsxwriter.chart_add_series(
        chart::Ptr{lxw_chart},
        categories::Cstring,
        values::Cstring,
    )::Ptr{lxw_chart_series}
end

function chart_series_set_categories(
    series,
    sheetname,
    first_row,
    first_col,
    last_row,
    last_col,
)
    @ccall libxlsxwriter.chart_series_set_categories(
        series::Ptr{lxw_chart_series},
        sheetname::Cstring,
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
    )::Cvoid
end

function chart_series_set_values(
    series,
    sheetname,
    first_row,
    first_col,
    last_row,
    last_col,
)
    @ccall libxlsxwriter.chart_series_set_values(
        series::Ptr{lxw_chart_series},
        sheetname::Cstring,
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
    )::Cvoid
end

function chart_series_set_name(series, name)
    @ccall libxlsxwriter.chart_series_set_name(
        series::Ptr{lxw_chart_series},
        name::Cstring,
    )::Cvoid
end

function chart_series_set_name_range(series, sheetname, row, col)
    @ccall libxlsxwriter.chart_series_set_name_range(
        series::Ptr{lxw_chart_series},
        sheetname::Cstring,
        row::lxw_row_t,
        col::lxw_col_t,
    )::Cvoid
end

function chart_series_set_line(series, line)
    @ccall libxlsxwriter.chart_series_set_line(
        series::Ptr{lxw_chart_series},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_series_set_fill(series, fill)
    @ccall libxlsxwriter.chart_series_set_fill(
        series::Ptr{lxw_chart_series},
        fill::Ptr{lxw_chart_fill},
    )::Cvoid
end

function chart_series_set_invert_if_negative(series)
    @ccall libxlsxwriter.chart_series_set_invert_if_negative(
        series::Ptr{lxw_chart_series},
    )::Cvoid
end

function chart_series_set_pattern(series, pattern)
    @ccall libxlsxwriter.chart_series_set_pattern(
        series::Ptr{lxw_chart_series},
        pattern::Ptr{lxw_chart_pattern},
    )::Cvoid
end

function chart_series_set_marker_type(series, type)
    @ccall libxlsxwriter.chart_series_set_marker_type(
        series::Ptr{lxw_chart_series},
        type::UInt8,
    )::Cvoid
end

function chart_series_set_marker_size(series, size)
    @ccall libxlsxwriter.chart_series_set_marker_size(
        series::Ptr{lxw_chart_series},
        size::UInt8,
    )::Cvoid
end

function chart_series_set_marker_line(series, line)
    @ccall libxlsxwriter.chart_series_set_marker_line(
        series::Ptr{lxw_chart_series},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_series_set_marker_fill(series, fill)
    @ccall libxlsxwriter.chart_series_set_marker_fill(
        series::Ptr{lxw_chart_series},
        fill::Ptr{lxw_chart_fill},
    )::Cvoid
end

function chart_series_set_marker_pattern(series, pattern)
    @ccall libxlsxwriter.chart_series_set_marker_pattern(
        series::Ptr{lxw_chart_series},
        pattern::Ptr{lxw_chart_pattern},
    )::Cvoid
end

function chart_series_set_points(series, points)
    @ccall libxlsxwriter.chart_series_set_points(
        series::Ptr{lxw_chart_series},
        points::Ptr{Ptr{lxw_chart_point}},
    )::lxw_error
end

function chart_series_set_smooth(series, smooth)
    @ccall libxlsxwriter.chart_series_set_smooth(
        series::Ptr{lxw_chart_series},
        smooth::UInt8,
    )::Cvoid
end

function chart_series_set_labels(series)
    @ccall libxlsxwriter.chart_series_set_labels(series::Ptr{lxw_chart_series})::Cvoid
end

function chart_series_set_labels_options(series, show_name, show_category, show_value)
    @ccall libxlsxwriter.chart_series_set_labels_options(
        series::Ptr{lxw_chart_series},
        show_name::UInt8,
        show_category::UInt8,
        show_value::UInt8,
    )::Cvoid
end

function chart_series_set_labels_custom(series, data_labels)
    @ccall libxlsxwriter.chart_series_set_labels_custom(
        series::Ptr{lxw_chart_series},
        data_labels::Ptr{Ptr{lxw_chart_data_label}},
    )::lxw_error
end

function chart_series_set_labels_separator(series, separator)
    @ccall libxlsxwriter.chart_series_set_labels_separator(
        series::Ptr{lxw_chart_series},
        separator::UInt8,
    )::Cvoid
end

function chart_series_set_labels_position(series, position)
    @ccall libxlsxwriter.chart_series_set_labels_position(
        series::Ptr{lxw_chart_series},
        position::UInt8,
    )::Cvoid
end

function chart_series_set_labels_leader_line(series)
    @ccall libxlsxwriter.chart_series_set_labels_leader_line(
        series::Ptr{lxw_chart_series},
    )::Cvoid
end

function chart_series_set_labels_legend(series)
    @ccall libxlsxwriter.chart_series_set_labels_legend(
        series::Ptr{lxw_chart_series},
    )::Cvoid
end

function chart_series_set_labels_percentage(series)
    @ccall libxlsxwriter.chart_series_set_labels_percentage(
        series::Ptr{lxw_chart_series},
    )::Cvoid
end

function chart_series_set_labels_num_format(series, num_format)
    @ccall libxlsxwriter.chart_series_set_labels_num_format(
        series::Ptr{lxw_chart_series},
        num_format::Cstring,
    )::Cvoid
end

function chart_series_set_labels_font(series, font)
    @ccall libxlsxwriter.chart_series_set_labels_font(
        series::Ptr{lxw_chart_series},
        font::Ptr{lxw_chart_font},
    )::Cvoid
end

function chart_series_set_labels_line(series, line)
    @ccall libxlsxwriter.chart_series_set_labels_line(
        series::Ptr{lxw_chart_series},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_series_set_labels_fill(series, fill)
    @ccall libxlsxwriter.chart_series_set_labels_fill(
        series::Ptr{lxw_chart_series},
        fill::Ptr{lxw_chart_fill},
    )::Cvoid
end

function chart_series_set_labels_pattern(series, pattern)
    @ccall libxlsxwriter.chart_series_set_labels_pattern(
        series::Ptr{lxw_chart_series},
        pattern::Ptr{lxw_chart_pattern},
    )::Cvoid
end

function chart_series_set_trendline(series, type, value)
    @ccall libxlsxwriter.chart_series_set_trendline(
        series::Ptr{lxw_chart_series},
        type::UInt8,
        value::UInt8,
    )::Cvoid
end

function chart_series_set_trendline_forecast(series, forward, backward)
    @ccall libxlsxwriter.chart_series_set_trendline_forecast(
        series::Ptr{lxw_chart_series},
        forward::Cdouble,
        backward::Cdouble,
    )::Cvoid
end

function chart_series_set_trendline_equation(series)
    @ccall libxlsxwriter.chart_series_set_trendline_equation(
        series::Ptr{lxw_chart_series},
    )::Cvoid
end

function chart_series_set_trendline_r_squared(series)
    @ccall libxlsxwriter.chart_series_set_trendline_r_squared(
        series::Ptr{lxw_chart_series},
    )::Cvoid
end

function chart_series_set_trendline_intercept(series, intercept)
    @ccall libxlsxwriter.chart_series_set_trendline_intercept(
        series::Ptr{lxw_chart_series},
        intercept::Cdouble,
    )::Cvoid
end

function chart_series_set_trendline_name(series, name)
    @ccall libxlsxwriter.chart_series_set_trendline_name(
        series::Ptr{lxw_chart_series},
        name::Cstring,
    )::Cvoid
end

function chart_series_set_trendline_line(series, line)
    @ccall libxlsxwriter.chart_series_set_trendline_line(
        series::Ptr{lxw_chart_series},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_series_get_error_bars(series, axis_type)
    @ccall libxlsxwriter.chart_series_get_error_bars(
        series::Ptr{lxw_chart_series},
        axis_type::lxw_chart_error_bar_axis,
    )::Ptr{lxw_series_error_bars}
end

function chart_series_set_error_bars(error_bars, type, value)
    @ccall libxlsxwriter.chart_series_set_error_bars(
        error_bars::Ptr{lxw_series_error_bars},
        type::UInt8,
        value::Cdouble,
    )::Cvoid
end

function chart_series_set_error_bars_direction(error_bars, direction)
    @ccall libxlsxwriter.chart_series_set_error_bars_direction(
        error_bars::Ptr{lxw_series_error_bars},
        direction::UInt8,
    )::Cvoid
end

function chart_series_set_error_bars_endcap(error_bars, endcap)
    @ccall libxlsxwriter.chart_series_set_error_bars_endcap(
        error_bars::Ptr{lxw_series_error_bars},
        endcap::UInt8,
    )::Cvoid
end

function chart_series_set_error_bars_line(error_bars, line)
    @ccall libxlsxwriter.chart_series_set_error_bars_line(
        error_bars::Ptr{lxw_series_error_bars},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_axis_get(chart, axis_type)
    @ccall libxlsxwriter.chart_axis_get(
        chart::Ptr{lxw_chart},
        axis_type::lxw_chart_axis_type,
    )::Ptr{lxw_chart_axis}
end

function chart_axis_set_name(axis, name)
    @ccall libxlsxwriter.chart_axis_set_name(
        axis::Ptr{lxw_chart_axis},
        name::Cstring,
    )::Cvoid
end

function chart_axis_set_name_range(axis, sheetname, row, col)
    @ccall libxlsxwriter.chart_axis_set_name_range(
        axis::Ptr{lxw_chart_axis},
        sheetname::Cstring,
        row::lxw_row_t,
        col::lxw_col_t,
    )::Cvoid
end

function chart_axis_set_name_font(axis, font)
    @ccall libxlsxwriter.chart_axis_set_name_font(
        axis::Ptr{lxw_chart_axis},
        font::Ptr{lxw_chart_font},
    )::Cvoid
end

function chart_axis_set_num_font(axis, font)
    @ccall libxlsxwriter.chart_axis_set_num_font(
        axis::Ptr{lxw_chart_axis},
        font::Ptr{lxw_chart_font},
    )::Cvoid
end

function chart_axis_set_num_format(axis, num_format)
    @ccall libxlsxwriter.chart_axis_set_num_format(
        axis::Ptr{lxw_chart_axis},
        num_format::Cstring,
    )::Cvoid
end

function chart_axis_set_line(axis, line)
    @ccall libxlsxwriter.chart_axis_set_line(
        axis::Ptr{lxw_chart_axis},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_axis_set_fill(axis, fill)
    @ccall libxlsxwriter.chart_axis_set_fill(
        axis::Ptr{lxw_chart_axis},
        fill::Ptr{lxw_chart_fill},
    )::Cvoid
end

function chart_axis_set_pattern(axis, pattern)
    @ccall libxlsxwriter.chart_axis_set_pattern(
        axis::Ptr{lxw_chart_axis},
        pattern::Ptr{lxw_chart_pattern},
    )::Cvoid
end

function chart_axis_set_reverse(axis)
    @ccall libxlsxwriter.chart_axis_set_reverse(axis::Ptr{lxw_chart_axis})::Cvoid
end

function chart_axis_set_crossing(axis, value)
    @ccall libxlsxwriter.chart_axis_set_crossing(
        axis::Ptr{lxw_chart_axis},
        value::Cdouble,
    )::Cvoid
end

function chart_axis_set_crossing_max(axis)
    @ccall libxlsxwriter.chart_axis_set_crossing_max(axis::Ptr{lxw_chart_axis})::Cvoid
end

function chart_axis_set_crossing_min(axis)
    @ccall libxlsxwriter.chart_axis_set_crossing_min(axis::Ptr{lxw_chart_axis})::Cvoid
end

function chart_axis_off(axis)
    @ccall libxlsxwriter.chart_axis_off(axis::Ptr{lxw_chart_axis})::Cvoid
end

function chart_axis_set_position(axis, position)
    @ccall libxlsxwriter.chart_axis_set_position(
        axis::Ptr{lxw_chart_axis},
        position::UInt8,
    )::Cvoid
end

function chart_axis_set_label_position(axis, position)
    @ccall libxlsxwriter.chart_axis_set_label_position(
        axis::Ptr{lxw_chart_axis},
        position::UInt8,
    )::Cvoid
end

function chart_axis_set_label_align(axis, align)
    @ccall libxlsxwriter.chart_axis_set_label_align(
        axis::Ptr{lxw_chart_axis},
        align::UInt8,
    )::Cvoid
end

function chart_axis_set_min(axis, min)
    @ccall libxlsxwriter.chart_axis_set_min(axis::Ptr{lxw_chart_axis}, min::Cdouble)::Cvoid
end

function chart_axis_set_max(axis, max)
    @ccall libxlsxwriter.chart_axis_set_max(axis::Ptr{lxw_chart_axis}, max::Cdouble)::Cvoid
end

function chart_axis_set_log_base(axis, log_base)
    @ccall libxlsxwriter.chart_axis_set_log_base(
        axis::Ptr{lxw_chart_axis},
        log_base::UInt16,
    )::Cvoid
end

function chart_axis_set_major_tick_mark(axis, type)
    @ccall libxlsxwriter.chart_axis_set_major_tick_mark(
        axis::Ptr{lxw_chart_axis},
        type::UInt8,
    )::Cvoid
end

function chart_axis_set_minor_tick_mark(axis, type)
    @ccall libxlsxwriter.chart_axis_set_minor_tick_mark(
        axis::Ptr{lxw_chart_axis},
        type::UInt8,
    )::Cvoid
end

function chart_axis_set_interval_unit(axis, unit)
    @ccall libxlsxwriter.chart_axis_set_interval_unit(
        axis::Ptr{lxw_chart_axis},
        unit::UInt16,
    )::Cvoid
end

function chart_axis_set_interval_tick(axis, unit)
    @ccall libxlsxwriter.chart_axis_set_interval_tick(
        axis::Ptr{lxw_chart_axis},
        unit::UInt16,
    )::Cvoid
end

function chart_axis_set_major_unit(axis, unit)
    @ccall libxlsxwriter.chart_axis_set_major_unit(
        axis::Ptr{lxw_chart_axis},
        unit::Cdouble,
    )::Cvoid
end

function chart_axis_set_minor_unit(axis, unit)
    @ccall libxlsxwriter.chart_axis_set_minor_unit(
        axis::Ptr{lxw_chart_axis},
        unit::Cdouble,
    )::Cvoid
end

function chart_axis_set_display_units(axis, units)
    @ccall libxlsxwriter.chart_axis_set_display_units(
        axis::Ptr{lxw_chart_axis},
        units::UInt8,
    )::Cvoid
end

function chart_axis_set_display_units_visible(axis, visible)
    @ccall libxlsxwriter.chart_axis_set_display_units_visible(
        axis::Ptr{lxw_chart_axis},
        visible::UInt8,
    )::Cvoid
end

function chart_axis_major_gridlines_set_visible(axis, visible)
    @ccall libxlsxwriter.chart_axis_major_gridlines_set_visible(
        axis::Ptr{lxw_chart_axis},
        visible::UInt8,
    )::Cvoid
end

function chart_axis_minor_gridlines_set_visible(axis, visible)
    @ccall libxlsxwriter.chart_axis_minor_gridlines_set_visible(
        axis::Ptr{lxw_chart_axis},
        visible::UInt8,
    )::Cvoid
end

function chart_axis_major_gridlines_set_line(axis, line)
    @ccall libxlsxwriter.chart_axis_major_gridlines_set_line(
        axis::Ptr{lxw_chart_axis},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_axis_minor_gridlines_set_line(axis, line)
    @ccall libxlsxwriter.chart_axis_minor_gridlines_set_line(
        axis::Ptr{lxw_chart_axis},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_title_set_name(chart, name)
    @ccall libxlsxwriter.chart_title_set_name(chart::Ptr{lxw_chart}, name::Cstring)::Cvoid
end

function chart_title_set_name_range(chart, sheetname, row, col)
    @ccall libxlsxwriter.chart_title_set_name_range(
        chart::Ptr{lxw_chart},
        sheetname::Cstring,
        row::lxw_row_t,
        col::lxw_col_t,
    )::Cvoid
end

function chart_title_set_name_font(chart, font)
    @ccall libxlsxwriter.chart_title_set_name_font(
        chart::Ptr{lxw_chart},
        font::Ptr{lxw_chart_font},
    )::Cvoid
end

function chart_title_off(chart)
    @ccall libxlsxwriter.chart_title_off(chart::Ptr{lxw_chart})::Cvoid
end

function chart_legend_set_position(chart, position)
    @ccall libxlsxwriter.chart_legend_set_position(
        chart::Ptr{lxw_chart},
        position::UInt8,
    )::Cvoid
end

function chart_legend_set_font(chart, font)
    @ccall libxlsxwriter.chart_legend_set_font(
        chart::Ptr{lxw_chart},
        font::Ptr{lxw_chart_font},
    )::Cvoid
end

function chart_legend_delete_series(chart, delete_series)
    @ccall libxlsxwriter.chart_legend_delete_series(
        chart::Ptr{lxw_chart},
        delete_series::Ptr{Int16},
    )::lxw_error
end

function chart_chartarea_set_line(chart, line)
    @ccall libxlsxwriter.chart_chartarea_set_line(
        chart::Ptr{lxw_chart},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_chartarea_set_fill(chart, fill)
    @ccall libxlsxwriter.chart_chartarea_set_fill(
        chart::Ptr{lxw_chart},
        fill::Ptr{lxw_chart_fill},
    )::Cvoid
end

function chart_chartarea_set_pattern(chart, pattern)
    @ccall libxlsxwriter.chart_chartarea_set_pattern(
        chart::Ptr{lxw_chart},
        pattern::Ptr{lxw_chart_pattern},
    )::Cvoid
end

function chart_plotarea_set_line(chart, line)
    @ccall libxlsxwriter.chart_plotarea_set_line(
        chart::Ptr{lxw_chart},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_plotarea_set_fill(chart, fill)
    @ccall libxlsxwriter.chart_plotarea_set_fill(
        chart::Ptr{lxw_chart},
        fill::Ptr{lxw_chart_fill},
    )::Cvoid
end

function chart_plotarea_set_pattern(chart, pattern)
    @ccall libxlsxwriter.chart_plotarea_set_pattern(
        chart::Ptr{lxw_chart},
        pattern::Ptr{lxw_chart_pattern},
    )::Cvoid
end

function chart_set_style(chart, style_id)
    @ccall libxlsxwriter.chart_set_style(chart::Ptr{lxw_chart}, style_id::UInt8)::Cvoid
end

function chart_set_table(chart)
    @ccall libxlsxwriter.chart_set_table(chart::Ptr{lxw_chart})::Cvoid
end

function chart_set_table_grid(chart, horizontal, vertical, outline, legend_keys)
    @ccall libxlsxwriter.chart_set_table_grid(
        chart::Ptr{lxw_chart},
        horizontal::UInt8,
        vertical::UInt8,
        outline::UInt8,
        legend_keys::UInt8,
    )::Cvoid
end

function chart_set_table_font(chart, font)
    @ccall libxlsxwriter.chart_set_table_font(
        chart::Ptr{lxw_chart},
        font::Ptr{lxw_chart_font},
    )::Cvoid
end

function chart_set_up_down_bars(chart)
    @ccall libxlsxwriter.chart_set_up_down_bars(chart::Ptr{lxw_chart})::Cvoid
end

function chart_set_up_down_bars_format(
    chart,
    up_bar_line,
    up_bar_fill,
    down_bar_line,
    down_bar_fill,
)
    @ccall libxlsxwriter.chart_set_up_down_bars_format(
        chart::Ptr{lxw_chart},
        up_bar_line::Ptr{lxw_chart_line},
        up_bar_fill::Ptr{lxw_chart_fill},
        down_bar_line::Ptr{lxw_chart_line},
        down_bar_fill::Ptr{lxw_chart_fill},
    )::Cvoid
end

function chart_set_drop_lines(chart, line)
    @ccall libxlsxwriter.chart_set_drop_lines(
        chart::Ptr{lxw_chart},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_set_high_low_lines(chart, line)
    @ccall libxlsxwriter.chart_set_high_low_lines(
        chart::Ptr{lxw_chart},
        line::Ptr{lxw_chart_line},
    )::Cvoid
end

function chart_set_series_overlap(chart, overlap)
    @ccall libxlsxwriter.chart_set_series_overlap(
        chart::Ptr{lxw_chart},
        overlap::Int8,
    )::Cvoid
end

function chart_set_series_gap(chart, gap)
    @ccall libxlsxwriter.chart_set_series_gap(chart::Ptr{lxw_chart}, gap::UInt16)::Cvoid
end

function chart_show_blanks_as(chart, option)
    @ccall libxlsxwriter.chart_show_blanks_as(chart::Ptr{lxw_chart}, option::UInt8)::Cvoid
end

function chart_show_hidden_data(chart)
    @ccall libxlsxwriter.chart_show_hidden_data(chart::Ptr{lxw_chart})::Cvoid
end

function chart_set_rotation(chart, rotation)
    @ccall libxlsxwriter.chart_set_rotation(chart::Ptr{lxw_chart}, rotation::UInt16)::Cvoid
end

function chart_set_hole_size(chart, size)
    @ccall libxlsxwriter.chart_set_hole_size(chart::Ptr{lxw_chart}, size::UInt8)::Cvoid
end

function lxw_chart_add_data_cache(range, data, rows, cols, col)
    @ccall libxlsxwriter.lxw_chart_add_data_cache(
        range::Ptr{lxw_series_range},
        data::Ptr{UInt8},
        rows::UInt16,
        cols::UInt8,
        col::UInt8,
    )::lxw_error
end

struct lxw_drawing_objects
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_drawing_object}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_drawing_object}}
end

function Base.getproperty(x::lxw_drawing_objects, f::Symbol)
    f === :stqh_first && return Ptr{lxw_drawing_object}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_drawing_object}}(getfield(x, f))
    return getfield(x, f)
end

@cenum lxw_drawing_types::UInt32 begin
    LXW_DRAWING_NONE = 0
    LXW_DRAWING_IMAGE = 1
    LXW_DRAWING_CHART = 2
    LXW_DRAWING_SHAPE = 3
end

@cenum image_types::UInt32 begin
    LXW_IMAGE_UNKNOWN = 0
    LXW_IMAGE_PNG = 1
    LXW_IMAGE_JPEG = 2
    LXW_IMAGE_BMP = 3
    LXW_IMAGE_GIF = 4
end

struct lxw_drawing_coords
    col::UInt32
    row::UInt32
    col_offset::Cdouble
    row_offset::Cdouble
end

struct __JL_Ctag_37
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_drawing_object}
end

function Base.getproperty(x::__JL_Ctag_37, f::Symbol)
    f === :stqe_next && return Ptr{lxw_drawing_object}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_drawing_object
    data::NTuple{128,UInt8}
end

function Base.getproperty(x::Ptr{lxw_drawing_object}, f::Symbol)
    f === :type && return Ptr{UInt8}(x + 0)
    f === :anchor && return Ptr{UInt8}(x + 1)
    f === :from && return Ptr{lxw_drawing_coords}(x + 8)
    f === :to && return Ptr{lxw_drawing_coords}(x + 32)
    f === :col_absolute && return Ptr{UInt64}(x + 56)
    f === :row_absolute && return Ptr{UInt64}(x + 64)
    f === :width && return Ptr{UInt32}(x + 72)
    f === :height && return Ptr{UInt32}(x + 76)
    f === :shape && return Ptr{UInt8}(x + 80)
    f === :rel_index && return Ptr{UInt32}(x + 84)
    f === :url_rel_index && return Ptr{UInt32}(x + 88)
    f === :description && return Ptr{Cstring}(x + 96)
    f === :tip && return Ptr{Cstring}(x + 104)
    f === :decorative && return Ptr{UInt8}(x + 112)
    f === :list_pointers && return Ptr{Cvoid}(x + 120)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_drawing_object, f::Symbol)
    r = Ref{lxw_drawing_object}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_drawing_object}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_drawing_object}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_drawing
    file::Ptr{Libc.FILE}
    embedded::UInt8
    orientation::UInt8
    drawing_objects::Ptr{lxw_drawing_objects}
end

function lxw_drawing_new()
    @ccall libxlsxwriter.lxw_drawing_new()::Ptr{lxw_drawing}
end

function lxw_drawing_free(drawing)
    @ccall libxlsxwriter.lxw_drawing_free(drawing::Ptr{lxw_drawing})::Cvoid
end

function lxw_drawing_assemble_xml_file(self)
    @ccall libxlsxwriter.lxw_drawing_assemble_xml_file(self::Ptr{lxw_drawing})::Cvoid
end

function lxw_free_drawing_object(drawing_object)
    @ccall libxlsxwriter.lxw_free_drawing_object(
        drawing_object::Ptr{lxw_drawing_object},
    )::Cvoid
end

function lxw_add_drawing_object(drawing, drawing_object)
    @ccall libxlsxwriter.lxw_add_drawing_object(
        drawing::Ptr{lxw_drawing},
        drawing_object::Ptr{lxw_drawing_object},
    )::Cvoid
end

struct lxw_styles
    file::Ptr{Libc.FILE}
    font_count::UInt32
    xf_count::UInt32
    dxf_count::UInt32
    num_format_count::UInt32
    border_count::UInt32
    fill_count::UInt32
    xf_formats::Ptr{lxw_formats}
    dxf_formats::Ptr{lxw_formats}
    has_hyperlink::UInt8
    hyperlink_font_id::UInt16
    has_comments::UInt8
end

function lxw_styles_new()
    @ccall libxlsxwriter.lxw_styles_new()::Ptr{lxw_styles}
end

function lxw_styles_free(styles)
    @ccall libxlsxwriter.lxw_styles_free(styles::Ptr{lxw_styles})::Cvoid
end

function lxw_styles_assemble_xml_file(self)
    @ccall libxlsxwriter.lxw_styles_assemble_xml_file(self::Ptr{lxw_styles})::Cvoid
end

function lxw_styles_write_string_fragment(self, string)
    @ccall libxlsxwriter.lxw_styles_write_string_fragment(
        self::Ptr{lxw_styles},
        string::Cstring,
    )::Cvoid
end

function lxw_styles_write_rich_font(styles, format)
    @ccall libxlsxwriter.lxw_styles_write_rich_font(
        styles::Ptr{lxw_styles},
        format::Ptr{lxw_format},
    )::Cvoid
end

struct xml_attribute_list
    stqh_first::Ptr{xml_attribute}
    stqh_last::Ptr{Ptr{xml_attribute}}
end

function lxw_xml_declaration(xmlfile)
    @ccall libxlsxwriter.lxw_xml_declaration(xmlfile::Ptr{Libc.FILE})::Cvoid
end

function lxw_xml_start_tag(xmlfile, tag, attributes)
    @ccall libxlsxwriter.lxw_xml_start_tag(
        xmlfile::Ptr{Libc.FILE},
        tag::Cstring,
        attributes::Ptr{xml_attribute_list},
    )::Cvoid
end

function lxw_xml_start_tag_unencoded(xmlfile, tag, attributes)
    @ccall libxlsxwriter.lxw_xml_start_tag_unencoded(
        xmlfile::Ptr{Libc.FILE},
        tag::Cstring,
        attributes::Ptr{xml_attribute_list},
    )::Cvoid
end

function lxw_xml_end_tag(xmlfile, tag)
    @ccall libxlsxwriter.lxw_xml_end_tag(xmlfile::Ptr{Libc.FILE}, tag::Cstring)::Cvoid
end

function lxw_xml_empty_tag(xmlfile, tag, attributes)
    @ccall libxlsxwriter.lxw_xml_empty_tag(
        xmlfile::Ptr{Libc.FILE},
        tag::Cstring,
        attributes::Ptr{xml_attribute_list},
    )::Cvoid
end

function lxw_xml_empty_tag_unencoded(xmlfile, tag, attributes)
    @ccall libxlsxwriter.lxw_xml_empty_tag_unencoded(
        xmlfile::Ptr{Libc.FILE},
        tag::Cstring,
        attributes::Ptr{xml_attribute_list},
    )::Cvoid
end

function lxw_xml_data_element(xmlfile, tag, data, attributes)
    @ccall libxlsxwriter.lxw_xml_data_element(
        xmlfile::Ptr{Libc.FILE},
        tag::Cstring,
        data::Cstring,
        attributes::Ptr{xml_attribute_list},
    )::Cvoid
end

function lxw_xml_rich_si_element(xmlfile, string)
    @ccall libxlsxwriter.lxw_xml_rich_si_element(
        xmlfile::Ptr{Libc.FILE},
        string::Cstring,
    )::Cvoid
end

function lxw_has_control_characters(string)
    @ccall libxlsxwriter.lxw_has_control_characters(string::Cstring)::UInt8
end

function lxw_escape_control_characters(string)
    string_copy_free(
        @ccall(libxlsxwriter.lxw_escape_control_characters(string::Cstring)::Cstring)
    )
end

function lxw_escape_url_characters(string, escape_hash)
    string_copy_free(
        @ccall(
            libxlsxwriter.lxw_escape_url_characters(
                string::Cstring,
                escape_hash::UInt8,
            )::Cstring
        )
    )
end

function lxw_escape_data(data)
    string_copy_free(@ccall(libxlsxwriter.lxw_escape_data(data::Cstring)::Cstring))
end

function lxw_version()
    unsafe_string(@ccall(libxlsxwriter.lxw_version()::Cstring))
end

function lxw_version_id()
    @ccall libxlsxwriter.lxw_version_id()::UInt16
end

function lxw_strerror(error_num)
    string_copy_free(@ccall(libxlsxwriter.lxw_strerror(error_num::lxw_error)::Cstring))
end

function lxw_quote_sheetname(str)
    string_copy_free(@ccall(libxlsxwriter.lxw_quote_sheetname(str::Cstring)::Cstring))
end

function lxw_col_to_name(col_name, col_num, absolute)
    @ccall libxlsxwriter.lxw_col_to_name(
        col_name::Cstring,
        col_num::lxw_col_t,
        absolute::UInt8,
    )::Cvoid
end

function lxw_rowcol_to_cell(cell_name, row, col)
    @ccall libxlsxwriter.lxw_rowcol_to_cell(
        cell_name::Cstring,
        row::lxw_row_t,
        col::lxw_col_t,
    )::Cvoid
end

function lxw_rowcol_to_cell_abs(cell_name, row, col, abs_row, abs_col)
    @ccall libxlsxwriter.lxw_rowcol_to_cell_abs(
        cell_name::Cstring,
        row::lxw_row_t,
        col::lxw_col_t,
        abs_row::UInt8,
        abs_col::UInt8,
    )::Cvoid
end

function lxw_rowcol_to_range(range, first_row, first_col, last_row, last_col)
    @ccall libxlsxwriter.lxw_rowcol_to_range(
        range::Cstring,
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
    )::Cvoid
end

function lxw_rowcol_to_range_abs(range, first_row, first_col, last_row, last_col)
    @ccall libxlsxwriter.lxw_rowcol_to_range_abs(
        range::Cstring,
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
    )::Cvoid
end

function lxw_rowcol_to_formula_abs(
    formula,
    sheetname,
    first_row,
    first_col,
    last_row,
    last_col,
)
    @ccall libxlsxwriter.lxw_rowcol_to_formula_abs(
        formula::Cstring,
        sheetname::Cstring,
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
    )::Cvoid
end

function lxw_datetime_to_excel_datetime(datetime)
    @ccall libxlsxwriter.lxw_datetime_to_excel_datetime(
        datetime::Ptr{lxw_datetime},
    )::Cdouble
end

function lxw_datetime_to_excel_date_epoch(datetime, date_1904)
    @ccall libxlsxwriter.lxw_datetime_to_excel_date_epoch(
        datetime::Ptr{lxw_datetime},
        date_1904::UInt8,
    )::Cdouble
end

function lxw_unixtime_to_excel_date(unixtime)
    @ccall libxlsxwriter.lxw_unixtime_to_excel_date(unixtime::Int64)::Cdouble
end

function lxw_unixtime_to_excel_date_epoch(unixtime, date_1904)
    @ccall libxlsxwriter.lxw_unixtime_to_excel_date_epoch(
        unixtime::Int64,
        date_1904::UInt8,
    )::Cdouble
end

function lxw_strdup(str)
    string_copy_free(@ccall(libxlsxwriter.lxw_strdup(str::Cstring)::Cstring))
end

function lxw_strdup_formula(formula)
    string_copy_free(@ccall(libxlsxwriter.lxw_strdup_formula(formula::Cstring)::Cstring))
end

function lxw_utf8_strlen(str)
    @ccall libxlsxwriter.lxw_utf8_strlen(str::Cstring)::Csize_t
end

function lxw_str_tolower(str)
    @ccall libxlsxwriter.lxw_str_tolower(str::Cstring)::Cvoid
end

function lxw_str_is_empty(str)
    @ccall libxlsxwriter.lxw_str_is_empty(str::Cstring)::UInt8
end

function lxw_tmpfile(tmpdir)
    @ccall libxlsxwriter.lxw_tmpfile(tmpdir::Cstring)::Ptr{Libc.FILE}
end

function lxw_get_filehandle(buf, size, tmpdir)
    @ccall libxlsxwriter.lxw_get_filehandle(
        buf::Ptr{Cstring},
        size::Ptr{Csize_t},
        tmpdir::Cstring,
    )::Ptr{Libc.FILE}
end

function lxw_fopen(filename, mode)
    @ccall libxlsxwriter.lxw_fopen(filename::Cstring, mode::Cstring)::Ptr{Libc.FILE}
end

function lxw_hash_password(password)
    @ccall libxlsxwriter.lxw_hash_password(password::Cstring)::UInt16
end

struct lxw_rel_tuples
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_rel_tuple}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_rel_tuple}}
end

function Base.getproperty(x::lxw_rel_tuples, f::Symbol)
    f === :stqh_first && return Ptr{lxw_rel_tuple}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_rel_tuple}}(getfield(x, f))
    return getfield(x, f)
end

struct __JL_Ctag_42
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_rel_tuple}
end

function Base.getproperty(x::__JL_Ctag_42, f::Symbol)
    f === :stqe_next && return Ptr{lxw_rel_tuple}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_rel_tuple
    data::NTuple{32,UInt8}
end

function Base.getproperty(x::Ptr{lxw_rel_tuple}, f::Symbol)
    f === :type && return Ptr{Cstring}(x + 0)
    f === :target && return Ptr{Cstring}(x + 8)
    f === :target_mode && return Ptr{Cstring}(x + 16)
    f === :list_pointers && return Ptr{Cvoid}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_rel_tuple, f::Symbol)
    r = Ref{lxw_rel_tuple}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_rel_tuple}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_rel_tuple}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_relationships
    file::Ptr{Libc.FILE}
    rel_id::UInt32
    relationships::Ptr{lxw_rel_tuples}
end

function lxw_relationships_new()
    @ccall libxlsxwriter.lxw_relationships_new()::Ptr{lxw_relationships}
end

function lxw_free_relationships(relationships)
    @ccall libxlsxwriter.lxw_free_relationships(
        relationships::Ptr{lxw_relationships},
    )::Cvoid
end

function lxw_relationships_assemble_xml_file(self)
    @ccall libxlsxwriter.lxw_relationships_assemble_xml_file(
        self::Ptr{lxw_relationships},
    )::Cvoid
end

function lxw_add_document_relationship(self, type, target)
    @ccall libxlsxwriter.lxw_add_document_relationship(
        self::Ptr{lxw_relationships},
        type::Cstring,
        target::Cstring,
    )::Cvoid
end

function lxw_add_package_relationship(self, type, target)
    @ccall libxlsxwriter.lxw_add_package_relationship(
        self::Ptr{lxw_relationships},
        type::Cstring,
        target::Cstring,
    )::Cvoid
end

function lxw_add_ms_package_relationship(self, type, target)
    @ccall libxlsxwriter.lxw_add_ms_package_relationship(
        self::Ptr{lxw_relationships},
        type::Cstring,
        target::Cstring,
    )::Cvoid
end

function lxw_add_worksheet_relationship(self, type, target, target_mode)
    @ccall libxlsxwriter.lxw_add_worksheet_relationship(
        self::Ptr{lxw_relationships},
        type::Cstring,
        target::Cstring,
        target_mode::Cstring,
    )::Cvoid
end

function lxw_add_rich_value_relationship(self)
    @ccall libxlsxwriter.lxw_add_rich_value_relationship(
        self::Ptr{lxw_relationships},
    )::Cvoid
end

@cenum lxw_gridlines::UInt32 begin
    LXW_HIDE_ALL_GRIDLINES = 0
    LXW_SHOW_SCREEN_GRIDLINES = 1
    LXW_SHOW_PRINT_GRIDLINES = 2
    LXW_SHOW_ALL_GRIDLINES = 3
end

@cenum lxw_validation_boolean::UInt32 begin
    LXW_VALIDATION_DEFAULT = 0
    LXW_VALIDATION_OFF = 1
    LXW_VALIDATION_ON = 2
end

@cenum lxw_validation_types::UInt32 begin
    LXW_VALIDATION_TYPE_NONE = 0
    LXW_VALIDATION_TYPE_INTEGER = 1
    LXW_VALIDATION_TYPE_INTEGER_FORMULA = 2
    LXW_VALIDATION_TYPE_DECIMAL = 3
    LXW_VALIDATION_TYPE_DECIMAL_FORMULA = 4
    LXW_VALIDATION_TYPE_LIST = 5
    LXW_VALIDATION_TYPE_LIST_FORMULA = 6
    LXW_VALIDATION_TYPE_DATE = 7
    LXW_VALIDATION_TYPE_DATE_FORMULA = 8
    LXW_VALIDATION_TYPE_DATE_NUMBER = 9
    LXW_VALIDATION_TYPE_TIME = 10
    LXW_VALIDATION_TYPE_TIME_FORMULA = 11
    LXW_VALIDATION_TYPE_TIME_NUMBER = 12
    LXW_VALIDATION_TYPE_LENGTH = 13
    LXW_VALIDATION_TYPE_LENGTH_FORMULA = 14
    LXW_VALIDATION_TYPE_CUSTOM_FORMULA = 15
    LXW_VALIDATION_TYPE_ANY = 16
end

@cenum lxw_validation_criteria::UInt32 begin
    LXW_VALIDATION_CRITERIA_NONE = 0
    LXW_VALIDATION_CRITERIA_BETWEEN = 1
    LXW_VALIDATION_CRITERIA_NOT_BETWEEN = 2
    LXW_VALIDATION_CRITERIA_EQUAL_TO = 3
    LXW_VALIDATION_CRITERIA_NOT_EQUAL_TO = 4
    LXW_VALIDATION_CRITERIA_GREATER_THAN = 5
    LXW_VALIDATION_CRITERIA_LESS_THAN = 6
    LXW_VALIDATION_CRITERIA_GREATER_THAN_OR_EQUAL_TO = 7
    LXW_VALIDATION_CRITERIA_LESS_THAN_OR_EQUAL_TO = 8
end

@cenum lxw_validation_error_types::UInt32 begin
    LXW_VALIDATION_ERROR_TYPE_STOP = 0
    LXW_VALIDATION_ERROR_TYPE_WARNING = 1
    LXW_VALIDATION_ERROR_TYPE_INFORMATION = 2
end

@cenum lxw_comment_display_types::UInt32 begin
    LXW_COMMENT_DISPLAY_DEFAULT = 0
    LXW_COMMENT_DISPLAY_HIDDEN = 1
    LXW_COMMENT_DISPLAY_VISIBLE = 2
end

@cenum lxw_conditional_format_types::UInt32 begin
    LXW_CONDITIONAL_TYPE_NONE = 0
    LXW_CONDITIONAL_TYPE_CELL = 1
    LXW_CONDITIONAL_TYPE_TEXT = 2
    LXW_CONDITIONAL_TYPE_TIME_PERIOD = 3
    LXW_CONDITIONAL_TYPE_AVERAGE = 4
    LXW_CONDITIONAL_TYPE_DUPLICATE = 5
    LXW_CONDITIONAL_TYPE_UNIQUE = 6
    LXW_CONDITIONAL_TYPE_TOP = 7
    LXW_CONDITIONAL_TYPE_BOTTOM = 8
    LXW_CONDITIONAL_TYPE_BLANKS = 9
    LXW_CONDITIONAL_TYPE_NO_BLANKS = 10
    LXW_CONDITIONAL_TYPE_ERRORS = 11
    LXW_CONDITIONAL_TYPE_NO_ERRORS = 12
    LXW_CONDITIONAL_TYPE_FORMULA = 13
    LXW_CONDITIONAL_2_COLOR_SCALE = 14
    LXW_CONDITIONAL_3_COLOR_SCALE = 15
    LXW_CONDITIONAL_DATA_BAR = 16
    LXW_CONDITIONAL_TYPE_ICON_SETS = 17
    LXW_CONDITIONAL_TYPE_LAST = 18
end

@cenum lxw_conditional_criteria::UInt32 begin
    LXW_CONDITIONAL_CRITERIA_NONE = 0
    LXW_CONDITIONAL_CRITERIA_EQUAL_TO = 1
    LXW_CONDITIONAL_CRITERIA_NOT_EQUAL_TO = 2
    LXW_CONDITIONAL_CRITERIA_GREATER_THAN = 3
    LXW_CONDITIONAL_CRITERIA_LESS_THAN = 4
    LXW_CONDITIONAL_CRITERIA_GREATER_THAN_OR_EQUAL_TO = 5
    LXW_CONDITIONAL_CRITERIA_LESS_THAN_OR_EQUAL_TO = 6
    LXW_CONDITIONAL_CRITERIA_BETWEEN = 7
    LXW_CONDITIONAL_CRITERIA_NOT_BETWEEN = 8
    LXW_CONDITIONAL_CRITERIA_TEXT_CONTAINING = 9
    LXW_CONDITIONAL_CRITERIA_TEXT_NOT_CONTAINING = 10
    LXW_CONDITIONAL_CRITERIA_TEXT_BEGINS_WITH = 11
    LXW_CONDITIONAL_CRITERIA_TEXT_ENDS_WITH = 12
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_YESTERDAY = 13
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_TODAY = 14
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_TOMORROW = 15
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_LAST_7_DAYS = 16
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_LAST_WEEK = 17
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_THIS_WEEK = 18
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_NEXT_WEEK = 19
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_LAST_MONTH = 20
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_THIS_MONTH = 21
    LXW_CONDITIONAL_CRITERIA_TIME_PERIOD_NEXT_MONTH = 22
    LXW_CONDITIONAL_CRITERIA_AVERAGE_ABOVE = 23
    LXW_CONDITIONAL_CRITERIA_AVERAGE_BELOW = 24
    LXW_CONDITIONAL_CRITERIA_AVERAGE_ABOVE_OR_EQUAL = 25
    LXW_CONDITIONAL_CRITERIA_AVERAGE_BELOW_OR_EQUAL = 26
    LXW_CONDITIONAL_CRITERIA_AVERAGE_1_STD_DEV_ABOVE = 27
    LXW_CONDITIONAL_CRITERIA_AVERAGE_1_STD_DEV_BELOW = 28
    LXW_CONDITIONAL_CRITERIA_AVERAGE_2_STD_DEV_ABOVE = 29
    LXW_CONDITIONAL_CRITERIA_AVERAGE_2_STD_DEV_BELOW = 30
    LXW_CONDITIONAL_CRITERIA_AVERAGE_3_STD_DEV_ABOVE = 31
    LXW_CONDITIONAL_CRITERIA_AVERAGE_3_STD_DEV_BELOW = 32
    LXW_CONDITIONAL_CRITERIA_TOP_OR_BOTTOM_PERCENT = 33
end

@cenum lxw_conditional_format_rule_types::UInt32 begin
    LXW_CONDITIONAL_RULE_TYPE_NONE = 0
    LXW_CONDITIONAL_RULE_TYPE_MINIMUM = 1
    LXW_CONDITIONAL_RULE_TYPE_NUMBER = 2
    LXW_CONDITIONAL_RULE_TYPE_PERCENT = 3
    LXW_CONDITIONAL_RULE_TYPE_PERCENTILE = 4
    LXW_CONDITIONAL_RULE_TYPE_FORMULA = 5
    LXW_CONDITIONAL_RULE_TYPE_MAXIMUM = 6
    LXW_CONDITIONAL_RULE_TYPE_AUTO_MIN = 7
    LXW_CONDITIONAL_RULE_TYPE_AUTO_MAX = 8
end

@cenum lxw_conditional_format_bar_direction::UInt32 begin
    LXW_CONDITIONAL_BAR_DIRECTION_CONTEXT = 0
    LXW_CONDITIONAL_BAR_DIRECTION_RIGHT_TO_LEFT = 1
    LXW_CONDITIONAL_BAR_DIRECTION_LEFT_TO_RIGHT = 2
end

@cenum lxw_conditional_bar_axis_position::UInt32 begin
    LXW_CONDITIONAL_BAR_AXIS_AUTOMATIC = 0
    LXW_CONDITIONAL_BAR_AXIS_MIDPOINT = 1
    LXW_CONDITIONAL_BAR_AXIS_NONE = 2
end

@cenum lxw_conditional_icon_types::UInt32 begin
    LXW_CONDITIONAL_ICONS_3_ARROWS_COLORED = 0
    LXW_CONDITIONAL_ICONS_3_ARROWS_GRAY = 1
    LXW_CONDITIONAL_ICONS_3_FLAGS = 2
    LXW_CONDITIONAL_ICONS_3_TRAFFIC_LIGHTS_UNRIMMED = 3
    LXW_CONDITIONAL_ICONS_3_TRAFFIC_LIGHTS_RIMMED = 4
    LXW_CONDITIONAL_ICONS_3_SIGNS = 5
    LXW_CONDITIONAL_ICONS_3_SYMBOLS_CIRCLED = 6
    LXW_CONDITIONAL_ICONS_3_SYMBOLS_UNCIRCLED = 7
    LXW_CONDITIONAL_ICONS_4_ARROWS_COLORED = 8
    LXW_CONDITIONAL_ICONS_4_ARROWS_GRAY = 9
    LXW_CONDITIONAL_ICONS_4_RED_TO_BLACK = 10
    LXW_CONDITIONAL_ICONS_4_RATINGS = 11
    LXW_CONDITIONAL_ICONS_4_TRAFFIC_LIGHTS = 12
    LXW_CONDITIONAL_ICONS_5_ARROWS_COLORED = 13
    LXW_CONDITIONAL_ICONS_5_ARROWS_GRAY = 14
    LXW_CONDITIONAL_ICONS_5_RATINGS = 15
    LXW_CONDITIONAL_ICONS_5_QUARTERS = 16
end

@cenum lxw_table_style_type::UInt32 begin
    LXW_TABLE_STYLE_TYPE_DEFAULT = 0
    LXW_TABLE_STYLE_TYPE_LIGHT = 1
    LXW_TABLE_STYLE_TYPE_MEDIUM = 2
    LXW_TABLE_STYLE_TYPE_DARK = 3
end

@cenum lxw_table_total_functions::UInt32 begin
    LXW_TABLE_FUNCTION_NONE = 0
    LXW_TABLE_FUNCTION_AVERAGE = 101
    LXW_TABLE_FUNCTION_COUNT_NUMS = 102
    LXW_TABLE_FUNCTION_COUNT = 103
    LXW_TABLE_FUNCTION_MAX = 104
    LXW_TABLE_FUNCTION_MIN = 105
    LXW_TABLE_FUNCTION_STD_DEV = 107
    LXW_TABLE_FUNCTION_SUM = 109
    LXW_TABLE_FUNCTION_VAR = 110
end

@cenum lxw_filter_criteria::UInt32 begin
    LXW_FILTER_CRITERIA_NONE = 0
    LXW_FILTER_CRITERIA_EQUAL_TO = 1
    LXW_FILTER_CRITERIA_NOT_EQUAL_TO = 2
    LXW_FILTER_CRITERIA_GREATER_THAN = 3
    LXW_FILTER_CRITERIA_LESS_THAN = 4
    LXW_FILTER_CRITERIA_GREATER_THAN_OR_EQUAL_TO = 5
    LXW_FILTER_CRITERIA_LESS_THAN_OR_EQUAL_TO = 6
    LXW_FILTER_CRITERIA_BLANKS = 7
    LXW_FILTER_CRITERIA_NON_BLANKS = 8
end

@cenum lxw_filter_operator::UInt32 begin
    LXW_FILTER_AND = 0
    LXW_FILTER_OR = 1
end

@cenum lxw_filter_type::UInt32 begin
    LXW_FILTER_TYPE_NONE = 0
    LXW_FILTER_TYPE_SINGLE = 1
    LXW_FILTER_TYPE_AND = 2
    LXW_FILTER_TYPE_OR = 3
    LXW_FILTER_TYPE_STRING_LIST = 4
end

@cenum lxw_object_position::UInt32 begin
    LXW_OBJECT_POSITION_DEFAULT = 0
    LXW_OBJECT_MOVE_AND_SIZE = 1
    LXW_OBJECT_MOVE_DONT_SIZE = 2
    LXW_OBJECT_DONT_MOVE_DONT_SIZE = 3
    LXW_OBJECT_MOVE_AND_SIZE_AFTER = 4
end

@cenum lxw_ignore_errors::UInt32 begin
    LXW_IGNORE_NUMBER_STORED_AS_TEXT = 1
    LXW_IGNORE_EVAL_ERROR = 2
    LXW_IGNORE_FORMULA_DIFFERS = 3
    LXW_IGNORE_FORMULA_RANGE = 4
    LXW_IGNORE_FORMULA_UNLOCKED = 5
    LXW_IGNORE_EMPTY_CELL_REFERENCE = 6
    LXW_IGNORE_LIST_DATA_VALIDATION = 7
    LXW_IGNORE_CALCULATED_COLUMN = 8
    LXW_IGNORE_TWO_DIGIT_TEXT_YEAR = 9
    LXW_IGNORE_LAST_OPTION = 10
end

@cenum cell_types::UInt32 begin
    NUMBER_CELL = 1
    STRING_CELL = 2
    INLINE_STRING_CELL = 3
    INLINE_RICH_STRING_CELL = 4
    FORMULA_CELL = 5
    ARRAY_FORMULA_CELL = 6
    DYNAMIC_ARRAY_FORMULA_CELL = 7
    BLANK_CELL = 8
    BOOLEAN_CELL = 9
    ERROR_CELL = 10
    COMMENT = 11
    HYPERLINK_URL = 12
    HYPERLINK_INTERNAL = 13
    HYPERLINK_EXTERNAL = 14
end

@cenum pane_types::UInt32 begin
    NO_PANES = 0
    FREEZE_PANES = 1
    SPLIT_PANES = 2
    FREEZE_SPLIT_PANES = 3
end

@cenum lxw_image_position::UInt32 begin
    HEADER_LEFT = 0
    HEADER_CENTER = 1
    HEADER_RIGHT = 2
    FOOTER_LEFT = 3
    FOOTER_CENTER = 4
    FOOTER_RIGHT = 5
end

struct lxw_table_cells
    rbh_root::Ptr{Cvoid} # rbh_root::Ptr{lxw_cell}
end

function Base.getproperty(x::lxw_table_cells, f::Symbol)
    f === :rbh_root && return Ptr{lxw_cell}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_drawing_rel_ids
    rbh_root::Ptr{Cvoid} # rbh_root::Ptr{lxw_drawing_rel_id}
end

function Base.getproperty(x::lxw_drawing_rel_ids, f::Symbol)
    f === :rbh_root && return Ptr{lxw_drawing_rel_id}(getfield(x, f))
    return getfield(x, f)
end

struct __JL_Ctag_8
    rbe_left::Ptr{Cvoid} # rbe_left::Ptr{lxw_drawing_rel_id}
    rbe_right::Ptr{Cvoid} # rbe_right::Ptr{lxw_drawing_rel_id}
    rbe_parent::Ptr{Cvoid} # rbe_parent::Ptr{lxw_drawing_rel_id}
    rbe_color::Cint
end

function Base.getproperty(x::__JL_Ctag_8, f::Symbol)
    f === :rbe_left && return Ptr{lxw_drawing_rel_id}(getfield(x, f))
    f === :rbe_right && return Ptr{lxw_drawing_rel_id}(getfield(x, f))
    f === :rbe_parent && return Ptr{lxw_drawing_rel_id}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_drawing_rel_id
    data::NTuple{48,UInt8}
end

function Base.getproperty(x::Ptr{lxw_drawing_rel_id}, f::Symbol)
    f === :id && return Ptr{UInt32}(x + 0)
    f === :target && return Ptr{Cstring}(x + 8)
    f === :tree_pointers && return Ptr{Cvoid}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_drawing_rel_id, f::Symbol)
    r = Ref{lxw_drawing_rel_id}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_drawing_rel_id}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_drawing_rel_id}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_vml_drawing_rel_ids
    rbh_root::Ptr{lxw_drawing_rel_id}
end

struct lxw_cond_format_hash
    rbh_root::Ptr{Cvoid} # rbh_root::Ptr{lxw_cond_format_hash_element}
end

function Base.getproperty(x::lxw_cond_format_hash, f::Symbol)
    f === :rbh_root && return Ptr{lxw_cond_format_hash_element}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_table_rows
    rbh_root::Ptr{Cvoid} # rbh_root::Ptr{lxw_row}
    cached_row::Ptr{Cvoid} # cached_row::Ptr{lxw_row}
    cached_row_num::lxw_row_t
end

function Base.getproperty(x::lxw_table_rows, f::Symbol)
    f === :rbh_root && return Ptr{lxw_row}(getfield(x, f))
    f === :cached_row && return Ptr{lxw_row}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_merged_ranges
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_merged_range}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_merged_range}}
end

function Base.getproperty(x::lxw_merged_ranges, f::Symbol)
    f === :stqh_first && return Ptr{lxw_merged_range}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_merged_range}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_selections
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_selection}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_selection}}
end

function Base.getproperty(x::lxw_selections, f::Symbol)
    f === :stqh_first && return Ptr{lxw_selection}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_selection}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_data_validations
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_data_val_obj}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_data_val_obj}}
end

function Base.getproperty(x::lxw_data_validations, f::Symbol)
    f === :stqh_first && return Ptr{lxw_data_val_obj}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_data_val_obj}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_cond_format_list
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_cond_format_obj}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_cond_format_obj}}
end

function Base.getproperty(x::lxw_cond_format_list, f::Symbol)
    f === :stqh_first && return Ptr{lxw_cond_format_obj}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_cond_format_obj}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_image_props
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_object_properties}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_object_properties}}
end

function Base.getproperty(x::lxw_image_props, f::Symbol)
    f === :stqh_first && return Ptr{lxw_object_properties}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_object_properties}}(getfield(x, f))
    return getfield(x, f)
end

struct __JL_Ctag_10
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_object_properties}
end

function Base.getproperty(x::__JL_Ctag_10, f::Symbol)
    f === :stqe_next && return Ptr{lxw_object_properties}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_object_properties
    data::NTuple{200,UInt8}
end

function Base.getproperty(x::Ptr{lxw_object_properties}, f::Symbol)
    f === :x_offset && return Ptr{Int32}(x + 0)
    f === :y_offset && return Ptr{Int32}(x + 4)
    f === :x_scale && return Ptr{Cdouble}(x + 8)
    f === :y_scale && return Ptr{Cdouble}(x + 16)
    f === :row && return Ptr{lxw_row_t}(x + 24)
    f === :col && return Ptr{lxw_col_t}(x + 28)
    f === :filename && return Ptr{Cstring}(x + 32)
    f === :description && return Ptr{Cstring}(x + 40)
    f === :url && return Ptr{Cstring}(x + 48)
    f === :tip && return Ptr{Cstring}(x + 56)
    f === :object_position && return Ptr{UInt8}(x + 64)
    f === :stream && return Ptr{Ptr{Libc.FILE}}(x + 72)
    f === :image_type && return Ptr{UInt8}(x + 80)
    f === :is_image_buffer && return Ptr{UInt8}(x + 81)
    f === :image_buffer && return Ptr{Cstring}(x + 88)
    f === :image_buffer_size && return Ptr{Csize_t}(x + 96)
    f === :width && return Ptr{Cdouble}(x + 104)
    f === :height && return Ptr{Cdouble}(x + 112)
    f === :extension && return Ptr{Cstring}(x + 120)
    f === :x_dpi && return Ptr{Cdouble}(x + 128)
    f === :y_dpi && return Ptr{Cdouble}(x + 136)
    f === :chart && return Ptr{Ptr{lxw_chart}}(x + 144)
    f === :is_duplicate && return Ptr{UInt8}(x + 152)
    f === :is_background && return Ptr{UInt8}(x + 153)
    f === :md5 && return Ptr{Cstring}(x + 160)
    f === :image_position && return Ptr{Cstring}(x + 168)
    f === :decorative && return Ptr{UInt8}(x + 176)
    f === :format && return Ptr{Ptr{lxw_format}}(x + 184)
    f === :list_pointers && return Ptr{Cvoid}(x + 192)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_object_properties, f::Symbol)
    r = Ref{lxw_object_properties}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_object_properties}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_object_properties}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_embedded_image_props
    stqh_first::Ptr{lxw_object_properties}
    stqh_last::Ptr{Ptr{lxw_object_properties}}
end

struct lxw_chart_props
    stqh_first::Ptr{lxw_object_properties}
    stqh_last::Ptr{Ptr{lxw_object_properties}}
end

struct __JL_Ctag_16
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_vml_obj}
end

function Base.getproperty(x::__JL_Ctag_16, f::Symbol)
    f === :stqe_next && return Ptr{lxw_vml_obj}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_vml_obj
    data::NTuple{192,UInt8}
end

function Base.getproperty(x::Ptr{lxw_vml_obj}, f::Symbol)
    f === :row && return Ptr{lxw_row_t}(x + 0)
    f === :col && return Ptr{lxw_col_t}(x + 4)
    f === :start_row && return Ptr{lxw_row_t}(x + 8)
    f === :start_col && return Ptr{lxw_col_t}(x + 12)
    f === :x_offset && return Ptr{Int32}(x + 16)
    f === :y_offset && return Ptr{Int32}(x + 20)
    f === :col_absolute && return Ptr{UInt64}(x + 24)
    f === :row_absolute && return Ptr{UInt64}(x + 32)
    f === :width && return Ptr{UInt32}(x + 40)
    f === :height && return Ptr{UInt32}(x + 44)
    f === :x_dpi && return Ptr{Cdouble}(x + 48)
    f === :y_dpi && return Ptr{Cdouble}(x + 56)
    f === :color && return Ptr{lxw_color_t}(x + 64)
    f === :font_family && return Ptr{UInt8}(x + 68)
    f === :visible && return Ptr{UInt8}(x + 69)
    f === :author_id && return Ptr{UInt32}(x + 72)
    f === :rel_index && return Ptr{UInt32}(x + 76)
    f === :font_size && return Ptr{Cdouble}(x + 80)
    f === :from && return Ptr{lxw_drawing_coords}(x + 88)
    f === :to && return Ptr{lxw_drawing_coords}(x + 112)
    f === :author && return Ptr{Cstring}(x + 136)
    f === :font_name && return Ptr{Cstring}(x + 144)
    f === :text && return Ptr{Cstring}(x + 152)
    f === :image_position && return Ptr{Cstring}(x + 160)
    f === :name && return Ptr{Cstring}(x + 168)
    f === :_macro && return Ptr{Cstring}(x + 176)
    f === :list_pointers && return Ptr{Cvoid}(x + 184)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_vml_obj, f::Symbol)
    r = Ref{lxw_vml_obj}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_vml_obj}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_vml_obj}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_comment_objs
    stqh_first::Ptr{lxw_vml_obj}
    stqh_last::Ptr{Ptr{lxw_vml_obj}}
end

struct lxw_table_objs
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_table_obj}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_table_obj}}
end

function Base.getproperty(x::lxw_table_objs, f::Symbol)
    f === :stqh_first && return Ptr{lxw_table_obj}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_table_obj}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_row_col_options
    hidden::UInt8
    level::UInt8
    collapsed::UInt8
end

struct lxw_col_options
    firstcol::lxw_col_t
    lastcol::lxw_col_t
    width::Cdouble
    format::Ptr{lxw_format}
    hidden::UInt8
    level::UInt8
    collapsed::UInt8
end

struct __JL_Ctag_29
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_merged_range}
end

function Base.getproperty(x::__JL_Ctag_29, f::Symbol)
    f === :stqe_next && return Ptr{lxw_merged_range}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_merged_range
    data::NTuple{24,UInt8}
end

function Base.getproperty(x::Ptr{lxw_merged_range}, f::Symbol)
    f === :first_row && return Ptr{lxw_row_t}(x + 0)
    f === :last_row && return Ptr{lxw_row_t}(x + 4)
    f === :first_col && return Ptr{lxw_col_t}(x + 8)
    f === :last_col && return Ptr{lxw_col_t}(x + 10)
    f === :list_pointers && return Ptr{Cvoid}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_merged_range, f::Symbol)
    r = Ref{lxw_merged_range}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_merged_range}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_merged_range}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_repeat_rows
    in_use::UInt8
    first_row::lxw_row_t
    last_row::lxw_row_t
end

struct lxw_repeat_cols
    in_use::UInt8
    first_col::lxw_col_t
    last_col::lxw_col_t
end

struct lxw_print_area
    in_use::UInt8
    first_row::lxw_row_t
    last_row::lxw_row_t
    first_col::lxw_col_t
    last_col::lxw_col_t
end

struct lxw_autofilter
    in_use::UInt8
    has_rules::UInt8
    first_row::lxw_row_t
    last_row::lxw_row_t
    first_col::lxw_col_t
    last_col::lxw_col_t
end

struct lxw_panes
    type::UInt8
    first_row::lxw_row_t
    first_col::lxw_col_t
    top_row::lxw_row_t
    left_col::lxw_col_t
    x_split::Cdouble
    y_split::Cdouble
end

struct __JL_Ctag_27
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_selection}
end

function Base.getproperty(x::__JL_Ctag_27, f::Symbol)
    f === :stqe_next && return Ptr{lxw_selection}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_selection
    data::NTuple{80,UInt8}
end

function Base.getproperty(x::Ptr{lxw_selection}, f::Symbol)
    f === :pane && return Ptr{NTuple{12,Cchar}}(x + 0)
    f === :active_cell && return Ptr{NTuple{28,Cchar}}(x + 12)
    f === :sqref && return Ptr{NTuple{28,Cchar}}(x + 40)
    f === :list_pointers && return Ptr{Cvoid}(x + 72)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_selection, f::Symbol)
    r = Ref{lxw_selection}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_selection}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_selection}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

mutable struct lxw_data_validation
    validate::UInt8
    criteria::UInt8
    ignore_blank::UInt8
    show_input::UInt8
    show_error::UInt8
    error_type::UInt8
    dropdown::UInt8
    value_number::Cdouble
    value_formula::Cstring
    value_list::Ptr{Cstring}
    value_datetime::lxw_datetime
    minimum_number::Cdouble
    minimum_formula::Cstring
    minimum_datetime::lxw_datetime
    maximum_number::Cdouble
    maximum_formula::Cstring
    maximum_datetime::lxw_datetime
    input_title::Cstring
    input_message::Cstring
    error_title::Cstring
    error_message::Cstring
end

struct __JL_Ctag_9
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_data_val_obj}
end

function Base.getproperty(x::__JL_Ctag_9, f::Symbol)
    f === :stqe_next && return Ptr{lxw_data_val_obj}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_data_val_obj
    data::NTuple{200,UInt8}
end

function Base.getproperty(x::Ptr{lxw_data_val_obj}, f::Symbol)
    f === :validate && return Ptr{UInt8}(x + 0)
    f === :criteria && return Ptr{UInt8}(x + 1)
    f === :ignore_blank && return Ptr{UInt8}(x + 2)
    f === :show_input && return Ptr{UInt8}(x + 3)
    f === :show_error && return Ptr{UInt8}(x + 4)
    f === :error_type && return Ptr{UInt8}(x + 5)
    f === :dropdown && return Ptr{UInt8}(x + 6)
    f === :value_number && return Ptr{Cdouble}(x + 8)
    f === :value_formula && return Ptr{Cstring}(x + 16)
    f === :value_list && return Ptr{Ptr{Cstring}}(x + 24)
    f === :minimum_number && return Ptr{Cdouble}(x + 32)
    f === :minimum_formula && return Ptr{Cstring}(x + 40)
    f === :minimum_datetime && return Ptr{lxw_datetime}(x + 48)
    f === :maximum_number && return Ptr{Cdouble}(x + 80)
    f === :maximum_formula && return Ptr{Cstring}(x + 88)
    f === :maximum_datetime && return Ptr{lxw_datetime}(x + 96)
    f === :input_title && return Ptr{Cstring}(x + 128)
    f === :input_message && return Ptr{Cstring}(x + 136)
    f === :error_title && return Ptr{Cstring}(x + 144)
    f === :error_message && return Ptr{Cstring}(x + 152)
    f === :sqref && return Ptr{NTuple{28,Cchar}}(x + 160)
    f === :list_pointers && return Ptr{Cvoid}(x + 192)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_data_val_obj, f::Symbol)
    r = Ref{lxw_data_val_obj}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_data_val_obj}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_data_val_obj}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_conditional_format
    type::UInt8
    criteria::UInt8
    value::Cdouble
    value_string::Cstring
    format::Ptr{lxw_format}
    min_value::Cdouble
    min_value_string::Cstring
    min_rule_type::UInt8
    min_color::lxw_color_t
    mid_value::Cdouble
    mid_value_string::Cstring
    mid_rule_type::UInt8
    mid_color::lxw_color_t
    max_value::Cdouble
    max_value_string::Cstring
    max_rule_type::UInt8
    max_color::lxw_color_t
    bar_color::lxw_color_t
    bar_only::UInt8
    data_bar_2010::UInt8
    bar_solid::UInt8
    bar_negative_color::lxw_color_t
    bar_border_color::lxw_color_t
    bar_negative_border_color::lxw_color_t
    bar_negative_color_same::UInt8
    bar_negative_border_color_same::UInt8
    bar_no_border::UInt8
    bar_direction::UInt8
    bar_axis_position::UInt8
    bar_axis_color::lxw_color_t
    icon_style::UInt8
    reverse_icons::UInt8
    icons_only::UInt8
    multi_range::Cstring
    stop_if_true::UInt8
end

struct __JL_Ctag_41
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_cond_format_obj}
end

function Base.getproperty(x::__JL_Ctag_41, f::Symbol)
    f === :stqe_next && return Ptr{lxw_cond_format_obj}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_cond_format_obj
    data::NTuple{2248,UInt8}
end

function Base.getproperty(x::Ptr{lxw_cond_format_obj}, f::Symbol)
    f === :type && return Ptr{UInt8}(x + 0)
    f === :criteria && return Ptr{UInt8}(x + 1)
    f === :min_value && return Ptr{Cdouble}(x + 8)
    f === :min_value_string && return Ptr{Cstring}(x + 16)
    f === :min_rule_type && return Ptr{UInt8}(x + 24)
    f === :min_color && return Ptr{lxw_color_t}(x + 28)
    f === :mid_value && return Ptr{Cdouble}(x + 32)
    f === :mid_value_string && return Ptr{Cstring}(x + 40)
    f === :mid_value_type && return Ptr{UInt8}(x + 48)
    f === :mid_rule_type && return Ptr{UInt8}(x + 49)
    f === :mid_color && return Ptr{lxw_color_t}(x + 52)
    f === :max_value && return Ptr{Cdouble}(x + 56)
    f === :max_value_string && return Ptr{Cstring}(x + 64)
    f === :max_value_type && return Ptr{UInt8}(x + 72)
    f === :max_rule_type && return Ptr{UInt8}(x + 73)
    f === :max_color && return Ptr{lxw_color_t}(x + 76)
    f === :data_bar_2010 && return Ptr{UInt8}(x + 80)
    f === :auto_min && return Ptr{UInt8}(x + 81)
    f === :auto_max && return Ptr{UInt8}(x + 82)
    f === :bar_only && return Ptr{UInt8}(x + 83)
    f === :bar_solid && return Ptr{UInt8}(x + 84)
    f === :bar_negative_color_same && return Ptr{UInt8}(x + 85)
    f === :bar_negative_border_color_same && return Ptr{UInt8}(x + 86)
    f === :bar_no_border && return Ptr{UInt8}(x + 87)
    f === :bar_direction && return Ptr{UInt8}(x + 88)
    f === :bar_axis_position && return Ptr{UInt8}(x + 89)
    f === :bar_color && return Ptr{lxw_color_t}(x + 92)
    f === :bar_negative_color && return Ptr{lxw_color_t}(x + 96)
    f === :bar_border_color && return Ptr{lxw_color_t}(x + 100)
    f === :bar_negative_border_color && return Ptr{lxw_color_t}(x + 104)
    f === :bar_axis_color && return Ptr{lxw_color_t}(x + 108)
    f === :icon_style && return Ptr{UInt8}(x + 112)
    f === :reverse_icons && return Ptr{UInt8}(x + 113)
    f === :icons_only && return Ptr{UInt8}(x + 114)
    f === :stop_if_true && return Ptr{UInt8}(x + 115)
    f === :has_max && return Ptr{UInt8}(x + 116)
    f === :type_string && return Ptr{Cstring}(x + 120)
    f === :guid && return Ptr{Cstring}(x + 128)
    f === :dxf_index && return Ptr{Int32}(x + 136)
    f === :dxf_priority && return Ptr{UInt32}(x + 140)
    f === :first_cell && return Ptr{NTuple{14,Cchar}}(x + 144)
    f === :sqref && return Ptr{NTuple{2080,Cchar}}(x + 158)
    f === :list_pointers && return Ptr{Cvoid}(x + 2240)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_cond_format_obj, f::Symbol)
    r = Ref{lxw_cond_format_obj}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_cond_format_obj}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_cond_format_obj}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_40
    rbe_left::Ptr{Cvoid} # rbe_left::Ptr{lxw_cond_format_hash_element}
    rbe_right::Ptr{Cvoid} # rbe_right::Ptr{lxw_cond_format_hash_element}
    rbe_parent::Ptr{Cvoid} # rbe_parent::Ptr{lxw_cond_format_hash_element}
    rbe_color::Cint
end

function Base.getproperty(x::__JL_Ctag_40, f::Symbol)
    f === :rbe_left && return Ptr{lxw_cond_format_hash_element}(getfield(x, f))
    f === :rbe_right && return Ptr{lxw_cond_format_hash_element}(getfield(x, f))
    f === :rbe_parent && return Ptr{lxw_cond_format_hash_element}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_cond_format_hash_element
    data::NTuple{2120,UInt8}
end

function Base.getproperty(x::Ptr{lxw_cond_format_hash_element}, f::Symbol)
    f === :sqref && return Ptr{NTuple{2080,Cchar}}(x + 0)
    f === :cond_formats && return Ptr{Ptr{lxw_cond_format_list}}(x + 2080)
    f === :tree_pointers && return Ptr{Cvoid}(x + 2088)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_cond_format_hash_element, f::Symbol)
    r = Ref{lxw_cond_format_hash_element}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_cond_format_hash_element}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_cond_format_hash_element}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_table_column
    header::Cstring
    formula::Cstring
    total_string::Cstring
    total_function::UInt8
    header_format::Ptr{lxw_format}
    format::Ptr{lxw_format}
    total_value::Cdouble
end

struct lxw_table_options
    name::Cstring
    no_header_row::UInt8
    no_autofilter::UInt8
    no_banded_rows::UInt8
    banded_columns::UInt8
    first_column::UInt8
    last_column::UInt8
    style_type::UInt8
    style_type_number::UInt8
    total_row::UInt8
    columns::Ptr{Ptr{lxw_table_column}}
end

struct __JL_Ctag_39
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_table_obj}
end

function Base.getproperty(x::__JL_Ctag_39, f::Symbol)
    f === :stqe_next && return Ptr{lxw_table_obj}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_table_obj
    data::NTuple{4224,UInt8}
end

function Base.getproperty(x::Ptr{lxw_table_obj}, f::Symbol)
    f === :name && return Ptr{Cstring}(x + 0)
    f === :total_string && return Ptr{Cstring}(x + 8)
    f === :columns && return Ptr{Ptr{Ptr{lxw_table_column}}}(x + 16)
    f === :banded_columns && return Ptr{UInt8}(x + 24)
    f === :first_column && return Ptr{UInt8}(x + 25)
    f === :last_column && return Ptr{UInt8}(x + 26)
    f === :no_autofilter && return Ptr{UInt8}(x + 27)
    f === :no_banded_rows && return Ptr{UInt8}(x + 28)
    f === :no_header_row && return Ptr{UInt8}(x + 29)
    f === :style_type && return Ptr{UInt8}(x + 30)
    f === :style_type_number && return Ptr{UInt8}(x + 31)
    f === :total_row && return Ptr{UInt8}(x + 32)
    f === :first_row && return Ptr{lxw_row_t}(x + 36)
    f === :first_col && return Ptr{lxw_col_t}(x + 40)
    f === :last_row && return Ptr{lxw_row_t}(x + 44)
    f === :last_col && return Ptr{lxw_col_t}(x + 48)
    f === :num_cols && return Ptr{lxw_col_t}(x + 50)
    f === :id && return Ptr{UInt32}(x + 52)
    f === :sqref && return Ptr{NTuple{2080,Cchar}}(x + 56)
    f === :filter_sqref && return Ptr{NTuple{2080,Cchar}}(x + 2136)
    f === :list_pointers && return Ptr{Cvoid}(x + 4216)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_table_obj, f::Symbol)
    r = Ref{lxw_table_obj}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_table_obj}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_table_obj}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_filter_rule
    criteria::UInt8
    value_string::Cstring
    value::Cdouble
end

struct lxw_filter_rule_obj
    type::UInt8
    is_custom::UInt8
    has_blanks::UInt8
    col_num::lxw_col_t
    criteria1::UInt8
    criteria2::UInt8
    value1::Cdouble
    value2::Cdouble
    value1_string::Cstring
    value2_string::Cstring
    num_list_filters::UInt16
    list::Ptr{Cstring}
end

struct lxw_image_options
    x_offset::Int32
    y_offset::Int32
    x_scale::Cdouble
    y_scale::Cdouble
    object_position::UInt8
    description::Cstring
    decorative::UInt8
    url::Cstring
    tip::Cstring
    cell_format::Ptr{lxw_format}
end

struct lxw_chart_options
    x_offset::Int32
    y_offset::Int32
    x_scale::Cdouble
    y_scale::Cdouble
    object_position::UInt8
    description::Cstring
    decorative::UInt8
end

struct lxw_comment_options
    visible::UInt8
    author::Cstring
    width::UInt16
    height::UInt16
    x_scale::Cdouble
    y_scale::Cdouble
    color::lxw_color_t
    font_name::Cstring
    font_size::Cdouble
    font_family::UInt8
    start_row::lxw_row_t
    start_col::lxw_col_t
    x_offset::Int32
    y_offset::Int32
end

struct lxw_button_options
    caption::Cstring
    _macro::Cstring
    description::Cstring
    width::UInt16
    height::UInt16
    x_scale::Cdouble
    y_scale::Cdouble
    x_offset::Int32
    y_offset::Int32
end

struct lxw_header_footer_options
    margin::Cdouble
    image_left::Cstring
    image_center::Cstring
    image_right::Cstring
end

struct lxw_protection
    no_select_locked_cells::UInt8
    no_select_unlocked_cells::UInt8
    format_cells::UInt8
    format_columns::UInt8
    format_rows::UInt8
    insert_columns::UInt8
    insert_rows::UInt8
    insert_hyperlinks::UInt8
    delete_columns::UInt8
    delete_rows::UInt8
    sort::UInt8
    autofilter::UInt8
    pivot_tables::UInt8
    scenarios::UInt8
    objects::UInt8
    no_content::UInt8
    no_objects::UInt8
end

struct lxw_protection_obj
    no_select_locked_cells::UInt8
    no_select_unlocked_cells::UInt8
    format_cells::UInt8
    format_columns::UInt8
    format_rows::UInt8
    insert_columns::UInt8
    insert_rows::UInt8
    insert_hyperlinks::UInt8
    delete_columns::UInt8
    delete_rows::UInt8
    sort::UInt8
    autofilter::UInt8
    pivot_tables::UInt8
    scenarios::UInt8
    objects::UInt8
    no_content::UInt8
    no_objects::UInt8
    no_sheet::UInt8
    is_configured::UInt8
    hash::NTuple{5,Cchar}
end

struct lxw_rich_string_tuple
    format::Ptr{lxw_format}
    string::Cstring
end

struct __JL_Ctag_38
    rbe_left::Ptr{Cvoid} # rbe_left::Ptr{lxw_row}
    rbe_right::Ptr{Cvoid} # rbe_right::Ptr{lxw_row}
    rbe_parent::Ptr{Cvoid} # rbe_parent::Ptr{lxw_row}
    rbe_color::Cint
end

function Base.getproperty(x::__JL_Ctag_38, f::Symbol)
    f === :rbe_left && return Ptr{lxw_row}(getfield(x, f))
    f === :rbe_right && return Ptr{lxw_row}(getfield(x, f))
    f === :rbe_parent && return Ptr{lxw_row}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_row
    data::NTuple{72,UInt8}
end

function Base.getproperty(x::Ptr{lxw_row}, f::Symbol)
    f === :row_num && return Ptr{lxw_row_t}(x + 0)
    f === :height && return Ptr{Cdouble}(x + 8)
    f === :format && return Ptr{Ptr{lxw_format}}(x + 16)
    f === :hidden && return Ptr{UInt8}(x + 24)
    f === :level && return Ptr{UInt8}(x + 25)
    f === :collapsed && return Ptr{UInt8}(x + 26)
    f === :row_changed && return Ptr{UInt8}(x + 27)
    f === :data_changed && return Ptr{UInt8}(x + 28)
    f === :height_changed && return Ptr{UInt8}(x + 29)
    f === :cells && return Ptr{Ptr{lxw_table_cells}}(x + 32)
    f === :tree_pointers && return Ptr{Cvoid}(x + 40)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_row, f::Symbol)
    r = Ref{lxw_row}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_row}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_row}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_24
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_worksheet}
end

function Base.getproperty(x::__JL_Ctag_24, f::Symbol)
    f === :stqe_next && return Ptr{lxw_worksheet}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_worksheet
    data::NTuple{976,UInt8}
end

function Base.getproperty(x::Ptr{lxw_worksheet}, f::Symbol)
    f === :file && return Ptr{Ptr{Libc.FILE}}(x + 0)
    f === :optimize_tmpfile && return Ptr{Ptr{Libc.FILE}}(x + 8)
    f === :optimize_buffer && return Ptr{Cstring}(x + 16)
    f === :optimize_buffer_size && return Ptr{Csize_t}(x + 24)
    f === :table && return Ptr{Ptr{lxw_table_rows}}(x + 32)
    f === :hyperlinks && return Ptr{Ptr{lxw_table_rows}}(x + 40)
    f === :comments && return Ptr{Ptr{lxw_table_rows}}(x + 48)
    f === :array && return Ptr{Ptr{Ptr{lxw_cell}}}(x + 56)
    f === :merged_ranges && return Ptr{Ptr{lxw_merged_ranges}}(x + 64)
    f === :selections && return Ptr{Ptr{lxw_selections}}(x + 72)
    f === :data_validations && return Ptr{Ptr{lxw_data_validations}}(x + 80)
    f === :conditional_formats && return Ptr{Ptr{lxw_cond_format_hash}}(x + 88)
    f === :image_props && return Ptr{Ptr{lxw_image_props}}(x + 96)
    f === :embedded_image_props && return Ptr{Ptr{lxw_image_props}}(x + 104)
    f === :chart_data && return Ptr{Ptr{lxw_chart_props}}(x + 112)
    f === :drawing_rel_ids && return Ptr{Ptr{lxw_drawing_rel_ids}}(x + 120)
    f === :vml_drawing_rel_ids && return Ptr{Ptr{lxw_vml_drawing_rel_ids}}(x + 128)
    f === :comment_objs && return Ptr{Ptr{lxw_comment_objs}}(x + 136)
    f === :header_image_objs && return Ptr{Ptr{lxw_comment_objs}}(x + 144)
    f === :button_objs && return Ptr{Ptr{lxw_comment_objs}}(x + 152)
    f === :table_objs && return Ptr{Ptr{lxw_table_objs}}(x + 160)
    f === :table_count && return Ptr{UInt16}(x + 168)
    f === :dim_rowmin && return Ptr{lxw_row_t}(x + 172)
    f === :dim_rowmax && return Ptr{lxw_row_t}(x + 176)
    f === :dim_colmin && return Ptr{lxw_col_t}(x + 180)
    f === :dim_colmax && return Ptr{lxw_col_t}(x + 182)
    f === :sst && return Ptr{Ptr{lxw_sst}}(x + 184)
    f === :name && return Ptr{Cstring}(x + 192)
    f === :quoted_name && return Ptr{Cstring}(x + 200)
    f === :tmpdir && return Ptr{Cstring}(x + 208)
    f === :index && return Ptr{UInt16}(x + 216)
    f === :active && return Ptr{UInt8}(x + 218)
    f === :selected && return Ptr{UInt8}(x + 219)
    f === :hidden && return Ptr{UInt8}(x + 220)
    f === :active_sheet && return Ptr{Ptr{UInt16}}(x + 224)
    f === :first_sheet && return Ptr{Ptr{UInt16}}(x + 232)
    f === :is_chartsheet && return Ptr{UInt8}(x + 240)
    f === :col_options && return Ptr{Ptr{Ptr{lxw_col_options}}}(x + 248)
    f === :col_options_max && return Ptr{UInt16}(x + 256)
    f === :col_sizes && return Ptr{Ptr{Cdouble}}(x + 264)
    f === :col_sizes_max && return Ptr{UInt16}(x + 272)
    f === :col_formats && return Ptr{Ptr{Ptr{lxw_format}}}(x + 280)
    f === :col_formats_max && return Ptr{UInt16}(x + 288)
    f === :col_size_changed && return Ptr{UInt8}(x + 290)
    f === :row_size_changed && return Ptr{UInt8}(x + 291)
    f === :optimize && return Ptr{UInt8}(x + 292)
    f === :optimize_row && return Ptr{Ptr{lxw_row}}(x + 296)
    f === :fit_height && return Ptr{UInt16}(x + 304)
    f === :fit_width && return Ptr{UInt16}(x + 306)
    f === :horizontal_dpi && return Ptr{UInt16}(x + 308)
    f === :hlink_count && return Ptr{UInt16}(x + 310)
    f === :page_start && return Ptr{UInt16}(x + 312)
    f === :print_scale && return Ptr{UInt16}(x + 314)
    f === :rel_count && return Ptr{UInt16}(x + 316)
    f === :vertical_dpi && return Ptr{UInt16}(x + 318)
    f === :zoom && return Ptr{UInt16}(x + 320)
    f === :filter_on && return Ptr{UInt8}(x + 322)
    f === :fit_page && return Ptr{UInt8}(x + 323)
    f === :hcenter && return Ptr{UInt8}(x + 324)
    f === :orientation && return Ptr{UInt8}(x + 325)
    f === :outline_changed && return Ptr{UInt8}(x + 326)
    f === :outline_on && return Ptr{UInt8}(x + 327)
    f === :outline_style && return Ptr{UInt8}(x + 328)
    f === :outline_below && return Ptr{UInt8}(x + 329)
    f === :outline_right && return Ptr{UInt8}(x + 330)
    f === :page_order && return Ptr{UInt8}(x + 331)
    f === :page_setup_changed && return Ptr{UInt8}(x + 332)
    f === :page_view && return Ptr{UInt8}(x + 333)
    f === :paper_size && return Ptr{UInt8}(x + 334)
    f === :print_gridlines && return Ptr{UInt8}(x + 335)
    f === :print_headers && return Ptr{UInt8}(x + 336)
    f === :print_options_changed && return Ptr{UInt8}(x + 337)
    f === :right_to_left && return Ptr{UInt8}(x + 338)
    f === :screen_gridlines && return Ptr{UInt8}(x + 339)
    f === :show_zeros && return Ptr{UInt8}(x + 340)
    f === :vcenter && return Ptr{UInt8}(x + 341)
    f === :zoom_scale_normal && return Ptr{UInt8}(x + 342)
    f === :black_white && return Ptr{UInt8}(x + 343)
    f === :num_validations && return Ptr{UInt8}(x + 344)
    f === :has_dynamic_functions && return Ptr{UInt8}(x + 345)
    f === :vba_codename && return Ptr{Cstring}(x + 352)
    f === :num_buttons && return Ptr{UInt16}(x + 360)
    f === :tab_color && return Ptr{lxw_color_t}(x + 364)
    f === :margin_left && return Ptr{Cdouble}(x + 368)
    f === :margin_right && return Ptr{Cdouble}(x + 376)
    f === :margin_top && return Ptr{Cdouble}(x + 384)
    f === :margin_bottom && return Ptr{Cdouble}(x + 392)
    f === :margin_header && return Ptr{Cdouble}(x + 400)
    f === :margin_footer && return Ptr{Cdouble}(x + 408)
    f === :default_row_height && return Ptr{Cdouble}(x + 416)
    f === :default_row_pixels && return Ptr{UInt32}(x + 424)
    f === :default_col_pixels && return Ptr{UInt32}(x + 428)
    f === :default_row_zeroed && return Ptr{UInt8}(x + 432)
    f === :default_row_set && return Ptr{UInt8}(x + 433)
    f === :outline_row_level && return Ptr{UInt8}(x + 434)
    f === :outline_col_level && return Ptr{UInt8}(x + 435)
    f === :header_footer_changed && return Ptr{UInt8}(x + 436)
    f === :header && return Ptr{Cstring}(x + 440)
    f === :footer && return Ptr{Cstring}(x + 448)
    f === :repeat_rows && return Ptr{lxw_repeat_rows}(x + 456)
    f === :repeat_cols && return Ptr{lxw_repeat_cols}(x + 468)
    f === :print_area && return Ptr{lxw_print_area}(x + 476)
    f === :autofilter && return Ptr{lxw_autofilter}(x + 492)
    f === :merged_range_count && return Ptr{UInt16}(x + 508)
    f === :max_url_length && return Ptr{UInt16}(x + 510)
    f === :hbreaks && return Ptr{Ptr{lxw_row_t}}(x + 512)
    f === :vbreaks && return Ptr{Ptr{lxw_col_t}}(x + 520)
    f === :hbreaks_count && return Ptr{UInt16}(x + 528)
    f === :vbreaks_count && return Ptr{UInt16}(x + 530)
    f === :drawing_rel_id && return Ptr{UInt32}(x + 532)
    f === :vml_drawing_rel_id && return Ptr{UInt32}(x + 536)
    f === :external_hyperlinks && return Ptr{Ptr{lxw_rel_tuples}}(x + 544)
    f === :external_drawing_links && return Ptr{Ptr{lxw_rel_tuples}}(x + 552)
    f === :drawing_links && return Ptr{Ptr{lxw_rel_tuples}}(x + 560)
    f === :vml_drawing_links && return Ptr{Ptr{lxw_rel_tuples}}(x + 568)
    f === :external_table_links && return Ptr{Ptr{lxw_rel_tuples}}(x + 576)
    f === :panes && return Ptr{lxw_panes}(x + 584)
    f === :top_left_cell && return Ptr{NTuple{14,Cchar}}(x + 624)
    f === :protection && return Ptr{lxw_protection_obj}(x + 638)
    f === :drawing && return Ptr{Ptr{lxw_drawing}}(x + 664)
    f === :default_url_format && return Ptr{Ptr{lxw_format}}(x + 672)
    f === :has_vml && return Ptr{UInt8}(x + 680)
    f === :has_comments && return Ptr{UInt8}(x + 681)
    f === :has_header_vml && return Ptr{UInt8}(x + 682)
    f === :has_background_image && return Ptr{UInt8}(x + 683)
    f === :has_buttons && return Ptr{UInt8}(x + 684)
    f === :storing_embedded_image && return Ptr{UInt8}(x + 685)
    f === :external_vml_comment_link && return Ptr{Ptr{lxw_rel_tuple}}(x + 688)
    f === :external_comment_link && return Ptr{Ptr{lxw_rel_tuple}}(x + 696)
    f === :external_vml_header_link && return Ptr{Ptr{lxw_rel_tuple}}(x + 704)
    f === :external_background_link && return Ptr{Ptr{lxw_rel_tuple}}(x + 712)
    f === :comment_author && return Ptr{Cstring}(x + 720)
    f === :vml_data_id_str && return Ptr{Cstring}(x + 728)
    f === :vml_header_id_str && return Ptr{Cstring}(x + 736)
    f === :vml_shape_id && return Ptr{UInt32}(x + 744)
    f === :vml_header_id && return Ptr{UInt32}(x + 748)
    f === :dxf_priority && return Ptr{UInt32}(x + 752)
    f === :comment_display_default && return Ptr{UInt8}(x + 756)
    f === :data_bar_2010_index && return Ptr{UInt32}(x + 760)
    f === :has_ignore_errors && return Ptr{UInt8}(x + 764)
    f === :ignore_number_stored_as_text && return Ptr{Cstring}(x + 768)
    f === :ignore_eval_error && return Ptr{Cstring}(x + 776)
    f === :ignore_formula_differs && return Ptr{Cstring}(x + 784)
    f === :ignore_formula_range && return Ptr{Cstring}(x + 792)
    f === :ignore_formula_unlocked && return Ptr{Cstring}(x + 800)
    f === :ignore_empty_cell_reference && return Ptr{Cstring}(x + 808)
    f === :ignore_list_data_validation && return Ptr{Cstring}(x + 816)
    f === :ignore_calculated_column && return Ptr{Cstring}(x + 824)
    f === :ignore_two_digit_text_year && return Ptr{Cstring}(x + 832)
    f === :excel_version && return Ptr{UInt16}(x + 840)
    f === :header_footer_objs &&
        return Ptr{NTuple{6,Ptr{Ptr{lxw_object_properties}}}}(x + 848)
    f === :header_left_object_props && return Ptr{Ptr{lxw_object_properties}}(x + 896)
    f === :header_center_object_props && return Ptr{Ptr{lxw_object_properties}}(x + 904)
    f === :header_right_object_props && return Ptr{Ptr{lxw_object_properties}}(x + 912)
    f === :footer_left_object_props && return Ptr{Ptr{lxw_object_properties}}(x + 920)
    f === :footer_center_object_props && return Ptr{Ptr{lxw_object_properties}}(x + 928)
    f === :footer_right_object_props && return Ptr{Ptr{lxw_object_properties}}(x + 936)
    f === :background_image && return Ptr{Ptr{lxw_object_properties}}(x + 944)
    f === :filter_rules && return Ptr{Ptr{Ptr{lxw_filter_rule_obj}}}(x + 952)
    f === :num_filter_rules && return Ptr{lxw_col_t}(x + 960)
    f === :list_pointers && return Ptr{Cvoid}(x + 968)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_worksheet, f::Symbol)
    r = Ref{lxw_worksheet}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_worksheet}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_worksheet}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_worksheet_init_data
    index::UInt16
    hidden::UInt8
    optimize::UInt8
    active_sheet::Ptr{UInt16}
    first_sheet::Ptr{UInt16}
    sst::Ptr{lxw_sst}
    name::Cstring
    quoted_name::Cstring
    tmpdir::Cstring
    default_url_format::Ptr{lxw_format}
    max_url_length::UInt16
end

struct __JL_Ctag_20
    data::NTuple{8,UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_20}, f::Symbol)
    f === :number && return Ptr{Cdouble}(x + 0)
    f === :string_id && return Ptr{Int32}(x + 0)
    f === :string && return Ptr{Cstring}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_20, f::Symbol)
    r = Ref{__JL_Ctag_20}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_20}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_20}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_21
    rbe_left::Ptr{Cvoid} # rbe_left::Ptr{lxw_cell}
    rbe_right::Ptr{Cvoid} # rbe_right::Ptr{lxw_cell}
    rbe_parent::Ptr{Cvoid} # rbe_parent::Ptr{lxw_cell}
    rbe_color::Cint
end

function Base.getproperty(x::__JL_Ctag_21, f::Symbol)
    f === :rbe_left && return Ptr{lxw_cell}(getfield(x, f))
    f === :rbe_right && return Ptr{lxw_cell}(getfield(x, f))
    f === :rbe_parent && return Ptr{lxw_cell}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_cell
    data::NTuple{104,UInt8}
end

function Base.getproperty(x::Ptr{lxw_cell}, f::Symbol)
    f === :row_num && return Ptr{lxw_row_t}(x + 0)
    f === :col_num && return Ptr{lxw_col_t}(x + 4)
    f === :type && return Ptr{cell_types}(x + 8)
    f === :format && return Ptr{Ptr{lxw_format}}(x + 16)
    f === :comment && return Ptr{Ptr{lxw_vml_obj}}(x + 24)
    f === :u && return Ptr{__JL_Ctag_20}(x + 32)
    f === :formula_result && return Ptr{Cdouble}(x + 40)
    f === :user_data1 && return Ptr{Cstring}(x + 48)
    f === :user_data2 && return Ptr{Cstring}(x + 56)
    f === :sst_string && return Ptr{Cstring}(x + 64)
    f === :tree_pointers && return Ptr{Cvoid}(x + 72)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_cell, f::Symbol)
    r = Ref{lxw_cell}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_cell}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_cell}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function worksheet_write_number(worksheet, row, col, number, format)
    @ccall libxlsxwriter.worksheet_write_number(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        number::Cdouble,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_string(worksheet, row, col, string, format)
    @ccall libxlsxwriter.worksheet_write_string(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        string::Cstring,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_formula(worksheet, row, col, formula, format)
    @ccall libxlsxwriter.worksheet_write_formula(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        formula::Cstring,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_array_formula(
    worksheet,
    first_row,
    first_col,
    last_row,
    last_col,
    formula,
    format,
)
    @ccall libxlsxwriter.worksheet_write_array_formula(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
        formula::Cstring,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_dynamic_array_formula(
    worksheet,
    first_row,
    first_col,
    last_row,
    last_col,
    formula,
    format,
)
    @ccall libxlsxwriter.worksheet_write_dynamic_array_formula(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
        formula::Cstring,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_dynamic_formula(worksheet, row, col, formula, format)
    @ccall libxlsxwriter.worksheet_write_dynamic_formula(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        formula::Cstring,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_array_formula_num(
    worksheet,
    first_row,
    first_col,
    last_row,
    last_col,
    formula,
    format,
    result,
)
    @ccall libxlsxwriter.worksheet_write_array_formula_num(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
        formula::Cstring,
        format::Ptr{lxw_format},
        result::Cdouble,
    )::lxw_error
end

function worksheet_write_dynamic_array_formula_num(
    worksheet,
    first_row,
    first_col,
    last_row,
    last_col,
    formula,
    format,
    result,
)
    @ccall libxlsxwriter.worksheet_write_dynamic_array_formula_num(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
        formula::Cstring,
        format::Ptr{lxw_format},
        result::Cdouble,
    )::lxw_error
end

function worksheet_write_dynamic_formula_num(worksheet, row, col, formula, format, result)
    @ccall libxlsxwriter.worksheet_write_dynamic_formula_num(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        formula::Cstring,
        format::Ptr{lxw_format},
        result::Cdouble,
    )::lxw_error
end

function worksheet_write_datetime(worksheet, row, col, datetime, format)
    @ccall libxlsxwriter.worksheet_write_datetime(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        datetime::Ptr{lxw_datetime},
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_unixtime(worksheet, row, col, unixtime, format)
    @ccall libxlsxwriter.worksheet_write_unixtime(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        unixtime::Int64,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_url(worksheet, row, col, url, format)
    @ccall libxlsxwriter.worksheet_write_url(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        url::Cstring,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_url_opt(worksheet, row_num, col_num, url, format, string, tooltip)
    @ccall libxlsxwriter.worksheet_write_url_opt(
        worksheet::Ptr{lxw_worksheet},
        row_num::lxw_row_t,
        col_num::lxw_col_t,
        url::Cstring,
        format::Ptr{lxw_format},
        string::Cstring,
        tooltip::Cstring,
    )::lxw_error
end

function worksheet_write_boolean(worksheet, row, col, value, format)
    @ccall libxlsxwriter.worksheet_write_boolean(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        value::Cint,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_blank(worksheet, row, col, format)
    @ccall libxlsxwriter.worksheet_write_blank(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_formula_num(worksheet, row, col, formula, format, result)
    @ccall libxlsxwriter.worksheet_write_formula_num(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        formula::Cstring,
        format::Ptr{lxw_format},
        result::Cdouble,
    )::lxw_error
end

function worksheet_write_formula_str(worksheet, row, col, formula, format, result)
    @ccall libxlsxwriter.worksheet_write_formula_str(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        formula::Cstring,
        format::Ptr{lxw_format},
        result::Cstring,
    )::lxw_error
end

function worksheet_write_rich_string(worksheet, row, col, rich_string, format)
    @ccall libxlsxwriter.worksheet_write_rich_string(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        rich_string::Ptr{Ptr{lxw_rich_string_tuple}},
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_write_comment(worksheet, row, col, string)
    @ccall libxlsxwriter.worksheet_write_comment(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        string::Cstring,
    )::lxw_error
end

function worksheet_write_comment_opt(worksheet, row, col, string, options)
    @ccall libxlsxwriter.worksheet_write_comment_opt(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        string::Cstring,
        options::Ptr{lxw_comment_options},
    )::lxw_error
end

function worksheet_set_row(worksheet, row, height, format)
    @ccall libxlsxwriter.worksheet_set_row(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        height::Cdouble,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_set_row_opt(worksheet, row, height, format, options)
    @ccall libxlsxwriter.worksheet_set_row_opt(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        height::Cdouble,
        format::Ptr{lxw_format},
        options::Ptr{lxw_row_col_options},
    )::lxw_error
end

function worksheet_set_row_pixels(worksheet, row, pixels, format)
    @ccall libxlsxwriter.worksheet_set_row_pixels(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        pixels::UInt32,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_set_row_pixels_opt(worksheet, row, pixels, format, options)
    @ccall libxlsxwriter.worksheet_set_row_pixels_opt(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        pixels::UInt32,
        format::Ptr{lxw_format},
        options::Ptr{lxw_row_col_options},
    )::lxw_error
end

function worksheet_set_column(worksheet, first_col, last_col, width, format)
    @ccall libxlsxwriter.worksheet_set_column(
        worksheet::Ptr{lxw_worksheet},
        first_col::lxw_col_t,
        last_col::lxw_col_t,
        width::Cdouble,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_set_column_opt(worksheet, first_col, last_col, width, format, options)
    @ccall libxlsxwriter.worksheet_set_column_opt(
        worksheet::Ptr{lxw_worksheet},
        first_col::lxw_col_t,
        last_col::lxw_col_t,
        width::Cdouble,
        format::Ptr{lxw_format},
        options::Ptr{lxw_row_col_options},
    )::lxw_error
end

function worksheet_set_column_pixels(worksheet, first_col, last_col, pixels, format)
    @ccall libxlsxwriter.worksheet_set_column_pixels(
        worksheet::Ptr{lxw_worksheet},
        first_col::lxw_col_t,
        last_col::lxw_col_t,
        pixels::UInt32,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_set_column_pixels_opt(
    worksheet,
    first_col,
    last_col,
    pixels,
    format,
    options,
)
    @ccall libxlsxwriter.worksheet_set_column_pixels_opt(
        worksheet::Ptr{lxw_worksheet},
        first_col::lxw_col_t,
        last_col::lxw_col_t,
        pixels::UInt32,
        format::Ptr{lxw_format},
        options::Ptr{lxw_row_col_options},
    )::lxw_error
end

function worksheet_insert_image(worksheet, row, col, filename)
    @ccall libxlsxwriter.worksheet_insert_image(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        filename::Cstring,
    )::lxw_error
end

function worksheet_insert_image_opt(worksheet, row, col, filename, options)
    @ccall libxlsxwriter.worksheet_insert_image_opt(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        filename::Cstring,
        options::Ptr{lxw_image_options},
    )::lxw_error
end

function worksheet_insert_image_buffer(worksheet, row, col, image_buffer, image_size)
    @ccall libxlsxwriter.worksheet_insert_image_buffer(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        image_buffer::Ptr{Cuchar},
        image_size::Csize_t,
    )::lxw_error
end

function worksheet_insert_image_buffer_opt(
    worksheet,
    row,
    col,
    image_buffer,
    image_size,
    options,
)
    @ccall libxlsxwriter.worksheet_insert_image_buffer_opt(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        image_buffer::Ptr{Cuchar},
        image_size::Csize_t,
        options::Ptr{lxw_image_options},
    )::lxw_error
end

function worksheet_embed_image(worksheet, row, col, filename)
    @ccall libxlsxwriter.worksheet_embed_image(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        filename::Cstring,
    )::lxw_error
end

function worksheet_embed_image_opt(worksheet, row, col, filename, options)
    @ccall libxlsxwriter.worksheet_embed_image_opt(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        filename::Cstring,
        options::Ptr{lxw_image_options},
    )::lxw_error
end

function worksheet_embed_image_buffer(worksheet, row, col, image_buffer, image_size)
    @ccall libxlsxwriter.worksheet_embed_image_buffer(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        image_buffer::Ptr{Cuchar},
        image_size::Csize_t,
    )::lxw_error
end

function worksheet_embed_image_buffer_opt(
    worksheet,
    row,
    col,
    image_buffer,
    image_size,
    options,
)
    @ccall libxlsxwriter.worksheet_embed_image_buffer_opt(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        image_buffer::Ptr{Cuchar},
        image_size::Csize_t,
        options::Ptr{lxw_image_options},
    )::lxw_error
end

function worksheet_set_background(worksheet, filename)
    @ccall libxlsxwriter.worksheet_set_background(
        worksheet::Ptr{lxw_worksheet},
        filename::Cstring,
    )::lxw_error
end

function worksheet_set_background_buffer(worksheet, image_buffer, image_size)
    @ccall libxlsxwriter.worksheet_set_background_buffer(
        worksheet::Ptr{lxw_worksheet},
        image_buffer::Ptr{Cuchar},
        image_size::Csize_t,
    )::lxw_error
end

function worksheet_insert_chart(worksheet, row, col, chart)
    @ccall libxlsxwriter.worksheet_insert_chart(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        chart::Ptr{lxw_chart},
    )::lxw_error
end

function worksheet_insert_chart_opt(worksheet, row, col, chart, user_options)
    @ccall libxlsxwriter.worksheet_insert_chart_opt(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        chart::Ptr{lxw_chart},
        user_options::Ptr{lxw_chart_options},
    )::lxw_error
end

function worksheet_merge_range(
    worksheet,
    first_row,
    first_col,
    last_row,
    last_col,
    string,
    format,
)
    @ccall libxlsxwriter.worksheet_merge_range(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
        string::Cstring,
        format::Ptr{lxw_format},
    )::lxw_error
end

function worksheet_autofilter(worksheet, first_row, first_col, last_row, last_col)
    @ccall libxlsxwriter.worksheet_autofilter(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
    )::lxw_error
end

function worksheet_filter_column(worksheet, col, rule)
    @ccall libxlsxwriter.worksheet_filter_column(
        worksheet::Ptr{lxw_worksheet},
        col::lxw_col_t,
        rule::Ptr{lxw_filter_rule},
    )::lxw_error
end

function worksheet_filter_column2(worksheet, col, rule1, rule2, and_or)
    @ccall libxlsxwriter.worksheet_filter_column2(
        worksheet::Ptr{lxw_worksheet},
        col::lxw_col_t,
        rule1::Ptr{lxw_filter_rule},
        rule2::Ptr{lxw_filter_rule},
        and_or::UInt8,
    )::lxw_error
end

function worksheet_filter_list(worksheet, col, list)
    @ccall libxlsxwriter.worksheet_filter_list(
        worksheet::Ptr{lxw_worksheet},
        col::lxw_col_t,
        list::Ptr{Cstring},
    )::lxw_error
end

function worksheet_data_validation_cell(worksheet, row, col, validation)
    @ccall libxlsxwriter.worksheet_data_validation_cell(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        validation::Ptr{lxw_data_validation},
    )::lxw_error
end

function worksheet_data_validation_range(
    worksheet,
    first_row,
    first_col,
    last_row,
    last_col,
    validation,
)
    @ccall libxlsxwriter.worksheet_data_validation_range(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
        validation::Ptr{lxw_data_validation},
    )::lxw_error
end

function worksheet_conditional_format_cell(worksheet, row, col, conditional_format)
    @ccall libxlsxwriter.worksheet_conditional_format_cell(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        conditional_format::Ptr{lxw_conditional_format},
    )::lxw_error
end

function worksheet_conditional_format_range(
    worksheet,
    first_row,
    first_col,
    last_row,
    last_col,
    conditional_format,
)
    @ccall libxlsxwriter.worksheet_conditional_format_range(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
        conditional_format::Ptr{lxw_conditional_format},
    )::lxw_error
end

function worksheet_insert_button(worksheet, row, col, options)
    @ccall libxlsxwriter.worksheet_insert_button(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
        options::Ptr{lxw_button_options},
    )::lxw_error
end

function worksheet_add_table(worksheet, first_row, first_col, last_row, last_col, options)
    @ccall libxlsxwriter.worksheet_add_table(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
        options::Ptr{lxw_table_options},
    )::lxw_error
end

function worksheet_activate(worksheet)
    @ccall libxlsxwriter.worksheet_activate(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_select(worksheet)
    @ccall libxlsxwriter.worksheet_select(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_hide(worksheet)
    @ccall libxlsxwriter.worksheet_hide(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_set_first_sheet(worksheet)
    @ccall libxlsxwriter.worksheet_set_first_sheet(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_freeze_panes(worksheet, row, col)
    @ccall libxlsxwriter.worksheet_freeze_panes(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
    )::Cvoid
end

function worksheet_split_panes(worksheet, vertical, horizontal)
    @ccall libxlsxwriter.worksheet_split_panes(
        worksheet::Ptr{lxw_worksheet},
        vertical::Cdouble,
        horizontal::Cdouble,
    )::Cvoid
end

function worksheet_freeze_panes_opt(
    worksheet,
    first_row,
    first_col,
    top_row,
    left_col,
    type,
)
    @ccall libxlsxwriter.worksheet_freeze_panes_opt(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        top_row::lxw_row_t,
        left_col::lxw_col_t,
        type::UInt8,
    )::Cvoid
end

function worksheet_split_panes_opt(worksheet, vertical, horizontal, top_row, left_col)
    @ccall libxlsxwriter.worksheet_split_panes_opt(
        worksheet::Ptr{lxw_worksheet},
        vertical::Cdouble,
        horizontal::Cdouble,
        top_row::lxw_row_t,
        left_col::lxw_col_t,
    )::Cvoid
end

function worksheet_set_selection(worksheet, first_row, first_col, last_row, last_col)
    @ccall libxlsxwriter.worksheet_set_selection(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
    )::lxw_error
end

function worksheet_set_top_left_cell(worksheet, row, col)
    @ccall libxlsxwriter.worksheet_set_top_left_cell(
        worksheet::Ptr{lxw_worksheet},
        row::lxw_row_t,
        col::lxw_col_t,
    )::Cvoid
end

function worksheet_set_landscape(worksheet)
    @ccall libxlsxwriter.worksheet_set_landscape(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_set_portrait(worksheet)
    @ccall libxlsxwriter.worksheet_set_portrait(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_set_page_view(worksheet)
    @ccall libxlsxwriter.worksheet_set_page_view(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_set_paper(worksheet, paper_type)
    @ccall libxlsxwriter.worksheet_set_paper(
        worksheet::Ptr{lxw_worksheet},
        paper_type::UInt8,
    )::Cvoid
end

function worksheet_set_margins(worksheet, left, right, top, bottom)
    @ccall libxlsxwriter.worksheet_set_margins(
        worksheet::Ptr{lxw_worksheet},
        left::Cdouble,
        right::Cdouble,
        top::Cdouble,
        bottom::Cdouble,
    )::Cvoid
end

function worksheet_set_header(worksheet, string)
    @ccall libxlsxwriter.worksheet_set_header(
        worksheet::Ptr{lxw_worksheet},
        string::Cstring,
    )::lxw_error
end

function worksheet_set_footer(worksheet, string)
    @ccall libxlsxwriter.worksheet_set_footer(
        worksheet::Ptr{lxw_worksheet},
        string::Cstring,
    )::lxw_error
end

function worksheet_set_header_opt(worksheet, string, options)
    @ccall libxlsxwriter.worksheet_set_header_opt(
        worksheet::Ptr{lxw_worksheet},
        string::Cstring,
        options::Ptr{lxw_header_footer_options},
    )::lxw_error
end

function worksheet_set_footer_opt(worksheet, string, options)
    @ccall libxlsxwriter.worksheet_set_footer_opt(
        worksheet::Ptr{lxw_worksheet},
        string::Cstring,
        options::Ptr{lxw_header_footer_options},
    )::lxw_error
end

function worksheet_set_h_pagebreaks(worksheet, breaks)
    @ccall libxlsxwriter.worksheet_set_h_pagebreaks(
        worksheet::Ptr{lxw_worksheet},
        breaks::Ptr{lxw_row_t},
    )::lxw_error
end

function worksheet_set_v_pagebreaks(worksheet, breaks)
    @ccall libxlsxwriter.worksheet_set_v_pagebreaks(
        worksheet::Ptr{lxw_worksheet},
        breaks::Ptr{lxw_col_t},
    )::lxw_error
end

function worksheet_print_across(worksheet)
    @ccall libxlsxwriter.worksheet_print_across(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_set_zoom(worksheet, scale)
    @ccall libxlsxwriter.worksheet_set_zoom(
        worksheet::Ptr{lxw_worksheet},
        scale::UInt16,
    )::Cvoid
end

function worksheet_gridlines(worksheet, option)
    @ccall libxlsxwriter.worksheet_gridlines(
        worksheet::Ptr{lxw_worksheet},
        option::UInt8,
    )::Cvoid
end

function worksheet_center_horizontally(worksheet)
    @ccall libxlsxwriter.worksheet_center_horizontally(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_center_vertically(worksheet)
    @ccall libxlsxwriter.worksheet_center_vertically(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_print_row_col_headers(worksheet)
    @ccall libxlsxwriter.worksheet_print_row_col_headers(
        worksheet::Ptr{lxw_worksheet},
    )::Cvoid
end

function worksheet_repeat_rows(worksheet, first_row, last_row)
    @ccall libxlsxwriter.worksheet_repeat_rows(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        last_row::lxw_row_t,
    )::lxw_error
end

function worksheet_repeat_columns(worksheet, first_col, last_col)
    @ccall libxlsxwriter.worksheet_repeat_columns(
        worksheet::Ptr{lxw_worksheet},
        first_col::lxw_col_t,
        last_col::lxw_col_t,
    )::lxw_error
end

function worksheet_print_area(worksheet, first_row, first_col, last_row, last_col)
    @ccall libxlsxwriter.worksheet_print_area(
        worksheet::Ptr{lxw_worksheet},
        first_row::lxw_row_t,
        first_col::lxw_col_t,
        last_row::lxw_row_t,
        last_col::lxw_col_t,
    )::lxw_error
end

function worksheet_fit_to_pages(worksheet, width, height)
    @ccall libxlsxwriter.worksheet_fit_to_pages(
        worksheet::Ptr{lxw_worksheet},
        width::UInt16,
        height::UInt16,
    )::Cvoid
end

function worksheet_set_start_page(worksheet, start_page)
    @ccall libxlsxwriter.worksheet_set_start_page(
        worksheet::Ptr{lxw_worksheet},
        start_page::UInt16,
    )::Cvoid
end

function worksheet_set_print_scale(worksheet, scale)
    @ccall libxlsxwriter.worksheet_set_print_scale(
        worksheet::Ptr{lxw_worksheet},
        scale::UInt16,
    )::Cvoid
end

function worksheet_print_black_and_white(worksheet)
    @ccall libxlsxwriter.worksheet_print_black_and_white(
        worksheet::Ptr{lxw_worksheet},
    )::Cvoid
end

function worksheet_right_to_left(worksheet)
    @ccall libxlsxwriter.worksheet_right_to_left(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_hide_zero(worksheet)
    @ccall libxlsxwriter.worksheet_hide_zero(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_set_tab_color(worksheet, color)
    @ccall libxlsxwriter.worksheet_set_tab_color(
        worksheet::Ptr{lxw_worksheet},
        color::lxw_color_t,
    )::Cvoid
end

function worksheet_protect(worksheet, password, options)
    @ccall libxlsxwriter.worksheet_protect(
        worksheet::Ptr{lxw_worksheet},
        password::Cstring,
        options::Ptr{lxw_protection},
    )::Cvoid
end

function worksheet_outline_settings(
    worksheet,
    visible,
    symbols_below,
    symbols_right,
    auto_style,
)
    @ccall libxlsxwriter.worksheet_outline_settings(
        worksheet::Ptr{lxw_worksheet},
        visible::UInt8,
        symbols_below::UInt8,
        symbols_right::UInt8,
        auto_style::UInt8,
    )::Cvoid
end

function worksheet_set_default_row(worksheet, height, hide_unused_rows)
    @ccall libxlsxwriter.worksheet_set_default_row(
        worksheet::Ptr{lxw_worksheet},
        height::Cdouble,
        hide_unused_rows::UInt8,
    )::Cvoid
end

function worksheet_set_vba_name(worksheet, name)
    @ccall libxlsxwriter.worksheet_set_vba_name(
        worksheet::Ptr{lxw_worksheet},
        name::Cstring,
    )::lxw_error
end

function worksheet_show_comments(worksheet)
    @ccall libxlsxwriter.worksheet_show_comments(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function worksheet_set_comments_author(worksheet, author)
    @ccall libxlsxwriter.worksheet_set_comments_author(
        worksheet::Ptr{lxw_worksheet},
        author::Cstring,
    )::Cvoid
end

function worksheet_ignore_errors(worksheet, type, range)
    @ccall libxlsxwriter.worksheet_ignore_errors(
        worksheet::Ptr{lxw_worksheet},
        type::UInt8,
        range::Cstring,
    )::lxw_error
end

function lxw_worksheet_new(init_data)
    @ccall libxlsxwriter.lxw_worksheet_new(
        init_data::Ptr{lxw_worksheet_init_data},
    )::Ptr{lxw_worksheet}
end

function lxw_worksheet_free(worksheet)
    @ccall libxlsxwriter.lxw_worksheet_free(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function lxw_worksheet_assemble_xml_file(worksheet)
    @ccall libxlsxwriter.lxw_worksheet_assemble_xml_file(
        worksheet::Ptr{lxw_worksheet},
    )::Cvoid
end

function lxw_worksheet_write_single_row(worksheet)
    @ccall libxlsxwriter.lxw_worksheet_write_single_row(
        worksheet::Ptr{lxw_worksheet},
    )::Cvoid
end

function lxw_worksheet_prepare_image(worksheet, image_ref_id, drawing_id, object_props)
    @ccall libxlsxwriter.lxw_worksheet_prepare_image(
        worksheet::Ptr{lxw_worksheet},
        image_ref_id::UInt32,
        drawing_id::UInt32,
        object_props::Ptr{lxw_object_properties},
    )::Cvoid
end

function lxw_worksheet_prepare_header_image(worksheet, image_ref_id, object_props)
    @ccall libxlsxwriter.lxw_worksheet_prepare_header_image(
        worksheet::Ptr{lxw_worksheet},
        image_ref_id::UInt32,
        object_props::Ptr{lxw_object_properties},
    )::Cvoid
end

function lxw_worksheet_prepare_background(worksheet, image_ref_id, object_props)
    @ccall libxlsxwriter.lxw_worksheet_prepare_background(
        worksheet::Ptr{lxw_worksheet},
        image_ref_id::UInt32,
        object_props::Ptr{lxw_object_properties},
    )::Cvoid
end

function lxw_worksheet_prepare_chart(
    worksheet,
    chart_ref_id,
    drawing_id,
    object_props,
    is_chartsheet,
)
    @ccall libxlsxwriter.lxw_worksheet_prepare_chart(
        worksheet::Ptr{lxw_worksheet},
        chart_ref_id::UInt32,
        drawing_id::UInt32,
        object_props::Ptr{lxw_object_properties},
        is_chartsheet::UInt8,
    )::Cvoid
end

function lxw_worksheet_prepare_vml_objects(
    worksheet,
    vml_data_id,
    vml_shape_id,
    vml_drawing_id,
    comment_id,
)
    @ccall libxlsxwriter.lxw_worksheet_prepare_vml_objects(
        worksheet::Ptr{lxw_worksheet},
        vml_data_id::UInt32,
        vml_shape_id::UInt32,
        vml_drawing_id::UInt32,
        comment_id::UInt32,
    )::UInt32
end

function lxw_worksheet_prepare_header_vml_objects(worksheet, vml_header_id, vml_drawing_id)
    @ccall libxlsxwriter.lxw_worksheet_prepare_header_vml_objects(
        worksheet::Ptr{lxw_worksheet},
        vml_header_id::UInt32,
        vml_drawing_id::UInt32,
    )::Cvoid
end

function lxw_worksheet_prepare_tables(worksheet, table_id)
    @ccall libxlsxwriter.lxw_worksheet_prepare_tables(
        worksheet::Ptr{lxw_worksheet},
        table_id::UInt32,
    )::Cvoid
end

function lxw_worksheet_find_row(worksheet, row_num)
    @ccall libxlsxwriter.lxw_worksheet_find_row(
        worksheet::Ptr{lxw_worksheet},
        row_num::lxw_row_t,
    )::Ptr{lxw_row}
end

function lxw_worksheet_find_cell_in_row(row, col_num)
    @ccall libxlsxwriter.lxw_worksheet_find_cell_in_row(
        row::Ptr{lxw_row},
        col_num::lxw_col_t,
    )::Ptr{lxw_cell}
end

function lxw_worksheet_write_sheet_views(worksheet)
    @ccall libxlsxwriter.lxw_worksheet_write_sheet_views(
        worksheet::Ptr{lxw_worksheet},
    )::Cvoid
end

function lxw_worksheet_write_page_margins(worksheet)
    @ccall libxlsxwriter.lxw_worksheet_write_page_margins(
        worksheet::Ptr{lxw_worksheet},
    )::Cvoid
end

function lxw_worksheet_write_drawings(worksheet)
    @ccall libxlsxwriter.lxw_worksheet_write_drawings(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function lxw_worksheet_write_sheet_protection(worksheet, protect)
    @ccall libxlsxwriter.lxw_worksheet_write_sheet_protection(
        worksheet::Ptr{lxw_worksheet},
        protect::Ptr{lxw_protection_obj},
    )::Cvoid
end

function lxw_worksheet_write_sheet_pr(worksheet)
    @ccall libxlsxwriter.lxw_worksheet_write_sheet_pr(worksheet::Ptr{lxw_worksheet})::Cvoid
end

function lxw_worksheet_write_page_setup(worksheet)
    @ccall libxlsxwriter.lxw_worksheet_write_page_setup(
        worksheet::Ptr{lxw_worksheet},
    )::Cvoid
end

function lxw_worksheet_write_header_footer(worksheet)
    @ccall libxlsxwriter.lxw_worksheet_write_header_footer(
        worksheet::Ptr{lxw_worksheet},
    )::Cvoid
end

function worksheet_set_error_cell(worksheet, object_props, ref_id)
    @ccall libxlsxwriter.worksheet_set_error_cell(
        worksheet::Ptr{lxw_worksheet},
        object_props::Ptr{lxw_object_properties},
        ref_id::UInt32,
    )::Cvoid
end

struct __JL_Ctag_17
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_chartsheet}
end

function Base.getproperty(x::__JL_Ctag_17, f::Symbol)
    f === :stqe_next && return Ptr{lxw_chartsheet}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_chartsheet
    data::NTuple{120,UInt8}
end

function Base.getproperty(x::Ptr{lxw_chartsheet}, f::Symbol)
    f === :file && return Ptr{Ptr{Libc.FILE}}(x + 0)
    f === :worksheet && return Ptr{Ptr{lxw_worksheet}}(x + 8)
    f === :chart && return Ptr{Ptr{lxw_chart}}(x + 16)
    f === :protection && return Ptr{lxw_protection_obj}(x + 24)
    f === :is_protected && return Ptr{UInt8}(x + 48)
    f === :name && return Ptr{Cstring}(x + 56)
    f === :quoted_name && return Ptr{Cstring}(x + 64)
    f === :tmpdir && return Ptr{Cstring}(x + 72)
    f === :index && return Ptr{UInt16}(x + 80)
    f === :active && return Ptr{UInt8}(x + 82)
    f === :selected && return Ptr{UInt8}(x + 83)
    f === :hidden && return Ptr{UInt8}(x + 84)
    f === :active_sheet && return Ptr{Ptr{UInt16}}(x + 88)
    f === :first_sheet && return Ptr{Ptr{UInt16}}(x + 96)
    f === :rel_count && return Ptr{UInt16}(x + 104)
    f === :list_pointers && return Ptr{Cvoid}(x + 112)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_chartsheet, f::Symbol)
    r = Ref{lxw_chartsheet}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_chartsheet}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_chartsheet}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function chartsheet_set_chart(chartsheet, chart)
    @ccall libxlsxwriter.chartsheet_set_chart(
        chartsheet::Ptr{lxw_chartsheet},
        chart::Ptr{lxw_chart},
    )::lxw_error
end

function chartsheet_set_chart_opt(chartsheet, chart, user_options)
    @ccall libxlsxwriter.chartsheet_set_chart_opt(
        chartsheet::Ptr{lxw_chartsheet},
        chart::Ptr{lxw_chart},
        user_options::Ptr{lxw_chart_options},
    )::lxw_error
end

function chartsheet_activate(chartsheet)
    @ccall libxlsxwriter.chartsheet_activate(chartsheet::Ptr{lxw_chartsheet})::Cvoid
end

function chartsheet_select(chartsheet)
    @ccall libxlsxwriter.chartsheet_select(chartsheet::Ptr{lxw_chartsheet})::Cvoid
end

function chartsheet_hide(chartsheet)
    @ccall libxlsxwriter.chartsheet_hide(chartsheet::Ptr{lxw_chartsheet})::Cvoid
end

function chartsheet_set_first_sheet(chartsheet)
    @ccall libxlsxwriter.chartsheet_set_first_sheet(chartsheet::Ptr{lxw_chartsheet})::Cvoid
end

function chartsheet_set_tab_color(chartsheet, color)
    @ccall libxlsxwriter.chartsheet_set_tab_color(
        chartsheet::Ptr{lxw_chartsheet},
        color::lxw_color_t,
    )::Cvoid
end

function chartsheet_protect(chartsheet, password, options)
    @ccall libxlsxwriter.chartsheet_protect(
        chartsheet::Ptr{lxw_chartsheet},
        password::Cstring,
        options::Ptr{lxw_protection},
    )::Cvoid
end

function chartsheet_set_zoom(chartsheet, scale)
    @ccall libxlsxwriter.chartsheet_set_zoom(
        chartsheet::Ptr{lxw_chartsheet},
        scale::UInt16,
    )::Cvoid
end

function chartsheet_set_landscape(chartsheet)
    @ccall libxlsxwriter.chartsheet_set_landscape(chartsheet::Ptr{lxw_chartsheet})::Cvoid
end

function chartsheet_set_portrait(chartsheet)
    @ccall libxlsxwriter.chartsheet_set_portrait(chartsheet::Ptr{lxw_chartsheet})::Cvoid
end

function chartsheet_set_paper(chartsheet, paper_type)
    @ccall libxlsxwriter.chartsheet_set_paper(
        chartsheet::Ptr{lxw_chartsheet},
        paper_type::UInt8,
    )::Cvoid
end

function chartsheet_set_margins(chartsheet, left, right, top, bottom)
    @ccall libxlsxwriter.chartsheet_set_margins(
        chartsheet::Ptr{lxw_chartsheet},
        left::Cdouble,
        right::Cdouble,
        top::Cdouble,
        bottom::Cdouble,
    )::Cvoid
end

function chartsheet_set_header(chartsheet, string)
    @ccall libxlsxwriter.chartsheet_set_header(
        chartsheet::Ptr{lxw_chartsheet},
        string::Cstring,
    )::lxw_error
end

function chartsheet_set_footer(chartsheet, string)
    @ccall libxlsxwriter.chartsheet_set_footer(
        chartsheet::Ptr{lxw_chartsheet},
        string::Cstring,
    )::lxw_error
end

function chartsheet_set_header_opt(chartsheet, string, options)
    @ccall libxlsxwriter.chartsheet_set_header_opt(
        chartsheet::Ptr{lxw_chartsheet},
        string::Cstring,
        options::Ptr{lxw_header_footer_options},
    )::lxw_error
end

function chartsheet_set_footer_opt(chartsheet, string, options)
    @ccall libxlsxwriter.chartsheet_set_footer_opt(
        chartsheet::Ptr{lxw_chartsheet},
        string::Cstring,
        options::Ptr{lxw_header_footer_options},
    )::lxw_error
end

function lxw_chartsheet_new(init_data)
    @ccall libxlsxwriter.lxw_chartsheet_new(
        init_data::Ptr{lxw_worksheet_init_data},
    )::Ptr{lxw_chartsheet}
end

function lxw_chartsheet_free(chartsheet)
    @ccall libxlsxwriter.lxw_chartsheet_free(chartsheet::Ptr{lxw_chartsheet})::Cvoid
end

function lxw_chartsheet_assemble_xml_file(chartsheet)
    @ccall libxlsxwriter.lxw_chartsheet_assemble_xml_file(
        chartsheet::Ptr{lxw_chartsheet},
    )::Cvoid
end

struct lxw_worksheet_names
    rbh_root::Ptr{Cvoid} # rbh_root::Ptr{lxw_worksheet_name}
end

function Base.getproperty(x::lxw_worksheet_names, f::Symbol)
    f === :rbh_root && return Ptr{lxw_worksheet_name}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_chartsheet_names
    rbh_root::Ptr{Cvoid} # rbh_root::Ptr{lxw_chartsheet_name}
end

function Base.getproperty(x::lxw_chartsheet_names, f::Symbol)
    f === :rbh_root && return Ptr{lxw_chartsheet_name}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_image_md5s
    rbh_root::Ptr{Cvoid} # rbh_root::Ptr{lxw_image_md5}
end

function Base.getproperty(x::lxw_image_md5s, f::Symbol)
    f === :rbh_root && return Ptr{lxw_image_md5}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_sheets
    stqh_first::Ptr{Cvoid} # stqh_first::Ptr{lxw_sheet}
    stqh_last::Ptr{Ptr{Cvoid}} # stqh_last::Ptr{Ptr{lxw_sheet}}
end

function Base.getproperty(x::lxw_sheets, f::Symbol)
    f === :stqh_first && return Ptr{lxw_sheet}(getfield(x, f))
    f === :stqh_last && return Ptr{Ptr{lxw_sheet}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_worksheets
    stqh_first::Ptr{lxw_worksheet}
    stqh_last::Ptr{Ptr{lxw_worksheet}}
end

struct lxw_chartsheets
    stqh_first::Ptr{lxw_chartsheet}
    stqh_last::Ptr{Ptr{lxw_chartsheet}}
end

struct lxw_charts
    stqh_first::Ptr{lxw_chart}
    stqh_last::Ptr{Ptr{lxw_chart}}
end

struct lxw_defined_names
    tqh_first::Ptr{Cvoid} # tqh_first::Ptr{lxw_defined_name}
    tqh_last::Ptr{Ptr{Cvoid}} # tqh_last::Ptr{Ptr{lxw_defined_name}}
end

function Base.getproperty(x::lxw_defined_names, f::Symbol)
    f === :tqh_first && return Ptr{lxw_defined_name}(getfield(x, f))
    f === :tqh_last && return Ptr{Ptr{lxw_defined_name}}(getfield(x, f))
    return getfield(x, f)
end

struct __JL_Ctag_34
    data::NTuple{8,UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_34}, f::Symbol)
    f === :worksheet && return Ptr{Ptr{lxw_worksheet}}(x + 0)
    f === :chartsheet && return Ptr{Ptr{lxw_chartsheet}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_34, f::Symbol)
    r = Ref{__JL_Ctag_34}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_34}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_34}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_35
    stqe_next::Ptr{Cvoid} # stqe_next::Ptr{lxw_sheet}
end

function Base.getproperty(x::__JL_Ctag_35, f::Symbol)
    f === :stqe_next && return Ptr{lxw_sheet}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_sheet
    data::NTuple{24,UInt8}
end

function Base.getproperty(x::Ptr{lxw_sheet}, f::Symbol)
    f === :is_chartsheet && return Ptr{UInt8}(x + 0)
    f === :u && return Ptr{__JL_Ctag_34}(x + 8)
    f === :list_pointers && return Ptr{Cvoid}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_sheet, f::Symbol)
    r = Ref{lxw_sheet}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_sheet}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_sheet}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_32
    rbe_left::Ptr{Cvoid} # rbe_left::Ptr{lxw_worksheet_name}
    rbe_right::Ptr{Cvoid} # rbe_right::Ptr{lxw_worksheet_name}
    rbe_parent::Ptr{Cvoid} # rbe_parent::Ptr{lxw_worksheet_name}
    rbe_color::Cint
end

function Base.getproperty(x::__JL_Ctag_32, f::Symbol)
    f === :rbe_left && return Ptr{lxw_worksheet_name}(getfield(x, f))
    f === :rbe_right && return Ptr{lxw_worksheet_name}(getfield(x, f))
    f === :rbe_parent && return Ptr{lxw_worksheet_name}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_worksheet_name
    data::NTuple{48,UInt8}
end

function Base.getproperty(x::Ptr{lxw_worksheet_name}, f::Symbol)
    f === :name && return Ptr{Cstring}(x + 0)
    f === :worksheet && return Ptr{Ptr{lxw_worksheet}}(x + 8)
    f === :tree_pointers && return Ptr{Cvoid}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_worksheet_name, f::Symbol)
    r = Ref{lxw_worksheet_name}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_worksheet_name}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_worksheet_name}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_15
    rbe_left::Ptr{Cvoid} # rbe_left::Ptr{lxw_chartsheet_name}
    rbe_right::Ptr{Cvoid} # rbe_right::Ptr{lxw_chartsheet_name}
    rbe_parent::Ptr{Cvoid} # rbe_parent::Ptr{lxw_chartsheet_name}
    rbe_color::Cint
end

function Base.getproperty(x::__JL_Ctag_15, f::Symbol)
    f === :rbe_left && return Ptr{lxw_chartsheet_name}(getfield(x, f))
    f === :rbe_right && return Ptr{lxw_chartsheet_name}(getfield(x, f))
    f === :rbe_parent && return Ptr{lxw_chartsheet_name}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_chartsheet_name
    data::NTuple{48,UInt8}
end

function Base.getproperty(x::Ptr{lxw_chartsheet_name}, f::Symbol)
    f === :name && return Ptr{Cstring}(x + 0)
    f === :chartsheet && return Ptr{Ptr{lxw_chartsheet}}(x + 8)
    f === :tree_pointers && return Ptr{Cvoid}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_chartsheet_name, f::Symbol)
    r = Ref{lxw_chartsheet_name}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_chartsheet_name}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_chartsheet_name}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_36
    rbe_left::Ptr{Cvoid} # rbe_left::Ptr{lxw_image_md5}
    rbe_right::Ptr{Cvoid} # rbe_right::Ptr{lxw_image_md5}
    rbe_parent::Ptr{Cvoid} # rbe_parent::Ptr{lxw_image_md5}
    rbe_color::Cint
end

function Base.getproperty(x::__JL_Ctag_36, f::Symbol)
    f === :rbe_left && return Ptr{lxw_image_md5}(getfield(x, f))
    f === :rbe_right && return Ptr{lxw_image_md5}(getfield(x, f))
    f === :rbe_parent && return Ptr{lxw_image_md5}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_image_md5
    data::NTuple{48,UInt8}
end

function Base.getproperty(x::Ptr{lxw_image_md5}, f::Symbol)
    f === :id && return Ptr{UInt32}(x + 0)
    f === :md5 && return Ptr{Cstring}(x + 8)
    f === :tree_pointers && return Ptr{Cvoid}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_image_md5, f::Symbol)
    r = Ref{lxw_image_md5}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_image_md5}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_image_md5}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_28
    tqe_next::Ptr{Cvoid} # tqe_next::Ptr{lxw_defined_name}
    tqe_prev::Ptr{Ptr{Cvoid}} # tqe_prev::Ptr{Ptr{lxw_defined_name}}
end

function Base.getproperty(x::__JL_Ctag_28, f::Symbol)
    f === :tqe_next && return Ptr{lxw_defined_name}(getfield(x, f))
    f === :tqe_prev && return Ptr{Ptr{lxw_defined_name}}(getfield(x, f))
    return getfield(x, f)
end

struct lxw_defined_name
    data::NTuple{664,UInt8}
end

function Base.getproperty(x::Ptr{lxw_defined_name}, f::Symbol)
    f === :index && return Ptr{Int16}(x + 0)
    f === :hidden && return Ptr{UInt8}(x + 2)
    f === :name && return Ptr{NTuple{128,Cchar}}(x + 3)
    f === :app_name && return Ptr{NTuple{128,Cchar}}(x + 131)
    f === :formula && return Ptr{NTuple{128,Cchar}}(x + 259)
    f === :normalised_name && return Ptr{NTuple{128,Cchar}}(x + 387)
    f === :normalised_sheetname && return Ptr{NTuple{128,Cchar}}(x + 515)
    f === :list_pointers && return Ptr{Cvoid}(x + 648)
    return getfield(x, f)
end

function Base.getproperty(x::lxw_defined_name, f::Symbol)
    r = Ref{lxw_defined_name}(x)
    ptr = Base.unsafe_convert(Ptr{lxw_defined_name}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{lxw_defined_name}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct lxw_doc_properties
    title::Cstring
    subject::Cstring
    author::Cstring
    manager::Cstring
    company::Cstring
    category::Cstring
    keywords::Cstring
    comments::Cstring
    status::Cstring
    hyperlink_base::Cstring
    created::time_t
end

struct lxw_workbook_options
    constant_memory::UInt8
    tmpdir::Cstring
    use_zip64::UInt8
    output_buffer::Ptr{Cstring}
    output_buffer_size::Ptr{Csize_t}
end

struct lxw_workbook
    file::Ptr{Libc.FILE}
    sheets::Ptr{lxw_sheets}
    worksheets::Ptr{lxw_worksheets}
    chartsheets::Ptr{lxw_chartsheets}
    worksheet_names::Ptr{lxw_worksheet_names}
    chartsheet_names::Ptr{lxw_chartsheet_names}
    image_md5s::Ptr{lxw_image_md5s}
    embedded_image_md5s::Ptr{lxw_image_md5s}
    header_image_md5s::Ptr{lxw_image_md5s}
    background_md5s::Ptr{lxw_image_md5s}
    charts::Ptr{lxw_charts}
    ordered_charts::Ptr{lxw_charts}
    formats::Ptr{lxw_formats}
    defined_names::Ptr{lxw_defined_names}
    sst::Ptr{lxw_sst}
    properties::Ptr{lxw_doc_properties}
    custom_properties::Ptr{lxw_custom_properties}
    filename::Cstring
    options::lxw_workbook_options
    num_sheets::UInt16
    num_worksheets::UInt16
    num_chartsheets::UInt16
    first_sheet::UInt16
    active_sheet::UInt16
    num_xf_formats::UInt16
    num_dxf_formats::UInt16
    num_format_count::UInt16
    drawing_count::UInt16
    comment_count::UInt16
    num_embedded_images::UInt32
    font_count::UInt16
    border_count::UInt16
    fill_count::UInt16
    optimize::UInt8
    max_url_length::UInt16
    read_only::UInt8
    has_png::UInt8
    has_jpeg::UInt8
    has_bmp::UInt8
    has_gif::UInt8
    has_vml::UInt8
    has_comments::UInt8
    has_metadata::UInt8
    has_embedded_images::UInt8
    has_dynamic_functions::UInt8
    has_embedded_image_descriptions::UInt8
    used_xf_formats::Ptr{lxw_hash_table}
    used_dxf_formats::Ptr{lxw_hash_table}
    vba_project::Cstring
    vba_project_signature::Cstring
    vba_codename::Cstring
    default_url_format::Ptr{lxw_format}
end

function workbook_new(filename)
    @ccall libxlsxwriter.workbook_new(filename::Cstring)::Ptr{lxw_workbook}
end

function workbook_new_opt(filename, options)
    @ccall libxlsxwriter.workbook_new_opt(
        filename::Cstring,
        options::Ptr{lxw_workbook_options},
    )::Ptr{lxw_workbook}
end

function workbook_add_worksheet(workbook, sheetname)
    @ccall libxlsxwriter.workbook_add_worksheet(
        workbook::Ptr{lxw_workbook},
        sheetname::Cstring,
    )::Ptr{lxw_worksheet}
end

function workbook_add_chartsheet(workbook, sheetname)
    @ccall libxlsxwriter.workbook_add_chartsheet(
        workbook::Ptr{lxw_workbook},
        sheetname::Cstring,
    )::Ptr{lxw_chartsheet}
end

function workbook_add_format(workbook)
    @ccall libxlsxwriter.workbook_add_format(workbook::Ptr{lxw_workbook})::Ptr{lxw_format}
end

function workbook_add_chart(workbook, chart_type)
    @ccall libxlsxwriter.workbook_add_chart(
        workbook::Ptr{lxw_workbook},
        chart_type::UInt8,
    )::Ptr{lxw_chart}
end

function workbook_close(workbook)
    @ccall libxlsxwriter.workbook_close(workbook::Ptr{lxw_workbook})::lxw_error
end

function workbook_set_properties(workbook, properties)
    @ccall libxlsxwriter.workbook_set_properties(
        workbook::Ptr{lxw_workbook},
        properties::Ptr{lxw_doc_properties},
    )::lxw_error
end

function workbook_set_custom_property_string(workbook, name, value)
    @ccall libxlsxwriter.workbook_set_custom_property_string(
        workbook::Ptr{lxw_workbook},
        name::Cstring,
        value::Cstring,
    )::lxw_error
end

function workbook_set_custom_property_number(workbook, name, value)
    @ccall libxlsxwriter.workbook_set_custom_property_number(
        workbook::Ptr{lxw_workbook},
        name::Cstring,
        value::Cdouble,
    )::lxw_error
end

function workbook_set_custom_property_integer(workbook, name, value)
    @ccall libxlsxwriter.workbook_set_custom_property_integer(
        workbook::Ptr{lxw_workbook},
        name::Cstring,
        value::Int32,
    )::lxw_error
end

function workbook_set_custom_property_boolean(workbook, name, value)
    @ccall libxlsxwriter.workbook_set_custom_property_boolean(
        workbook::Ptr{lxw_workbook},
        name::Cstring,
        value::UInt8,
    )::lxw_error
end

function workbook_set_custom_property_datetime(workbook, name, datetime)
    @ccall libxlsxwriter.workbook_set_custom_property_datetime(
        workbook::Ptr{lxw_workbook},
        name::Cstring,
        datetime::Ptr{lxw_datetime},
    )::lxw_error
end

function workbook_define_name(workbook, name, formula)
    @ccall libxlsxwriter.workbook_define_name(
        workbook::Ptr{lxw_workbook},
        name::Cstring,
        formula::Cstring,
    )::lxw_error
end

function workbook_get_default_url_format(workbook)
    @ccall libxlsxwriter.workbook_get_default_url_format(
        workbook::Ptr{lxw_workbook},
    )::Ptr{lxw_format}
end

function workbook_get_worksheet_by_name(workbook, name)
    @ccall libxlsxwriter.workbook_get_worksheet_by_name(
        workbook::Ptr{lxw_workbook},
        name::Cstring,
    )::Ptr{lxw_worksheet}
end

function workbook_get_chartsheet_by_name(workbook, name)
    @ccall libxlsxwriter.workbook_get_chartsheet_by_name(
        workbook::Ptr{lxw_workbook},
        name::Cstring,
    )::Ptr{lxw_chartsheet}
end

function workbook_validate_sheet_name(workbook, sheetname)
    @ccall libxlsxwriter.workbook_validate_sheet_name(
        workbook::Ptr{lxw_workbook},
        sheetname::Cstring,
    )::lxw_error
end

function workbook_add_vba_project(workbook, filename)
    @ccall libxlsxwriter.workbook_add_vba_project(
        workbook::Ptr{lxw_workbook},
        filename::Cstring,
    )::lxw_error
end

function workbook_add_signed_vba_project(workbook, vba_project, signature)
    @ccall libxlsxwriter.workbook_add_signed_vba_project(
        workbook::Ptr{lxw_workbook},
        vba_project::Cstring,
        signature::Cstring,
    )::lxw_error
end

function workbook_set_vba_name(workbook, name)
    @ccall libxlsxwriter.workbook_set_vba_name(
        workbook::Ptr{lxw_workbook},
        name::Cstring,
    )::lxw_error
end

function workbook_read_only_recommended(workbook)
    @ccall libxlsxwriter.workbook_read_only_recommended(workbook::Ptr{lxw_workbook})::Cvoid
end

function lxw_workbook_free(workbook)
    @ccall libxlsxwriter.lxw_workbook_free(workbook::Ptr{lxw_workbook})::Cvoid
end

function lxw_workbook_assemble_xml_file(workbook)
    @ccall libxlsxwriter.lxw_workbook_assemble_xml_file(workbook::Ptr{lxw_workbook})::Cvoid
end

function lxw_workbook_set_default_xf_indices(workbook)
    @ccall libxlsxwriter.lxw_workbook_set_default_xf_indices(
        workbook::Ptr{lxw_workbook},
    )::Cvoid
end

function workbook_unset_default_url_format(workbook)
    @ccall libxlsxwriter.workbook_unset_default_url_format(
        workbook::Ptr{lxw_workbook},
    )::Cvoid
end

const SPLAY_NEGINF = -1

const SPLAY_INF = 1

const RB_BLACK = 0

const RB_RED = 1

const RB_NEGINF = -1

const RB_INF = 1

# Skipping MacroDefinition: STATIC static

const LXW_MD5_SIZE = 16

const LXW_SHEETNAME_MAX = 31

const LXW_MAX_SHEETNAME_LENGTH = LXW_SHEETNAME_MAX * 4 + 2 + 1

# Skipping MacroDefinition: LXW_MAX_COL_NAME_LENGTH sizeof ( "$XFD" )
const LXW_MAX_COL_NAME_LENGTH = 4 + 1

# Skipping MacroDefinition: LXW_MAX_ROW_NAME_LENGTH sizeof ( "$1048576" )
const LXW_MAX_ROW_NAME_LENGTH = 8 + 1

# Skipping MacroDefinition: LXW_MAX_CELL_NAME_LENGTH sizeof ( "$XFWD$1048576" )
const LXW_MAX_CELL_NAME_LENGTH = 13 + 1

const LXW_MAX_CELL_RANGE_LENGTH = LXW_MAX_CELL_NAME_LENGTH * 2

const LXW_MAX_FORMULA_RANGE_LENGTH = LXW_MAX_SHEETNAME_LENGTH + LXW_MAX_CELL_RANGE_LENGTH

# Skipping MacroDefinition: LXW_DATETIME_LENGTH sizeof ( "2016-12-12T23:00:00Z" )
const LXW_DATETIME_LENGTH = 20 + 1

# Skipping MacroDefinition: LXW_GUID_LENGTH sizeof ( "{12345678-1234-1234-1234-1234567890AB}\0" )
const LXW_GUID_LENGTH = 40 + 1

const LXW_EPOCH_1900 = 0

const LXW_EPOCH_1904 = 1

# Skipping MacroDefinition: LXW_UINT32_T_LENGTH sizeof ( "4294967296" )
const LXW_UINT32_T_LENGTH = 10 + 1

const LXW_FILENAME_LENGTH = 128

const LXW_IGNORE = 1

const LXW_PORTRAIT = 1

const LXW_LANDSCAPE = 0

const LXW_SCHEMA_MS = "http://schemas.microsoft.com/office/2006/relationships"

const LXW_SCHEMA_ROOT = "http://schemas.openxmlformats.org"

#const LXW_SCHEMA_DRAWING = LXW_SCHEMA_ROOT("/drawingml/2006")
const LXW_SCHEMA_DRAWING = LXW_SCHEMA_ROOT * "/drawingml/2006"

#const LXW_SCHEMA_OFFICEDOC = LXW_SCHEMA_ROOT("/officeDocument/2006")
const LXW_SCHEMA_OFFICEDOC = LXW_SCHEMA_ROOT * "/officeDocument/2006"

#const LXW_SCHEMA_PACKAGE = LXW_SCHEMA_ROOT("/package/2006/relationships")
const LXW_SCHEMA_PACKAGE = LXW_SCHEMA_ROOT * "/package/2006/relationships"

#const LXW_SCHEMA_DOCUMENT = LXW_SCHEMA_ROOT("/officeDocument/2006/relationships")
const LXW_SCHEMA_DOCUMENT = LXW_SCHEMA_ROOT * "/officeDocument/2006/relationships"

#const LXW_SCHEMA_CONTENT = LXW_SCHEMA_ROOT("/package/2006/content-types")
const LXW_SCHEMA_CONTENT = LXW_SCHEMA_ROOT * "/package/2006/content-types"

##const LXW_PRINTF = fprintf
const LXW_PRINTF = print

# Skipping MacroDefinition: LXW_STDERR stderr ,

##const lxw_snprintf = __builtin_snprintf
const lxw_snprintf = print

const LXW_FORMAT_FIELD_LEN = 128

const LXW_DEFAULT_FONT_NAME = "Calibri"

const LXW_DEFAULT_FONT_FAMILY = 2

const LXW_DEFAULT_FONT_THEME = 1

const LXW_PROPERTY_UNSET = -1

const LXW_COLOR_UNSET = 0x00000000

const LXW_COLOR_MASK = 0x00ffffff

const LXW_MIN_FONT_SIZE = 1.0

const LXW_MAX_FONT_SIZE = 409.0

const LXW_CHART_NUM_FORMAT_LEN = 128

const LXW_CHART_DEFAULT_GAP = 501

const LXW_MAX_ATTRIBUTE_LENGTH = 2080

const LXW_ATTR_32 = 32

const lxw_strcasecmp = strcasecmp

const LXW_ROW_MAX = 1048576

const LXW_COL_MAX = 16384

const LXW_COL_META_MAX = 128

const LXW_HEADER_FOOTER_MAX = 255

const LXW_MAX_NUMBER_URLS = 65530

const LXW_PANE_NAME_LENGTH = 12

const LXW_IMAGE_BUFFER_SIZE = 1024

const LXW_HEADER_FOOTER_OBJS_MAX = 6

const LXW_BREAKS_MAX = 1023

const LXW_DEF_COL_WIDTH = Float64(8.43)

const LXW_DEF_ROW_HEIGHT = Float64(15.0)

const LXW_DEF_COL_WIDTH_PIXELS = 64

const LXW_DEF_ROW_HEIGHT_PIXELS = 20

const LXW_DEFINED_NAME_LENGTH = 128

const LXW_VERSION = "1.1.9"

const LXW_VERSION_ID = 119

const LXW_SOVERSION = "7"
