# helpers to create Cstring from String
Cs(str) = str == C_NULL ? C_NULL : Base.unsafe_convert(Cstring, str)
macro Cs_str(str)
    Base.unsafe_convert(Cstring, str)
end
function Cs(list::Vector{String})
    ptrs = Base.unsafe_convert.(Cstring, list)
    push!(ptrs, C_NULL)
    Base.unsafe_convert(Ptr{Cstring}, ptrs)
end

# utility.h
CELL(cell) = lxw_name_to_row(cell), lxw_name_to_col(cell)
COLS(cols) = lxw_name_to_col(cols), lxw_name_to_col_2(cols)
RANGE(range) = lxw_name_to_row(range),
lxw_name_to_col(range),
lxw_name_to_row_2(range),
lxw_name_to_col_2(range)

# helpers for CELL
worksheet_data_validation_cell(worksheet, cell::Tuple{UInt32,UInt16}, validation) =
    worksheet_data_validation_cell(worksheet, cell..., validation)
worksheet_embed_image(worksheet, cell::Tuple{UInt32,UInt16}, filename) =
    worksheet_embed_image(worksheet, cell..., filename)
worksheet_embed_image_buffer(
    worksheet,
    cell::Tuple{UInt32,UInt16},
    image_buffer,
    image_size,
) = worksheet_embed_image_buffer(worksheet, cell..., image_buffer, image_size)
worksheet_insert_chart(worksheet, cell::Tuple{UInt32,UInt16}, chart) =
    worksheet_insert_chart(worksheet, cell..., chart)
worksheet_insert_chart_opt(worksheet, cell::Tuple{UInt32,UInt16}, chart, options) =
    worksheet_insert_chart_opt(worksheet, cell..., chart, options)
worksheet_insert_image(worksheet, cell::Tuple{UInt32,UInt16}, filename) =
    worksheet_insert_image(worksheet, cell..., filename)
worksheet_insert_image_buffer(
    worksheet,
    cell::Tuple{UInt32,UInt16},
    image_buffer,
    image_size,
) = worksheet_insert_image_buffer(worksheet, cell..., image_buffer, image_size)
worksheet_insert_image_buffer_opt(
    worksheet,
    cell::Tuple{UInt32,UInt16},
    image_buffer,
    image_size,
    options,
) = worksheet_insert_image_buffer_opt(worksheet, cell..., image_buffer, image_size, options)
worksheet_write_comment(worksheet, cell::Tuple{UInt32,UInt16}, string) =
    worksheet_write_comment(worksheet, cell..., string)
worksheet_write_comment_opt(worksheet, cell::Tuple{UInt32,UInt16}, string, options) =
    worksheet_write_comment_opt(worksheet, cell..., string, options)
worksheet_write_datetime(worksheet, cell::Tuple{UInt32,UInt16}, datetime, format = C_NULL) =
    worksheet_write_datetime(worksheet, cell..., datetime, format)
worksheet_write_dynamic_formula(worksheet, cell::Tuple{UInt32,UInt16}, formula, format = C_NULL) =
    worksheet_write_dynamic_formula(worksheet, cell..., formula, format)
worksheet_write_formula(worksheet, cell::Tuple{UInt32,UInt16}, formula, format = C_NULL) =
    worksheet_write_formula(worksheet, cell..., formula, format)
worksheet_write_number(worksheet, cell::Tuple{UInt32,UInt16}, number, format = C_NULL) =
    worksheet_write_number(worksheet, cell..., number, format)
worksheet_write_rich_string(worksheet, cell::Tuple{UInt32,UInt16}, rich_string, format = C_NULL) =
    worksheet_write_rich_string(worksheet, cell..., rich_string, format)
worksheet_write_string(worksheet, cell::Tuple{UInt32,UInt16}, string, format = C_NULL) =
    worksheet_write_string(worksheet, cell..., string, format)
worksheet_write_url(worksheet, cell::Tuple{UInt32,UInt16}, url, format = C_NULL) =
    worksheet_write_url(worksheet, cell..., url, format)

# helper for RANGE
worksheet_add_table(worksheet, range::Tuple{UInt32,UInt16,UInt32,UInt16}, options = C_NULL) =
    worksheet_add_table(worksheet, range..., options)
worksheet_write_array_formula(
    worksheet,
    range::Tuple{UInt32,UInt16,UInt32,UInt16},
    formula,
    format = C_NULL,
) = worksheet_write_array_formula(worksheet, range..., formula, format)
worksheet_conditional_format_range(
    worksheet,
    range::Tuple{UInt32,UInt16,UInt32,UInt16},
    conditional_format,
) = worksheet_conditional_format_range(worksheet, range..., conditional_format)

# helper for COLS
worksheet_set_column(worksheet, column::Tuple{UInt16,UInt16}, width, format = C_NULL) =
    worksheet_set_column(worksheet, column..., width, format)
