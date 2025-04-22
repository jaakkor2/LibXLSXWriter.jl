#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/merge_range.c
/*
 * An example of merging cells using libxlsxwriter.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    workbook_new,
    workbook_add_worksheet,
    workbook_add_format,
    format_set_align,
    LXW_ALIGN_CENTER,
    LXW_ALIGN_VERTICAL_CENTER,
    format_set_bold,
    format_set_bg_color,
    LXW_COLOR_YELLOW,
    format_set_border,
    LXW_BORDER_THIN,
    worksheet_set_column,
    worksheet_set_row,
    worksheet_merge_range,
    workbook_close

workbook = workbook_new("merge_range.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)
merge_format = workbook_add_format(workbook)

# Configure a format for the merged range.
format_set_align(merge_format, LXW_ALIGN_CENTER)
format_set_align(merge_format, LXW_ALIGN_VERTICAL_CENTER)
format_set_bold(merge_format)
format_set_bg_color(merge_format, LXW_COLOR_YELLOW)
format_set_border(merge_format, LXW_BORDER_THIN)

# Increase the cell size of the merged cells to highlight the formatting.
worksheet_set_column(worksheet, 1, 3, 12, C_NULL)
worksheet_set_row(worksheet, 3, 30, C_NULL)
worksheet_set_row(worksheet, 6, 30, C_NULL)
worksheet_set_row(worksheet, 7, 30, C_NULL)

# Merge 3 cells.
worksheet_merge_range(worksheet, 3, 1, 3, 3, "Merged Range", merge_format)

# Merge 3 cells over two rows.
worksheet_merge_range(worksheet, 6, 1, 7, 3, "Merged Range", merge_format)

workbook_close(workbook)

nothing
