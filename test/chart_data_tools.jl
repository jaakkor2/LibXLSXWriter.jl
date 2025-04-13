#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/chart_data_tools.c
/*
 * A demo of an various Excel chart data tools that are available via a
 * libxlsxwriter chart.
 *
 * These include Drop Lines and High-Low Lines.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 */
=#

using LibXLSXWriter: lxw_worksheet, lxw_format, worksheet_write_string, CELL, worksheet_write_number, workbook_new, workbook_add_worksheet, workbook_add_format, format_set_bold, workbook_add_chart, LXW_CHART_LINE, chart_title_set_name, chart_add_series, chart_set_high_low_lines, worksheet_insert_chart, chart_set_drop_lines, chart_set_up_down_bars, lxw_chart_line, lxw_chart_fill, LXW_COLOR_BLACK, LXW_COLOR_RED, chart_set_up_down_bars_format, chart_series_set_marker_type, LXW_CHART_MARKER_CIRCLE, chart_series_set_labels, chart_series_set_error_bars, chart_series_get_error_bars, LXW_CHART_ERROR_BAR_AXIS_Y, LXW_CHART_ERROR_BAR_TYPE_STD_ERROR, LXW_COLOR_GRAY, LXW_CHART_LINE_DASH_LONG_DASH, chart_series_set_trendline, LXW_CHART_TRENDLINE_TYPE_POLY, chart_series_set_trendline_line, workbook_close

# Write some data to the worksheet.
function write_worksheet_data(worksheet, bold)

    data = [
        # Three columns of data.
        [2, 10, 30],
        [3, 40, 60],
        [4, 50, 70],
        [5, 20, 50],
        [6, 10, 40],
        [7, 50, 30]
    ]

    worksheet_write_string(worksheet, CELL("A1"), "Number",  bold)
    worksheet_write_string(worksheet, CELL("B1"), "Batch 1", bold)
    worksheet_write_string(worksheet, CELL("C1"), "Batch 2", bold)

    for row = 1:6, col = 1:3
        worksheet_write_number(worksheet, row, col - 1, data[row][col] , C_NULL)
    end
end


# Create a worksheet with examples charts.

workbook = workbook_new("chart_data_tools.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)
# Add a bold format to use to highlight the header cells.
bold = workbook_add_format(workbook)
format_set_bold(bold)

# Write some data for the chart.
write_worksheet_data(worksheet, bold)


## Chart 1. Example with High Low Lines.

chart = workbook_add_chart(workbook, LXW_CHART_LINE)

# Add a chart title.
chart_title_set_name(chart, "Chart with High-Low Lines")

# Add the first series to the chart.
chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")
chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Add high-low lines to the chart.
chart_set_high_low_lines(chart, C_NULL)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E2"), chart)


## Chart 2. Example with Drop Lines.

chart = workbook_add_chart(workbook, LXW_CHART_LINE)

# Add a chart title.
chart_title_set_name(chart, "Chart with Drop Lines")

# Add the first series to the chart.
chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")
chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Add drop lines to the chart.
chart_set_drop_lines(chart, C_NULL)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E18"), chart)


## Chart 3. Example with Up-Down bars.

chart = workbook_add_chart(workbook, LXW_CHART_LINE)

# Add a chart title.
chart_title_set_name(chart, "Chart with Up-Down bars")

# Add the first series to the chart.
chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")
chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Add Up-Down bars to the chart.
chart_set_up_down_bars(chart)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E34"), chart)


## Chart 4. Example with Up-Down bars with formatting.

chart = workbook_add_chart(workbook, LXW_CHART_LINE)

# Add a chart title.
chart_title_set_name(chart, "Chart with Up-Down bars")

# Add the first series to the chart.
chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")
chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Add Up-Down bars to the chart, with formatting.
line = lxw_chart_line(color = LXW_COLOR_BLACK)
up_fill = lxw_chart_fill(color = 0x00B050)
down_fill = lxw_chart_fill(color = LXW_COLOR_RED)

chart_set_up_down_bars_format(chart, line, up_fill, line, down_fill)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E50"), chart)


## Chart 5. Example with Markers and data labels.

chart = workbook_add_chart(workbook, LXW_CHART_LINE)

# Add a chart title.
chart_title_set_name(chart, "Chart with Data Labels and Markers")

# Add the first series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")
chart_add_series(         chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Add series markers.
chart_series_set_marker_type(series, LXW_CHART_MARKER_CIRCLE)

# Add series data labels.
chart_series_set_labels(series)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E66"), chart)


## Chart 6. Example with Error Bars.

chart = workbook_add_chart(workbook, LXW_CHART_LINE)

# Add a chart title.
chart_title_set_name(chart, "Chart with Error Bars")

# Add the first series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")
chart_add_series(         chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Add error bars to show Standard Error.
chart_series_set_error_bars(chart_series_get_error_bars(series, LXW_CHART_ERROR_BAR_AXIS_Y), LXW_CHART_ERROR_BAR_TYPE_STD_ERROR, 0)
                            

# Add series data labels.
chart_series_set_labels(series)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E82"), chart)


## Chart 7. Example with a trendline

chart = workbook_add_chart(workbook, LXW_CHART_LINE)

# Add a chart title.
chart_title_set_name(chart, "Chart with a Trendline")

# Add the first series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")
chart_add_series(         chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Add a polynomial trendline.
poly_line = lxw_chart_line(color = LXW_COLOR_GRAY, dash_type = LXW_CHART_LINE_DASH_LONG_DASH)

chart_series_set_trendline(series, LXW_CHART_TRENDLINE_TYPE_POLY, 3)
chart_series_set_trendline_line(series, poly_line)
# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E98"), chart)


workbook_close(workbook)
