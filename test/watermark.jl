#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/watermark.c
/*
 * An example of adding a worksheet watermark image using libxlsxwriter. This
 * is based on the method of putting an image in the worksheet header as
 * suggested in the Microsoft documentation:
 * https://support.microsoft.com/en-us/office/add-a-watermark-in-excel-a372182a-d733-484e-825c-18ddf3edf009
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    workbook_new,
    workbook_add_worksheet,
    lxw_header_footer_options,
    worksheet_set_header_opt,
    workbook_close

workbook = workbook_new("watermark.xlsx")
worksheet = workbook_add_worksheet(workbook)

# Set a worksheet header with the watermark image.
header_options = lxw_header_footer_options(image_center = "watermark.png")
worksheet_set_header_opt(worksheet, "&C&[Picture]", header_options)

workbook_close(workbook)
