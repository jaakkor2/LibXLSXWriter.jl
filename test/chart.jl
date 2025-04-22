#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/chart.c
/*
 * An example of a simple Excel chart using the libxlsxwriter library.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    lxw_worksheet,
    worksheet_write_number,
    workbook_new,
    workbook_add_worksheet,
    workbook_add_chart,
    LXW_CHART_COLUMN,
    chart_add_series,
    lxw_chart_font,
    LXW_EXPLICIT_FALSE,
    LXW_COLOR_BLUE,
    chart_title_set_name,
    chart_title_set_name_font,
    worksheet_insert_chart,
    CELL,
    workbook_close

# Write some data to the worksheet.
function write_worksheet_data(worksheet)

    data = [
        # Three columns of data.
        [1, 2, 3],
        [2, 4, 6],
        [3, 6, 9],
        [4, 8, 12],
        [5, 10, 15],
    ]

    for row = 1:5, col = 1:3
        worksheet_write_number(worksheet, row - 1, col - 1, data[row][col], C_NULL)
    end
end

# Create a worksheet with a chart.
workbook = workbook_new("chart.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)

# Write some data for the chart.
write_worksheet_data(worksheet)

# Create a chart object.
chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Configure the chart. In simplest case we just add some value data
# series. The C_NULL categories will default to 1 to 5 like in Excel.

chart_add_series(chart, C_NULL, raw"Sheet1!$A$1:$A$5")
chart_add_series(chart, C_NULL, raw"Sheet1!$B$1:$B$5")
chart_add_series(chart, C_NULL, raw"Sheet1!$C$1:$C$5")


font = lxw_chart_font(bold = LXW_EXPLICIT_FALSE, color = LXW_COLOR_BLUE)

chart_title_set_name(chart, "Year End Results")
chart_title_set_name_font(chart, font)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("B7"), chart)

workbook_close(workbook)
