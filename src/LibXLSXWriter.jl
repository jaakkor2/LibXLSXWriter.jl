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

# helpers to create Cstring from String
Cs(mystring) = isempty(mystring) ? C_NULL : Base.unsafe_convert(Cstring, mystring)
Cs_(mystring) = Base.unsafe_convert(Cstring, mystring)
macro Cs_str(str); Base.unsafe_convert(Cstring, str); end
function Cs(list::Vector{String})
   ptrs = Base.unsafe_convert.(Cstring, list)
   push!(ptrs, C_NULL)
   Base.unsafe_convert(Ptr{Cstring}, ptrs)
end


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

lxw_chart_font(; name="Arial", size=11.0, bold=0x0, italic=0x0, underline=0x0, rotation=0, color=LXW_COLOR_BLACK, pitch_family=0x0, charset=0x0, baseline=0) =
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

lxw_comment_options(; visible=0x0, author="", width=0, height=0, x_scale=1.0, y_scale=1.0, color=LXW_COLOR_UNSET, font_name="", font_size=8, font_family=0x2, start_row=0x0, start_col=0x0, x_offset=15, y_offset=10) =
   Ref(lxw_comment_options(visible, Cs(author), width, height, x_scale, y_scale, color, Cs(font_name), font_size, font_family, start_row, start_col, x_offset, y_offset))

lxw_data_validation(; validate=0x0, criteria=0x0, ignore_blank=0x0, show_input=0x0, show_error=0x0, error_type=0x0, dropdown=0x0, value_number=0.0, value_formula="",
   value_list=String[], value_datetime=lxw_datetime(), minimum_number=0.0, minimum_formula="", minimum_datetime=lxw_datetime(), maximum_number=0.0,
   maximum_formula="", maximum_datetime=lxw_datetime(), input_title="", input_message="", error_title="", error_message="") =
   Ref(lxw_data_validation(validate, criteria, ignore_blank, show_input, show_error, error_type, dropdown, value_number, Cs_(value_formula),
   Cs(value_list),
   value_datetime.x, minimum_number, Cs_(minimum_formula), minimum_datetime.x, maximum_number,
   Cs_(maximum_formula), maximum_datetime.x, Cs_(input_title), Cs_(input_message), Cs_(error_title), Cs_(error_message)))

lxw_datetime(; year=0, month=0, day=0, hour=0, min=0, sec=0) = Ref(lxw_datetime(year, month, day, hour, min, sec))

lxw_doc_properties(; title="", subject="", author="", manager="", company="", category="", keywords="", comments="", status="", hyperlink_base="", created=0) =
   Ref(lxw_doc_properties(Cs(title), Cs(subject), Cs(author), Cs(manager), Cs(company), Cs(category), Cs(keywords), Cs(comments), Cs(status), Cs(hyperlink_base), created))

lxw_filter_rule(; criteria=0x0, value_string="", value=0.0) = Ref(lxw_filter_rule(criteria, Cs(value_string), value))

lxw_header_footer_options(; margin=0.0, image_left="", image_center="", image_right="") =
   Ref(lxw_header_footer_options(margin, Cs(image_left), Cs(image_center), Cs(image_right)))

function lxw_image_options(; x_offset=0, y_offset=0, x_scale=1.0, y_scale=1.0, object_position=0x0, description="", decorative=0x0, url="", tip="", cell_format=C_NULL)
   Ref(lxw_image_options(Int32(x_offset), Int32(y_offset), Float64(x_scale), Float64(y_scale), object_position, Cs_(description), decorative, Cs_(url), Cs_(tip),
   Base.unsafe_convert(Ptr{lxw_format}, cell_format)
   ))
end

lxw_rich_string_tuple(; format=C_NULL, string="") =
   Ref(lxw_rich_string_tuple(Base.unsafe_convert(Ptr{lxw_format}, format), Cs(string)))

lxw_row_col_options(; hidden=0x0, level=0x0, collapsed=0x0) = Ref(lxw_row_col_options(hidden, level, collapsed))

# utility.h
CELL(cell) = lxw_name_to_row(cell), lxw_name_to_col(cell)
COLS(cols) = lxw_name_to_col(cols), lxw_name_to_col_2(cols)
RANGE(range) = lxw_name_to_row(range), lxw_name_to_col(range), lxw_name_to_row_2(range), lxw_name_to_col_2(range)

# helpers for CELL
worksheet_data_validation_cell(worksheet, cell::Tuple{UInt32, UInt16}, validation) = worksheet_data_validation_cell(worksheet, cell..., validation)
worksheet_embed_image(worksheet, cell::Tuple{UInt32, UInt16}, filename) = worksheet_embed_image(worksheet, cell..., filename)
worksheet_embed_image_buffer(worksheet, cell::Tuple{UInt32, UInt16}, image_buffer, image_size) = worksheet_embed_image_buffer(worksheet, cell..., image_buffer, image_size)
worksheet_insert_chart(worksheet, cell::Tuple{UInt32, UInt16}, chart) = worksheet_insert_chart(worksheet, cell..., chart)
worksheet_insert_chart_opt(worksheet, cell::Tuple{UInt32, UInt16}, chart, options) = worksheet_insert_chart_opt(worksheet, cell..., chart, options)
worksheet_insert_image(worksheet, cell::Tuple{UInt32, UInt16}, filename) = worksheet_insert_image(worksheet, cell..., filename)
worksheet_insert_image_buffer(worksheet, cell::Tuple{UInt32, UInt16}, image_buffer, image_size) = worksheet_insert_image_buffer(worksheet, cell..., image_buffer, image_size)
worksheet_insert_image_buffer_opt(worksheet, cell::Tuple{UInt32, UInt16}, image_buffer, image_size, options) = worksheet_insert_image_buffer_opt(worksheet, cell..., image_buffer, image_size, options)
worksheet_write_comment(worksheet, cell::Tuple{UInt32, UInt16}, string) = worksheet_write_comment(worksheet, cell..., string)
worksheet_write_comment_opt(worksheet, cell::Tuple{UInt32, UInt16}, string, options) = worksheet_write_comment_opt(worksheet, cell..., string, options)
worksheet_write_datetime(worksheet, cell::Tuple{UInt32, UInt16}, datetime, format) = worksheet_write_datetime(worksheet, cell..., datetime, format)
worksheet_write_dynamic_formula(worksheet, cell::Tuple{UInt32, UInt16}, formula, format) = worksheet_write_dynamic_formula(worksheet, cell..., formula, format)
worksheet_write_formula(worksheet, cell::Tuple{UInt32, UInt16}, formula, format) = worksheet_write_formula(worksheet, cell..., formula, format)
worksheet_write_number(worksheet, cell::Tuple{UInt32, UInt16}, number, format) = worksheet_write_number(worksheet, cell..., number, format)
worksheet_write_rich_string(worksheet, cell::Tuple{UInt32, UInt16}, rich_string, format) = worksheet_write_rich_string(worksheet, cell..., rich_string, format)
worksheet_write_string(worksheet, cell::Tuple{UInt32, UInt16}, string, format) = worksheet_write_string(worksheet, cell..., string, format)
worksheet_write_url(worksheet, cell::Tuple{UInt32, UInt16}, url, format) = worksheet_write_url(worksheet, cell..., url, format)

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

function debug_list(list)
   @ccall libxlsxwriter._validation_list_to_csv(
       list::Ptr{Cstring},
   )::Cstring
end


end
