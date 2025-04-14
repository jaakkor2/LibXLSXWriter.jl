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

Cs(mystring) = isempty(mystring) ? C_NULL : Base.unsafe_convert(Cstring, mystring)

lxw_button_options(; caption="", _macro="", description="", width=LXW_DEF_COL_WIDTH_PIXELS, height=LXW_DEF_ROW_HEIGHT_PIXELS, x_scale=1.0, y_scale=1.0, x_offset=0, y_offset=0) =
   Ref(lxw_button_options(Cs(caption), Cs(_macro), Cs(description), width, height, x_scale, y_scale, x_offset, y_offset))

function lxw_chart_data_label(; value="", hide=0x0, font=C_NULL, line=C_NULL, fill=C_NULL, pattern=C_NULL)
   Ref(lxw_chart_data_label(
      Cs(value),
      hide,
      Base.unsafe_convert(Ptr{lxw_chart_font}, font),
      Base.unsafe_convert(Ptr{lxw_chart_line}, line),
      Base.unsafe_convert(Ptr{lxw_chart_fill}, fill),
      Base.unsafe_convert(Ptr{lxw_chart_pattern}, pattern)
   ))
end

lxw_chart_fill(; color=0x0, none=0x0, transparency=0x0) = Ref(lxw_chart_fill(color, none, transparency))

lxw_chart_font(; name="Arial", size=11.0, bold=0x0, italic=0x0, underline=0x0, rotation=Int32(0), color=LXW_COLOR_BLACK, pitch_family=0x0, charset=0x0, baseline=Int8(0)) =
   Ref(lxw_chart_font(Cs(name), size, bold, italic, underline, rotation, color, pitch_family, charset, baseline))

lxw_chart_line(; color=0x0, none=0x0, width=0.0, dash_type=0x0, transparency=0x0) = Ref(lxw_chart_line(color, none, width, dash_type, transparency))

lxw_chart_options(; x_offset=0, y_offset=0, x_scale=1.0, y_scale=1.0, object_position=0x0, description="", decorative=0x0) =
   Ref(lxw_chart_options(x_offset, y_offset, x_scale, y_scale, object_position, Cs(description), decorative))

lxw_chart_pattern(; fg_color=0x0, bg_color=0x0, type=LXW_PATTERN_NONE) = Ref(lxw_chart_pattern(fg_color, bg_color, type))

function lxw_chart_point(; line=C_NULL, fill=C_NULL, pattern=C_NULL)
   Ref(lxw_chart_point(
      Base.unsafe_convert(Ptr{lxw_chart_line}, line),
      Base.unsafe_convert(Ptr{lxw_chart_fill}, fill),
      Base.unsafe_convert(Ptr{lxw_chart_pattern}, pattern)
   ))
end

lxw_comment_options(; visible=0x1, author="", width=74, height=128, x_scale=1.0, y_scale=1.0, color=LXW_COLOR_UNSET, font_name="", font_size=8, font_family=0x2, start_row=0x0, start_col=0x0, x_offset=15, y_offset=10) =
   Ref(lxw_comment_options(visible, Cs(author), width, height, x_scale, y_scale, color, Cs(font_name), font_size, font_family, start_row, start_col, x_offset, y_offset))

lxw_doc_properties(; title="", subject="", author="", manager="", company="", category="", keywords="", comments="", status="", hyperlink_base="", created=0) =
   Ref(lxw_doc_properties(Cs(title), Cs(subject), Cs(author), Cs(manager), Cs(company), Cs(category), Cs(keywords), Cs(comments), Cs(status), Cs(hyperlink_base), created))

lxw_filter_rule(; criteria=0x0, value_string="", value=0.0) = Ref(lxw_filter_rule(criteria, Cs(value_string), value))

lxw_header_footer_options(; margin=0.0, image_left="", image_center="", image_right="") =
   Ref(lxw_header_footer_options(margin, Cs(image_left), Cs(image_center), Cs(image_right)))

lxw_row_col_options(; hidden=0x0, level=0x0, collapsed=0x0) = Ref(lxw_row_col_options(hidden, level, collapsed))

# utility.h
CELL(cell) = lxw_name_to_row(cell), lxw_name_to_col(cell)
COLS(cols) = lxw_name_to_col(cols), lxw_name_to_col_2(cols)
RANGE(range) = lxw_name_to_row(range), lxw_name_to_col(range), lxw_name_to_row_2(range), lxw_name_to_col_2(range)

# helpers for CELL
worksheet_insert_chart(worksheet, cell::Tuple{UInt32, UInt16}, chart) = worksheet_insert_chart(worksheet, cell..., chart)
worksheet_insert_chart_opt(worksheet, cell::Tuple{UInt32, UInt16}, chart, options) = worksheet_insert_chart_opt(worksheet, cell..., chart, options)
worksheet_write_comment(worksheet, cell::Tuple{UInt32, UInt16}, string) = worksheet_write_comment(worksheet, cell..., string)
worksheet_write_comment_opt(worksheet, cell::Tuple{UInt32, UInt16}, string, options) = worksheet_write_comment_opt(worksheet, cell..., string, options)
worksheet_write_number(worksheet, cell::Tuple{UInt32, UInt16}, number, format) = worksheet_write_number(worksheet, cell..., number, format)
worksheet_write_string(worksheet, cell::Tuple{UInt32, UInt16}, string, format) = worksheet_write_string(worksheet, cell..., string, format)

# helper for RANGE
worksheet_write_array_formula(worksheet, range::Tuple{UInt32, UInt16, UInt32, UInt16}, formula, format) = worksheet_write_array_formula(worksheet, range..., formula, format)

# helper for COLS
worksheet_set_column(worksheet, column::Tuple{UInt16, UInt16}, width, format) = worksheet_set_column(worksheet, column..., width, format)

#= 1153 identifiers
for n in names(@__MODULE__; all=true)
   if Base.isidentifier(n) && n ∉ (Symbol(@__MODULE__), :eval, :include)
      @eval export $n
   end
end
=#

end
