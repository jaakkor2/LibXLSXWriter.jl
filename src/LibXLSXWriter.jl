module LibXLSXWriter

using libxlsxwriter_jll
using CEnum
using Printf

include("generated/libxlsxwriter_api.jl")

lxw_chart_fill(; color=0x0, none=0x0, transparency=0x0) = lxw_chart_fill(color, none, transparency)
lxw_chart_line(; color=0x0, none=0x0, width=0.0, dash_type=0x0, transparency=0x0) = lxw_chart_line(color, none, width, dash_type, transparency)
lxw_chart_pattern(; fg_color=0x0, bg_color=0x0, type=0x0) = lxw_chart_pattern(fg_color, bg_color, type)
lxw_chart_point(; line=lxw_chart_line(), fill=lxw_chart_fill(), pattern=lxw_chart_pattern()) = lxw_chart_point(Ptr{line}(), Ptr{fill}(), Ptr{pattern}())

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
