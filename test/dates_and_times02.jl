#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/dates_and_times02.c
/*
 * Example of writing dates and times in Excel using an lxw_datetime struct
 * and date formatting.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter: lxw_datetime, workbook_new, workbook_add_worksheet, workbook_add_format, format_set_num_format, worksheet_set_column, worksheet_write_datetime, workbook_close

# A datetime to display.
datetime = Ref(lxw_datetime(2013, 2, 28, 12, 0, 0.0))

# Create a new workbook and add a worksheet.
workbook  = workbook_new("date_and_times02.xlsx")
worksheet = workbook_add_worksheet(workbook)

# Add a format with date formatting.
format    = workbook_add_format(workbook)
format_set_num_format(format, "mmm d yyyy hh:mm AM/PM")

# Widen the first column to make the text clearer.
worksheet_set_column(worksheet, 0, 0, 20)

# Write the datetime without formatting.
worksheet_write_datetime(worksheet, 0, 0, datetime)  # 41333.5

# Write the datetime with formatting.
worksheet_write_datetime(worksheet, 1, 0, datetime, format)  # Feb 28 2013 12:00 PM

workbook_close(workbook)
