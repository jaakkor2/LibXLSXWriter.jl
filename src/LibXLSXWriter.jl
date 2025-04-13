module LibXLSXWriter

using libxlsxwriter_jll
using CEnum
using Printf

# function definitions for the generated libxlsxwriter_api.jl
function strcasecmp(a::S,b::S) where {S<:AbstractString}
   lowercase(a) == lowercase(b)
end
string_copy_free = Base.unsafe_string
include("generated/libxlsxwriter_api.jl")

lxw_chart_fill(; color=0x0, none=0x0, transparency=0x0) = Ref(lxw_chart_fill(color, none, transparency))
lxw_chart_line(; color=0x0, none=0x0, width=0.0, dash_type=0x0, transparency=0x0) = Ref(lxw_chart_line(color, none, width, dash_type, transparency))
lxw_chart_pattern(; fg_color=0x0, bg_color=0x0, type=LXW_PATTERN_NONE) = Ref(lxw_chart_pattern(fg_color, bg_color, type))

lxw_chart_font(; name="Arial", size=11.0, bold=0x0, italic=0x0, underline=0x0, rotation=Int32(0), color=LXW_COLOR_BLACK, pitch_family=0x0, charset=0x0, baseline=Int8(0)) =
   Ref(lxw_chart_font(Cs(name), size, bold, italic, underline, rotation, color, pitch_family, charset, baseline))

function lxw_chart_point(; line=C_NULL, fill=C_NULL, pattern=C_NULL)
   Ref(lxw_chart_point(
      Base.unsafe_convert(Ptr{lxw_chart_line}, line),
      Base.unsafe_convert(Ptr{lxw_chart_fill}, fill),
      Base.unsafe_convert(Ptr{lxw_chart_pattern}, pattern)
   ))
end

Cs(mystring) = isempty(mystring) ? C_NULL : Base.unsafe_convert(Cstring, mystring)
lxw_doc_properties(; title="", subject="", author="", manager="", company="", category="", keywords="", comments="", status="", hyperlink_base="", created=0) =
   Ref(lxw_doc_properties(Cs(title), Cs(subject), Cs(author), Cs(manager), Cs(company), Cs(category), Cs(keywords), Cs(comments), Cs(status), Cs(hyperlink_base), created))

lxw_row_col_options(; hidden=0x0, level=0x0, collapsed=0x0) = Ref(lxw_row_col_options(hidden, level, collapsed))
lxw_filter_rule(; criteria=0x0, value_string="", value=0.0) = Ref(lxw_filter_rule(criteria, Cs(value_string), value))

lxw_header_footer_options(; margin=0.0, image_left="", image_center="", image_right="") =
   Ref(lxw_header_footer_options(margin, Cs(image_left), Cs(image_center), Cs(image_right)))

# utility.h
CELL(cell) = lxw_name_to_row(cell), lxw_name_to_col(cell)
COLS(cols) = lxw_name_to_col(cols), lxw_name_to_col_2(cols)
RANGE(range) = lxw_name_to_row(range), lxw_name_to_col(range), lxw_name_to_row_2(range), lxw_name_to_col_2(range)

# helpers for CELL
worksheet_write_string(worksheet, cell::Tuple{UInt32, UInt16}, string, format) = worksheet_write_string(worksheet, cell..., string, format)
worksheet_write_number(worksheet, cell::Tuple{UInt32, UInt16}, number, format) = worksheet_write_number(worksheet, cell..., number, format)
worksheet_insert_chart(worksheet, cell::Tuple{UInt32, UInt16}, chart) = worksheet_insert_chart(worksheet, cell..., chart)
# helper for RANGE
worksheet_write_array_formula(worksheet, range::Tuple{UInt32, UInt16, UInt32, UInt16}, formula, format) = worksheet_write_array_formula(worksheet, range..., formula, format)

# for n in names(@__MODULE__; all=true)
#     if Base.isidentifier(n) && n ∉ (Symbol(@__MODULE__), :eval, :include)
#         @eval export $n
#     end
# end

end
