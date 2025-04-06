# https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/doc_properties.c

using LibXLSXWriter: workbook_new, workbook_add_worksheet, lxw_doc_properties, workbook_set_properties, worksheet_set_column, worksheet_write_string, workbook_close

workbook = workbook_new("doc_properties.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)

# Create a properties structure and set some of the fields.
properties = lxw_doc_properties(
    title    = "This is an example spreadsheet",
    subject  = "With document properties",
    author   = "John McNamara",
    manager  = "Dr. Heinz Doofenshmirtz",
    company  = "of Wolves",
    category = "Example spreadsheets",
    keywords = "Sample, Example, Properties",
    comments = "Created with libxlsxwriter",
    status   = "Quo",
)

# Set the properties in the workbook.
workbook_set_properties(workbook, properties)

# Add some text to the file.
worksheet_set_column(worksheet, 0, 0, 50, C_NULL)
worksheet_write_string(worksheet, 0, 0, "Select 'Workbook Properties' to see properties." , C_NULL)

workbook_close(workbook)
