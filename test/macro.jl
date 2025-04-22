#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/macro.c
/*****************************************************************************
 *
 * An example of adding macros to a libxlsxwriter file using a VBA project
 * file extracted from an existing Excel .xlsm file.
 *
 * The vba_extract.py utility from the libxlsxwriter examples directory can be
 * used to extract the vbaProject.bin file.
 *
 * This example connects the macro to a button (the only Excel/VBA form object
 * supported by libxlsxwriter) but that isn't a requirement for adding a macro
 * file to the workbook.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 */
=#

using LibXLSXWriter:
    workbook_new,
    workbook_add_worksheet,
    worksheet_set_column,
    COLS,
    workbook_add_vba_project,
    worksheet_write_string,
    lxw_button_options,
    worksheet_insert_button,
    workbook_close

# Note the xlsm extension of the filename
workbook = workbook_new("macro.xlsm")
worksheet = workbook_add_worksheet(workbook, C_NULL)

worksheet_set_column(worksheet, COLS("A:A"), 30, C_NULL)

# Add a macro file extracted from an Excel workbook.
workbook_add_vba_project(workbook, "vbaProject.bin")

worksheet_write_string(worksheet, 2, 0, "Press the button to say hello.", C_NULL)

options =
    lxw_button_options(caption = "Press Me", _macro = "say_hello", width = 80, height = 30)

worksheet_insert_button(worksheet, 2, 1, options)

workbook_close(workbook)
