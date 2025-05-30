#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/comments2.c
/*
 * An example of writing cell comments to a worksheet using libxlsxwriter.
 *
 * Each of the worksheets demonstrates different features of cell comments.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    workbook_new,
    workbook_add_worksheet,
    workbook_add_format,
    format_set_text_wrap,
    format_set_align,
    LXW_ALIGN_VERTICAL_TOP,
    worksheet_set_column,
    worksheet_set_row,
    worksheet_write_string,
    CELL,
    worksheet_write_comment,
    lxw_comment_options,
    LXW_COMMENT_DISPLAY_VISIBLE,
    worksheet_write_comment_opt,
    worksheet_show_comments,
    LXW_COMMENT_DISPLAY_HIDDEN,
    LXW_COLOR_GREEN,
    workbook_close

workbook = workbook_new("comments2.xlsx")
worksheet1 = workbook_add_worksheet(workbook)
worksheet2 = workbook_add_worksheet(workbook)
worksheet3 = workbook_add_worksheet(workbook)
worksheet4 = workbook_add_worksheet(workbook)
worksheet5 = workbook_add_worksheet(workbook)
worksheet6 = workbook_add_worksheet(workbook)
worksheet7 = workbook_add_worksheet(workbook)
worksheet8 = workbook_add_worksheet(workbook)

text_wrap = workbook_add_format(workbook)
format_set_text_wrap(text_wrap)
format_set_align(text_wrap, LXW_ALIGN_VERTICAL_TOP)


## Example 1. Demonstrates a simple cell comments without formatting.

# Set up some worksheet formatting.
worksheet_set_column(worksheet1, 2, 2, 25)
worksheet_set_row(worksheet1, 2, 50)


worksheet_write_string(
    worksheet1,
    CELL("C3"),
    "Hold the mouse over this cell to see the comment.",
    text_wrap,
)

worksheet_write_comment(worksheet1, CELL("C3"), "This is a comment.")


## Example 2. Demonstrates visible and hidden comments.

# Set up some worksheet formatting.
worksheet_set_column(worksheet2, 2, 2, 25)
worksheet_set_row(worksheet2, 2, 50)
worksheet_set_row(worksheet2, 2, 50)


worksheet_write_string(worksheet2, CELL("C3"), "This cell comment is visible.", text_wrap)

# Use an option to make the comment visible.
options2 = lxw_comment_options(visible = LXW_COMMENT_DISPLAY_VISIBLE)
worksheet_write_comment_opt(worksheet2, CELL("C3"), "Hello.", options2)


worksheet_write_string(
    worksheet2,
    CELL("C6"),
    "This cell comment isn't visible until you pass " * "the mouse over it (the default).",
    text_wrap,
)

worksheet_write_comment(worksheet2, CELL("C6"), "Hello.")


## Example 3. Demonstrates visible and hidden comments, set at the
worksheet_set_column(worksheet3, 2, 2, 25)
worksheet_set_row(worksheet3, 2, 50)
worksheet_set_row(worksheet3, 5, 50)
worksheet_set_row(worksheet3, 8, 50)

# Make all comments on the worksheet visible.
worksheet_show_comments(worksheet3)


worksheet_write_string(
    worksheet3,
    CELL("C3"),
    "This cell comment is visible, explicitly.",
    text_wrap,
)

options3a = lxw_comment_options(visible = LXW_COMMENT_DISPLAY_VISIBLE)
worksheet_write_comment_opt(worksheet3, 2, 2, "Hello", options3a)


worksheet_write_string(
    worksheet3,
    CELL("C6"),
    "This cell comment is also visible because " * "we used worksheet_show_comments().",
    text_wrap,
)

worksheet_write_comment(worksheet3, CELL("C6"), "Hello")


worksheet_write_string(
    worksheet3,
    CELL("C9"),
    "However, we can still override it locally.",
    text_wrap,
)

options3b = lxw_comment_options(visible = LXW_COMMENT_DISPLAY_HIDDEN)
worksheet_write_comment_opt(worksheet3, CELL("C9"), "Hello", options3b)


## Example 4. Demonstrates changes to the comment box dimensions.
worksheet_set_column(worksheet4, 2, 2, 25)
worksheet_set_row(worksheet4, 2, 50)
worksheet_set_row(worksheet4, 5, 50)
worksheet_set_row(worksheet4, 8, 50)
worksheet_set_row(worksheet4, 15, 50)
worksheet_set_row(worksheet4, 18, 50)

worksheet_show_comments(worksheet4)


worksheet_write_string(
    worksheet4,
    CELL("C3"),
    "This cell comment is default size.",
    text_wrap,
)

worksheet_write_comment_opt(worksheet4, 2, 2, "Hello", C_NULL)


worksheet_write_string(
    worksheet4,
    CELL("C6"),
    "This cell comment is twice as wide.",
    text_wrap,
)

options4a = lxw_comment_options(x_scale = 2.0)
worksheet_write_comment_opt(worksheet4, CELL("C6"), "Hello", options4a)


worksheet_write_string(
    worksheet4,
    CELL("C9"),
    "This cell comment is twice as high.",
    text_wrap,
)

options4b = lxw_comment_options(y_scale = 2.0)
worksheet_write_comment_opt(worksheet4, CELL("C9"), "Hello", options4b)


worksheet_write_string(
    worksheet4,
    CELL("C16"),
    "This cell comment is scaled in both directions.",
    text_wrap,
)

options4c = lxw_comment_options(x_scale = 1.2, y_scale = 0.5)
worksheet_write_comment_opt(worksheet4, CELL("C16"), "Hello", options4c)


worksheet_write_string(
    worksheet4,
    CELL("C19"),
    "This cell comment has width and height specified in pixels.",
    text_wrap,
)

options4d = lxw_comment_options(width = 200, height = 50)
worksheet_write_comment_opt(worksheet4, CELL("C19"), "Hello", options4d)


##  Example 5. Demonstrates changes to the cell comment position.
worksheet_set_column(worksheet5, 2, 2, 25)
worksheet_set_row(worksheet5, 2, 50)
worksheet_set_row(worksheet5, 5, 50)
worksheet_set_row(worksheet5, 8, 50)

worksheet_show_comments(worksheet5)

worksheet_write_string(
    worksheet5,
    CELL("C3"),
    "This cell comment is in the default position.",
    text_wrap,
)

worksheet_write_comment(worksheet5, 2, 2, "Hello")


worksheet_write_string(
    worksheet5,
    CELL("C6"),
    "This cell comment has been moved to another cell.",
    text_wrap,
)

options5a = lxw_comment_options(start_row = 3, start_col = 4)
worksheet_write_comment_opt(worksheet5, CELL("C6"), "Hello", options5a)


worksheet_write_string(
    worksheet5,
    CELL("C9"),
    "This cell comment has been shifted within its default cell.",
    text_wrap,
)

options5b = lxw_comment_options(x_offset = 30, y_offset = 12)
worksheet_write_comment_opt(worksheet5, CELL("C9"), "Hello", options5b)


## Example 6. Demonstrates changes to the comment background color.
worksheet_set_column(worksheet6, 2, 2, 25)
worksheet_set_row(worksheet6, 2, 50)
worksheet_set_row(worksheet6, 5, 50)
worksheet_set_row(worksheet6, 8, 50)

worksheet_show_comments(worksheet6)

worksheet_write_string(
    worksheet6,
    CELL("C3"),
    "This cell comment has a different color.",
    text_wrap,
)

options6a = lxw_comment_options(color = LXW_COLOR_GREEN)
worksheet_write_comment_opt(worksheet6, 2, 2, "Hello", options6a)


worksheet_write_string(
    worksheet6,
    CELL("C6"),
    "This cell comment has the default color.",
    text_wrap,
)

worksheet_write_comment(worksheet6, CELL("C6"), "Hello")


worksheet_write_string(
    worksheet6,
    CELL("C9"),
    "This cell comment has a different color.",
    text_wrap,
)

options6b = lxw_comment_options(color = 0xFF6600)
worksheet_write_comment_opt(worksheet6, CELL("C9"), "Hello", options6b)


## Example 7. Demonstrates how to set the cell comment author.
worksheet_set_column(worksheet7, 2, 2, 30)
worksheet_set_row(worksheet7, 2, 50)
worksheet_set_row(worksheet7, 5, 60)

worksheet_write_string(
    worksheet7,
    CELL("C3"),
    "Move the mouse over this cell and you will see 'Cell C3 " *
    "commented by' (blank) in the status bar at the bottom.",
    text_wrap,
)

worksheet_write_comment(worksheet7, CELL("C3"), "Hello")


worksheet_write_string(
    worksheet7,
    CELL("C6"),
    "Move the mouse over this cell and you will see 'Cell C6 " *
    "commented by libxlsxwriter' in the status bar at the bottom.",
    text_wrap,
)

options7a = lxw_comment_options(author = "libxlsxwriter")
worksheet_write_comment_opt(worksheet7, CELL("C6"), "Hello", options7a)


## Example 8. Demonstrates the need to explicitly set the row height.
worksheet_set_column(worksheet8, 2, 2, 25)
worksheet_set_row(worksheet8, 2, 80)

worksheet_show_comments(worksheet8)

worksheet_write_string(
    worksheet8,
    CELL("C3"),
    "The height of this row has been adjusted explicitly using " *
    "worksheet_set_row(). The size of the comment box is " *
    "adjusted accordingly by libxlsxwriter",
    text_wrap,
)

worksheet_write_comment(worksheet8, CELL("C3"), "Hello")


worksheet_write_string(
    worksheet8,
    CELL("C6"),
    "The height of this row has been adjusted by Excel when the " *
    "file is opened due to the text wrap property being set. " *
    "Unfortunately this means that the height of the row is " *
    "unknown to libxlsxwriter at run time and thus the comment " *
    "box is stretched as well.\n\n" *
    "Use worksheet_set_row() to specify the row height explicitly " *
    "to avoid this problem.",
    text_wrap,
)

worksheet_write_comment(worksheet8, CELL("C6"), "Hello")

workbook_close(workbook)
