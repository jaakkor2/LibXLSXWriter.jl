#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/conditional_format1.c
/*
 * An a simple example of how to add conditional formatting to an
 * libxlsxwriter file.
 *
 * See conditional_format.c for a more comprehensive example.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    workbook_new,
    workbook_add_worksheet,
    worksheet_write_number,
    CELL,
    workbook_add_format,
    format_set_font_color,
    LXW_COLOR_RED,
    lxw_conditional_format,
    LXW_CONDITIONAL_TYPE_CELL,
    LXW_CONDITIONAL_CRITERIA_LESS_THAN,
    worksheet_conditional_format_range,
    RANGE,
    workbook_close

workbook = workbook_new("conditional_format_simple.xlsx")
worksheet = workbook_add_worksheet(workbook)

# Write some sample data.
worksheet_write_number(worksheet, CELL("B1"), 34)
worksheet_write_number(worksheet, CELL("B2"), 32)
worksheet_write_number(worksheet, CELL("B3"), 31)
worksheet_write_number(worksheet, CELL("B4"), 35)
worksheet_write_number(worksheet, CELL("B5"), 36)
worksheet_write_number(worksheet, CELL("B6"), 30)
worksheet_write_number(worksheet, CELL("B7"), 38)
worksheet_write_number(worksheet, CELL("B8"), 38)
worksheet_write_number(worksheet, CELL("B9"), 32)

# Add a format with red text.
custom_format = workbook_add_format(workbook)
format_set_font_color(custom_format, LXW_COLOR_RED)

# Create a conditional format object. A static object would also work.
conditional_format = lxw_conditional_format()

# Set the format type: a cell conditional: */
conditional_format[].type = LXW_CONDITIONAL_TYPE_CELL

# Set the criteria to use:
conditional_format[].criteria = LXW_CONDITIONAL_CRITERIA_LESS_THAN

# Set the value to which the criteria will be applied:
conditional_format[].value = 33

# Set the format to use if the criteria/value applies:
conditional_format[].format = custom_format

# Now apply the format to data range.
worksheet_conditional_format_range(worksheet, RANGE("B1:B9"), conditional_format)

# Free the object and close the file.
#Libc.free(conditional_format[])
workbook_close(workbook)
