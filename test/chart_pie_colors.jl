# https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/chart_pie_colors.c

using LibXLSXWriter: workbook_new, workbook_add_worksheet, worksheet_write_string, CELL, worksheet_write_number, workbook_add_chart, LXW_CHART_PIE, chart_add_series, lxw_chart_fill, LXW_COLOR_RED, LXW_COLOR_GREEN, lxw_chart_point, chart_series_set_points, worksheet_insert_chart, workbook_close

workbook = workbook_new("chart_pie_colors.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)

# Write some data for the chart.
worksheet_write_string(worksheet, CELL("A1"), "Pass", C_NULL)
worksheet_write_string(worksheet, CELL("A2"), "Fail", C_NULL)
worksheet_write_number(worksheet, CELL("B1"), 90, C_NULL)
worksheet_write_number(worksheet, CELL("B2"), 10, C_NULL)

# Create a pie chart.
chart = workbook_add_chart(workbook, LXW_CHART_PIE)

# Add the data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$1:$A$2", raw"=Sheet1!$B$1:$B$2")

# Create some fills for the chart points/segments.
red_fill = lxw_chart_fill(color=LXW_COLOR_RED)
green_fill = lxw_chart_fill(color=LXW_COLOR_GREEN)

# Add the fills to the point objects.
red_point = lxw_chart_point(fill=red_fill)
green_point = lxw_chart_point(fill=green_fill)

# Create an array of pointer to chart points. Note, the array should be NULL terminated.
points = [Ptr{green_point}(), Ptr{red_point}()]

# Add the points to the series.
chart_series_set_points(series, points)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("D2"), chart)

workbook_close(workbook)
