# https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/array_formula.c

using LibXLSXWriter: workbook_new, workbook_add_worksheet, worksheet_write_number, worksheet_write_array_formula, RANGE, workbook_close

# Create a new workbook and add a worksheet.
workbook = workbook_new("array_formula.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)

# Write some data for the formulas.
worksheet_write_number(worksheet, 0, 1, 500, C_NULL)
worksheet_write_number(worksheet, 1, 1, 10, C_NULL)
worksheet_write_number(worksheet, 4, 1, 1, C_NULL)
worksheet_write_number(worksheet, 5, 1, 2, C_NULL)
worksheet_write_number(worksheet, 6, 1, 3, C_NULL)

worksheet_write_number(worksheet, 0, 2, 300, C_NULL)
worksheet_write_number(worksheet, 1, 2, 15, C_NULL)
worksheet_write_number(worksheet, 4, 2, 20234, C_NULL)
worksheet_write_number(worksheet, 5, 2, 21003, C_NULL)
worksheet_write_number(worksheet, 6, 2, 10000, C_NULL)

# Write an array formula that returns a single value.
worksheet_write_array_formula(worksheet, 0, 0, 0, 0, "{=SUM(B1:C1*B2:C2)}", C_NULL)

# Similar to above but using the RANGE macro.
worksheet_write_array_formula(worksheet, RANGE("A2:A2")..., "{=SUM(B1:C1*B2:C2)}", C_NULL)

# Write an array formula that returns a range of values.
worksheet_write_array_formula(worksheet, 4, 0, 6, 0, "{=TREND(C5:C7,B5:B7)}", C_NULL)

workbook_close(workbook)