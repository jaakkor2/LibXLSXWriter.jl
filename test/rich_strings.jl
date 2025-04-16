#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/rich_strings.c
/*
 * An example of using the libxlsxwriter library to write some "rich strings",
 * i.e., strings with multiple formats.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter: workbook_new, workbook_add_worksheet, workbook_add_format, format_set_bold, format_set_italic, format_set_font_color, LXW_COLOR_RED, LXW_COLOR_BLUE, format_set_align, LXW_ALIGN_CENTER, format_set_font_script, LXW_FONT_SUPERSCRIPT, lxw_rich_string_tuple, worksheet_write_rich_string, workbook_close

workbook = workbook_new("rich_strings.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)

# Set up some formats to use.
bold = workbook_add_format(workbook)
format_set_bold(bold)

italic = workbook_add_format(workbook)
format_set_italic(italic)

red = workbook_add_format(workbook)
format_set_font_color(red, LXW_COLOR_RED)

blue = workbook_add_format(workbook)
format_set_font_color(blue, LXW_COLOR_BLUE)

center = workbook_add_format(workbook)
format_set_align(center, LXW_ALIGN_CENTER)

superscript = workbook_add_format(workbook)
format_set_font_script(superscript, LXW_FONT_SUPERSCRIPT)

# Make the first column wider for clarity.
worksheet_set_column(worksheet, 0, 0, 30, C_NULL)


## Create and write some rich strings with multiple formats.

# Example 1. Some bold and italic in the same string.
fragment11 = lxw_rich_string_tuple(format = C_NULL, string = "This is "     )
fragment12 = lxw_rich_string_tuple(format = bold,   string = "bold"         )
fragment13 = lxw_rich_string_tuple(format = C_NULL, string = " and this is ")
fragment14 = lxw_rich_string_tuple(format = italic, string = "italic"       )

rich_string1 = [fragment11, fragment12, fragment13, fragment14]

worksheet_write_rich_string(worksheet, CELL("A1"), rich_string1, C_NULL)


# Example 2. Some red and blue coloring in the same string.
fragment21 = lxw_rich_string_tuple(format = C_NULL, string = "This is "     )
fragment22 = lxw_rich_string_tuple(format = red,    string = "red"          )
fragment23 = lxw_rich_string_tuple(format = C_NULL, string = " and this is ")
fragment24 = lxw_rich_string_tuple(format = blue,   string = "blue"         )

rich_string2 = [fragment21, fragment22, fragment23, fragment24]

worksheet_write_rich_string(worksheet, CELL("A3"), rich_string2, C_NULL)


# Example 3. A rich string plus cell formatting.
fragment31 = lxw_rich_string_tuple(format = C_NULL, string = "Some "    )
fragment32 = lxw_rich_string_tuple(format = bold,   string = "bold text")
fragment33 = lxw_rich_string_tuple(format = C_NULL, string = " centered")

rich_string3 = [fragment31, fragment32, fragment33]

# Note that this example also has a "center" cell format.
worksheet_write_rich_string(worksheet, CELL("A5"), rich_string3, center)


# Example 4. A math example with a superscript.
fragment41 = lxw_rich_string_tuple(format = italic,      string = "j =k" )
fragment42 = lxw_rich_string_tuple(format = superscript, string = "(n-1)")

rich_string4 = [fragment41, fragment42]

worksheet_write_rich_string(worksheet, CELL("A7"), rich_string4, center)


workbook_close(workbook)
