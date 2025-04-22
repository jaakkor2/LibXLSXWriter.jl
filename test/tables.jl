#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/tables.c
/*
 * An example of how to add conditional formatting to an libxlsxwriter file.
 *
 * Conditional formatting allows you to apply a format to a cell or a
 * range of cells based on certain criteria.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    worksheet_write_number,
    workbook_new,
    workbook_add_worksheet,
    workbook_add_format,
    format_set_num_format,
    worksheet_set_column,
    COLS,
    worksheet_write_string,
    CELL,
    worksheet_add_table,
    RANGE,
    lxw_table_options,
    lxw_table_column,
    LXW_TABLE_FUNCTION_SUM,
    LXW_TABLE_STYLE_TYPE_LIGHT,
    workbook_close

# Write some data to the worksheet.
function write_worksheet_data(worksheet, format)
    worksheet_write_string(worksheet, CELL("B4"), "Apples", C_NULL)
    worksheet_write_string(worksheet, CELL("B5"), "Pears", C_NULL)
    worksheet_write_string(worksheet, CELL("B6"), "Bananas", C_NULL)
    worksheet_write_string(worksheet, CELL("B7"), "Oranges", C_NULL)

    worksheet_write_number(worksheet, CELL("C4"), 10000, format)
    worksheet_write_number(worksheet, CELL("C5"), 2000, format)
    worksheet_write_number(worksheet, CELL("C6"), 6000, format)
    worksheet_write_number(worksheet, CELL("C7"), 500, format)

    worksheet_write_number(worksheet, CELL("D4"), 5000, format)
    worksheet_write_number(worksheet, CELL("D5"), 3000, format)
    worksheet_write_number(worksheet, CELL("D6"), 6000, format)
    worksheet_write_number(worksheet, CELL("D7"), 300, format)

    worksheet_write_number(worksheet, CELL("E4"), 8000, format)
    worksheet_write_number(worksheet, CELL("E5"), 4000, format)
    worksheet_write_number(worksheet, CELL("E6"), 6500, format)
    worksheet_write_number(worksheet, CELL("E7"), 200, format)

    worksheet_write_number(worksheet, CELL("F4"), 6000, format)
    worksheet_write_number(worksheet, CELL("F5"), 5000, format)
    worksheet_write_number(worksheet, CELL("F6"), 6000, format)
    worksheet_write_number(worksheet, CELL("F7"), 700, format)
end


workbook = workbook_new("tables.xlsx")
worksheet1 = workbook_add_worksheet(workbook, C_NULL)
worksheet2 = workbook_add_worksheet(workbook, C_NULL)
worksheet3 = workbook_add_worksheet(workbook, C_NULL)
worksheet4 = workbook_add_worksheet(workbook, C_NULL)
worksheet5 = workbook_add_worksheet(workbook, C_NULL)
worksheet6 = workbook_add_worksheet(workbook, C_NULL)
worksheet7 = workbook_add_worksheet(workbook, C_NULL)
worksheet8 = workbook_add_worksheet(workbook, C_NULL)
worksheet9 = workbook_add_worksheet(workbook, C_NULL)
worksheet10 = workbook_add_worksheet(workbook, C_NULL)
worksheet11 = workbook_add_worksheet(workbook, C_NULL)
worksheet12 = workbook_add_worksheet(workbook, C_NULL)
worksheet13 = workbook_add_worksheet(workbook, C_NULL)

currency_format = workbook_add_format(workbook)
format_set_num_format(currency_format, raw"$#,##0")


## Example 1. Default table with no data

# Set the columns widths for clarity.
worksheet_set_column(worksheet1, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(worksheet1, CELL("B1"), "Default table with no data.", C_NULL)

# Add a table to the worksheet.
worksheet_add_table(worksheet1, RANGE("B3:F7"), C_NULL)


## Example 2. Default table with data

# Set the columns widths for clarity.
worksheet_set_column(worksheet2, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(worksheet2, CELL("B1"), "Default table with data.", C_NULL)

# Add a table to the worksheet.
worksheet_add_table(worksheet2, RANGE("B3:F7"), C_NULL)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet2, C_NULL)


## Example 3. Table without default autofilter

# Set the columns widths for clarity.
worksheet_set_column(worksheet3, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(worksheet3, CELL("B1"), "Table without default autofilter.", C_NULL)

# Set the table options.
options3 = lxw_table_options(no_autofilter = true)

# Add a table to the worksheet.
worksheet_add_table(worksheet3, RANGE("B3:F7"), options3)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet3, C_NULL)


## Example 4. Table without default header row

# Set the columns widths for clarity.
worksheet_set_column(worksheet4, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(worksheet4, CELL("B1"), "Table without default header row.", C_NULL)

# Set the table options.
options4 = lxw_table_options(no_header_row = true)

# Add a table to the worksheet.
worksheet_add_table(worksheet4, RANGE("B4:F7"), options4)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet4, C_NULL)


## Example 5. Default table with "First Column" and "Last Column" options

# Set the columns widths for clarity.
worksheet_set_column(worksheet5, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(
    worksheet5,
    CELL("B1"),
    "Default table with \"First Column\" and \"Last Column\" options.",
    C_NULL,
)

# Set the table options.
options5 = lxw_table_options(first_column = true, last_column = true)

# Add a table to the worksheet.
worksheet_add_table(worksheet5, RANGE("B3:F7"), options5)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet5, C_NULL)


## Example 6. Table with banded columns but without default banded rows

# Set the columns widths for clarity.
worksheet_set_column(worksheet6, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(
    worksheet6,
    CELL("B1"),
    "Table with banded columns but without default banded rows.",
    C_NULL,
)

# Set the table options.
options6 = lxw_table_options(no_banded_rows = true, banded_columns = true)

# Add a table to the worksheet.
worksheet_add_table(worksheet6, RANGE("B3:F7"), options6)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet6, C_NULL)


## Example 7. Table with user defined column headers

# Set the columns widths for clarity.
worksheet_set_column(worksheet7, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(
    worksheet7,
    CELL("B1"),
    "Table with user defined column headers.",
    C_NULL,
)


# Set the table options.
col7_1 = lxw_table_column(header = "Product")
col7_2 = lxw_table_column(header = "Quarter 1")
col7_3 = lxw_table_column(header = "Quarter 2")
col7_4 = lxw_table_column(header = "Quarter 3")
col7_5 = lxw_table_column(header = "Quarter 4")

columns7 = [col7_1, col7_2, col7_3, col7_4, col7_5, C_NULL]

options7 = lxw_table_options(columns = columns7)

# Add a table to the worksheet.
worksheet_add_table(worksheet7, RANGE("B3:F7"), options7)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet7, C_NULL)


## Example 8. Table with user defined column headers

# Set the columns widths for clarity.
worksheet_set_column(worksheet8, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(
    worksheet8,
    CELL("B1"),
    "Table with user defined column headers.",
    C_NULL,
)

# Set the table options.
col8_1 = lxw_table_column(header = "Product")
col8_2 = lxw_table_column(header = "Quarter 1")
col8_3 = lxw_table_column(header = "Quarter 2")
col8_4 = lxw_table_column(header = "Quarter 3")
col8_5 = lxw_table_column(header = "Quarter 4")
col8_6 =
    lxw_table_column(header = "Year", formula = "=SUM(Table8[@[Quarter 1]:[Quarter 4]])")

columns8 = [col8_1, col8_2, col8_3, col8_4, col8_5, col8_6, C_NULL]

options8 = lxw_table_options(columns = columns8)

# Add a table to the worksheet.
worksheet_add_table(worksheet8, RANGE("B3:G7"), options8)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet8, C_NULL)


## Example 9. Table with totals row (but no caption or totals)

# Set the columns widths for clarity.
worksheet_set_column(worksheet9, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(
    worksheet9,
    CELL("B1"),
    "Table with totals row (but no caption or totals).",
    C_NULL,
)


# Set the table options.
col9_1 = lxw_table_column(header = "Product")
col9_2 = lxw_table_column(header = "Quarter 1")
col9_3 = lxw_table_column(header = "Quarter 2")
col9_4 = lxw_table_column(header = "Quarter 3")
col9_5 = lxw_table_column(header = "Quarter 4")
col9_6 =
    lxw_table_column(header = "Year", formula = "=SUM(Table9[@[Quarter 1]:[Quarter 4]])")

columns9 = [col9_1, col9_2, col9_3, col9_4, col9_5, col9_6, C_NULL]

options9 = lxw_table_options(total_row = true, columns = columns9)

# Add a table to the worksheet.
worksheet_add_table(worksheet9, RANGE("B3:G8"), options9)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet9, C_NULL)


## Example 10. Table with totals row with user captions and functions

# Set the columns widths for clarity.
worksheet_set_column(worksheet10, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(
    worksheet10,
    CELL("B1"),
    "Table with totals row with user captions and functions.",
    C_NULL,
)

# Set the table options.
col10_1 = lxw_table_column(header = "Product", total_string = "Totals")

col10_2 = lxw_table_column(header = "Quarter 1", total_function = LXW_TABLE_FUNCTION_SUM)

col10_3 = lxw_table_column(header = "Quarter 2", total_function = LXW_TABLE_FUNCTION_SUM)

col10_4 = lxw_table_column(header = "Quarter 3", total_function = LXW_TABLE_FUNCTION_SUM)

col10_5 = lxw_table_column(header = "Quarter 4", total_function = LXW_TABLE_FUNCTION_SUM)

col10_6 = lxw_table_column(
    header = "Year",
    formula = "=SUM(Table10[@[Quarter 1]:[Quarter 4]])",
    total_function = LXW_TABLE_FUNCTION_SUM,
)

columns10 = [col10_1, col10_2, col10_3, col10_4, col10_5, col10_6, C_NULL]

options10 = lxw_table_options(total_row = true, columns = columns10)

# Add a table to the worksheet.
worksheet_add_table(worksheet10, RANGE("B3:G8"), options10)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet10, C_NULL)


## Example 11. Table with alternative Excel style

# Set the columns widths for clarity.
worksheet_set_column(worksheet11, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(
    worksheet11,
    CELL("B1"),
    "Table with alternative Excel style.",
    C_NULL,
)

# Set the table options.
col11_1 = lxw_table_column(header = "Product", total_string = "Totals")

col11_2 = lxw_table_column(header = "Quarter 1", total_function = LXW_TABLE_FUNCTION_SUM)

col11_3 = lxw_table_column(header = "Quarter 2", total_function = LXW_TABLE_FUNCTION_SUM)

col11_4 = lxw_table_column(header = "Quarter 3", total_function = LXW_TABLE_FUNCTION_SUM)

col11_5 = lxw_table_column(header = "Quarter 4", total_function = LXW_TABLE_FUNCTION_SUM)

col11_6 = lxw_table_column(
    header = "Year",
    formula = "=SUM(Table11[@[Quarter 1]:[Quarter 4]])",
    total_function = LXW_TABLE_FUNCTION_SUM,
)

columns11 = [col11_1, col11_2, col11_3, col11_4, col11_5, col11_6, C_NULL]

options11 = lxw_table_options(
    style_type = LXW_TABLE_STYLE_TYPE_LIGHT,
    style_type_number = 11,
    total_row = true,
    columns = columns11,
)

# Add a table to the worksheet.
worksheet_add_table(worksheet11, RANGE("B3:G8"), options11)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet11, C_NULL)


## Example 12. Table with Excel style removed

# Set the columns widths for clarity.
worksheet_set_column(worksheet12, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(worksheet12, CELL("B1"), "Table with Excel style removed.", C_NULL)

# Set the table options.
col12_1 = lxw_table_column(header = "Product", total_string = "Totals")

col12_2 = lxw_table_column(header = "Quarter 1", total_function = LXW_TABLE_FUNCTION_SUM)

col12_3 = lxw_table_column(header = "Quarter 2", total_function = LXW_TABLE_FUNCTION_SUM)

col12_4 = lxw_table_column(header = "Quarter 3", total_function = LXW_TABLE_FUNCTION_SUM)

col12_5 = lxw_table_column(header = "Quarter 4", total_function = LXW_TABLE_FUNCTION_SUM)

col12_6 = lxw_table_column(
    header = "Year",
    formula = "=SUM(Table12[@[Quarter 1]:[Quarter 4]])",
    total_function = LXW_TABLE_FUNCTION_SUM,
)

columns12 = [col12_1, col12_2, col12_3, col12_4, col12_5, col12_6, C_NULL]

options12 = lxw_table_options(
    style_type = LXW_TABLE_STYLE_TYPE_LIGHT,
    style_type_number = 0,
    total_row = true,
    columns = columns12,
)

# Add a table to the worksheet.
worksheet_add_table(worksheet12, RANGE("B3:G8"), options12)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet12, C_NULL)


## Example 13. Table with column formats

# Set the columns widths for clarity.
worksheet_set_column(worksheet13, COLS("B:G"), 12, C_NULL)

# Write the worksheet caption to explain the example.
worksheet_write_string(worksheet13, CELL("B1"), "Table with column formats.", C_NULL)

# Set the table options.
col13_1 = lxw_table_column(header = "Product", total_string = "Totals")

col13_2 = lxw_table_column(
    header = "Quarter 1",
    total_function = LXW_TABLE_FUNCTION_SUM,
    format = currency_format,
)

col13_3 = lxw_table_column(
    header = "Quarter 2",
    total_function = LXW_TABLE_FUNCTION_SUM,
    format = currency_format,
)

col13_4 = lxw_table_column(
    header = "Quarter 3",
    total_function = LXW_TABLE_FUNCTION_SUM,
    format = currency_format,
)

col13_5 = lxw_table_column(
    header = "Quarter 4",
    total_function = LXW_TABLE_FUNCTION_SUM,
    format = currency_format,
)

col13_6 = lxw_table_column(
    header = "Year",
    formula = "=SUM(Table13[@[Quarter 1]:[Quarter 4]])",
    total_function = LXW_TABLE_FUNCTION_SUM,
    format = currency_format,
)

columns13 = [col13_1, col13_2, col13_3, col13_4, col13_5, col13_6, C_NULL]

options13 = lxw_table_options(total_row = true, columns = columns13)

# Add a table to the worksheet.
worksheet_add_table(worksheet13, RANGE("B3:G8"), options13)

# Write the data into the worksheet cells.
write_worksheet_data(worksheet13, currency_format)


workbook_close(workbook)
