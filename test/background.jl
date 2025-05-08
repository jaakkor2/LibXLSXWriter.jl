#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/background.c
/*
 * An example of setting a worksheet background image with libxlsxwriter.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    workbook_new, workbook_add_worksheet, worksheet_set_background, workbook_close

workbook = workbook_new("background.xlsx")
worksheet = workbook_add_worksheet(workbook)

worksheet_set_background(worksheet, "logo.png")

workbook_close(workbook)
