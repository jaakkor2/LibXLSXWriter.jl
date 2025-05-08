#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/worksheet_protection.c
/*
 * Example of cell locking and formula hiding in an Excel worksheet using
 * libxlsxwriter.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    workbook_new,
    workbook_add_worksheet,
    workbook_add_format,
    format_set_unlocked,
    format_set_hidden,
    worksheet_set_column,
    worksheet_protect,
    worksheet_write_string,
    worksheet_write_formula,
    workbook_close

workbook = workbook_new("protection.xlsx")
worksheet = workbook_add_worksheet(workbook)

unlocked = workbook_add_format(workbook)
format_set_unlocked(unlocked)

hidden = workbook_add_format(workbook)
format_set_hidden(hidden)

# Widen the first column to make the text clearer.
worksheet_set_column(worksheet, 0, 0, 40)

# Turn worksheet protection on without a password.
worksheet_protect(worksheet, C_NULL, C_NULL)

# Write a locked, unlocked and hidden cell.
worksheet_write_string(worksheet, 0, 0, "B1 is locked. It cannot be edited.")
worksheet_write_string(worksheet, 1, 0, "B2 is unlocked. It can be edited.")
worksheet_write_string(worksheet, 2, 0, "B3 is hidden. The formula isn't visible.")

worksheet_write_formula(worksheet, 0, 1, "=1+2")     # Locked by default.
worksheet_write_formula(worksheet, 1, 1, "=1+2", unlocked)
worksheet_write_formula(worksheet, 2, 1, "=1+2", hidden)

workbook_close(workbook)
