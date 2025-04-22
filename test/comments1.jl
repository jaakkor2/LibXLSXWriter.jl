#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/comments1.c
/*
 * An example of writing cell comments to a worksheet using libxlsxwriter.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
 =#

using LibXLSXWriter:
    workbook_new,
    workbook_add_worksheet,
    worksheet_write_string,
    worksheet_write_comment,
    workbook_close

workbook = workbook_new("comments1.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)

worksheet_write_string(worksheet, 0, 0, "Hello", C_NULL)

worksheet_write_comment(worksheet, 0, 0, "This is a comment")

workbook_close(workbook)
