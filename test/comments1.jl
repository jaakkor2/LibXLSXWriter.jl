# https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/comments1.c

using LibXLSXWriter: workbook_new, workbook_add_worksheet, worksheet_write_string, worksheet_write_comment, workbook_close

workbook = workbook_new("comments1.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)

worksheet_write_string(worksheet, 0, 0, "Hello" , C_NULL)

worksheet_write_comment(worksheet, 0, 0, "This is a comment")

workbook_close(workbook)
