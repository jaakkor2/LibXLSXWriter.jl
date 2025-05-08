# LibXLSXWriter.jl

LibXLSXWriter is a package for creating Excel XSLX files based on  [libxlsxwriter](https://github.com/jmcnamara/libxlsxwriter).  This package wraps the C API, see the [full documentation](http://libxlsxwriter.github.io/) for the getting started guide, a tutorial, the main API documentation and examples.

This wrapper depends on [libxlsxwriter_jll](https://github.com/JuliaBinaryWrappers/libxlsxwriter_jll.jl).

Here is an example that creates the same spreadsheet as in [demo.c](https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/demo.c
).  See the [test folder](https://github.com/jaakkor2/LibXLSXWriter.jl/tree/master/test) for more examples of the Julia syntax.
```julia
using LibXLSXWriter: workbook_new, workbook_add_worksheet, workbook_add_format, format_set_bold, worksheet_set_column, worksheet_write_string, worksheet_write_number, worksheet_insert_image, workbook_close

# Create a new workbook and add a worksheet.
workbook  = workbook_new("demo.xlsx")
worksheet = workbook_add_worksheet(workbook)

# Add a format.
format = workbook_add_format(workbook)

# Set the bold property for the format
format_set_bold(format)

# Change the column width for clarity.
worksheet_set_column(worksheet, 0, 0, 20)

# Write some simple text.
worksheet_write_string(worksheet, 0, 0, "Hello")

# Text with formatting.
worksheet_write_string(worksheet, 1, 0, "World", format)

# Write some numbers.
worksheet_write_number(worksheet, 2, 0, 123)
worksheet_write_number(worksheet, 3, 0, 123.456)

# Insert an image.
worksheet_insert_image(worksheet, 1, 2, "logo.png")

workbook_close(workbook)
```

[![Build Status](https://github.com/jaakkor2/LibXLSXWriter.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/jaakkor2/LibXLSXWriter.jl/actions/workflows/CI.yml?query=branch%3Amaster)
