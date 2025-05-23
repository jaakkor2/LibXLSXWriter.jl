#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/doc_properties.c
/*
 * Example of setting document properties such as Author, Title, etc., for an
 * Excel spreadsheet using libxlsxwriter.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    workbook_new,
    workbook_add_worksheet,
    lxw_doc_properties,
    workbook_set_properties,
    worksheet_set_column,
    worksheet_write_string,
    workbook_close

workbook = workbook_new("doc_properties.xlsx")
worksheet = workbook_add_worksheet(workbook)

# Create a properties structure and set some of the fields.
properties = lxw_doc_properties(
    title = "This is an example spreadsheet",
    subject = "With document properties",
    author = "John McNamara",
    manager = "Dr. Heinz Doofenshmirtz",
    company = "of Wolves",
    category = "Example spreadsheets",
    keywords = "Sample, Example, Properties",
    comments = "Created with libxlsxwriter",
    status = "Quo",
)

# Set the properties in the workbook.
workbook_set_properties(workbook, properties)

# Add some text to the file.
worksheet_set_column(worksheet, 0, 0, 50)
worksheet_write_string(
    worksheet,
    0,
    0,
    "Select 'Workbook Properties' to see properties.",
)

workbook_close(workbook)
