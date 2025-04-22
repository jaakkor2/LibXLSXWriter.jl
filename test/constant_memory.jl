#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/constant_memory.c
/*
 * Example of using libxlsxwriter for writing large files in constant memory
 * mode.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter: lxw_workbook_options, workbook_new_opt, workbook_add_worksheet, worksheet_write_number, workbook_close

max_row = 1000
max_col = 50

# Set the worksheet options
options = lxw_workbook_options(constant_memory = true,
                                tmpdir = C_NULL,
                                use_zip64 = false,
                                output_buffer = C_NULL,
                                output_buffer_size = C_NULL)

# Create a new workbook with options
workbook = workbook_new_opt("constant_memory.xlsx", options)
worksheet = workbook_add_worksheet(workbook, C_NULL)

for row = 1:max_row, col = 1:max_col
    worksheet_write_number(worksheet, row - 1 , col - 1, 123.45, C_NULL)
end

workbook_close(workbook)
