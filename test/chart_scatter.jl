#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/chart_scatter.c
/*
 * An example of creating Excel scatter charts using the libxlsxwriter library.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter:
    worksheet_write_string,
    CELL,
    worksheet_write_number,
    workbook_new,
    workbook_add_worksheet,
    workbook_add_format,
    format_set_bold,
    workbook_add_chart,
    LXW_CHART_SCATTER,
    chart_add_series,
    chart_series_set_name,
    chart_series_set_categories,
    chart_series_set_values,
    chart_series_set_name_range,
    chart_title_set_name,
    chart_axis_set_name,
    chart_set_style,
    worksheet_insert_chart,
    lxw_worksheet,
    lxw_format,
    chart_axis_get,
    LXW_CHART_AXIS_TYPE_X,
    LXW_CHART_AXIS_TYPE_Y,
    LXW_CHART_SCATTER_STRAIGHT_WITH_MARKERS,
    LXW_CHART_SCATTER_STRAIGHT,
    LXW_CHART_SCATTER_SMOOTH_WITH_MARKERS,
    LXW_CHART_SCATTER_SMOOTH,
    workbook_close

# Write some data to the worksheet.
function write_worksheet_data(worksheet, bold)
    data = [
        2 10 30
        3 40 60
        4 50 70
        5 20 50
        6 10 40
        7 50 30
    ]

    worksheet_write_string(worksheet, CELL("A1"), "Number", bold)
    worksheet_write_string(worksheet, CELL("B1"), "Batch 1", bold)
    worksheet_write_string(worksheet, CELL("C1"), "Batch 2", bold)

    for row = 0:5, col = 0:2
        worksheet_write_number(worksheet, row + 1, col, data[row+1, col+1], C_NULL)
    end
end

### Create a worksheet with examples charts.
workbook = workbook_new("chart_scatter.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)
# Add a bold format to use to highlight the header cells.
bold = workbook_add_format(workbook)
format_set_bold(bold)

# Write some data for the chart.
write_worksheet_data(worksheet, bold)


### Chart 1. Create a scatter chart, the default shows points only.

chart = workbook_add_chart(workbook, LXW_CHART_SCATTER)

# Add the first series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Set the name for the series instead of the default "Series 1".
chart_series_set_name(series, raw"=Sheet1!$B$1")

# Add a second series but leave the categories and values undefined. They can be defined later using the alternative syntax shown below. 
series = chart_add_series(chart, C_NULL, C_NULL)

# Configure the series using a syntax that is easier to define programmatically.
chart_series_set_categories(series, "Sheet1", 1, 0, 6, 0) # "=Sheet1!$A$2:$A$7"
chart_series_set_values(series, "Sheet1", 1, 2, 6, 2) # "=Sheet1!$C$2:$C$7"
chart_series_set_name_range(series, "Sheet1", 0, 2)       # "=Sheet1!$C$1"     

# Add a chart title and some axis labels.
chart_title_set_name(chart, "Results of sample analysis")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_X), "Test number")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_Y), "Sample length (mm)")

# Set an Excel chart style.
chart_set_style(chart, 11)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E2"), chart)


### Chart 2. Create a scatter chart with straight lines and markers connecting the points.

chart = workbook_add_chart(workbook, LXW_CHART_SCATTER_STRAIGHT_WITH_MARKERS)

# Add the first series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Set the name for the series instead of the default "Series 1".
chart_series_set_name(series, raw"=Sheet1!$B$1")

# Add the second series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Set the name for the series instead of the default "Series 2".
chart_series_set_name(series, raw"=Sheet1!$C$1")

# Add a chart title and some axis labels.
chart_title_set_name(chart, "Results of sample analysis")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_X), "Test number")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_Y), "Sample length (mm)")

# Set an Excel chart style.
chart_set_style(chart, 12)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E18"), chart)


### Chart 3. Create a scatter chart with straight lines connecting the points.

chart = workbook_add_chart(workbook, LXW_CHART_SCATTER_STRAIGHT)

# Add the first series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Set the name for the series instead of the default "Series 1".
chart_series_set_name(series, raw"=Sheet1!$B$1")

# Add the second series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Set the name for the series instead of the default "Series 2".
chart_series_set_name(series, raw"=Sheet1!$C$1")

# Add a chart title and some axis labels.
chart_title_set_name(chart, "Results of sample analysis")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_X), "Test number")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_Y), "Sample length (mm)")

# Set an Excel chart style.
chart_set_style(chart, 13)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E34"), chart)


### Chart 4. Create a scatter chart with smooth lines and markers connecting the points.

chart = workbook_add_chart(workbook, LXW_CHART_SCATTER_SMOOTH_WITH_MARKERS)

# Add the first series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Set the name for the series instead of the default "Series 1".
chart_series_set_name(series, raw"=Sheet1!$B$1")

# Add the second series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Set the name for the series instead of the default "Series 2".
chart_series_set_name(series, raw"=Sheet1!$C$1")

# Add a chart title and some axis labels.
chart_title_set_name(chart, "Results of sample analysis")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_X), "Test number")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_Y), "Sample length (mm)")

# Set an Excel chart style.
chart_set_style(chart, 14)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E50"), chart)


### Chart 5. Create a scatter chart with smooth lines connecting the points.

chart = workbook_add_chart(workbook, LXW_CHART_SCATTER_SMOOTH)

# Add the first series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Set the name for the series instead of the default "Series 1".
chart_series_set_name(series, raw"=Sheet1!$B$1")

# Add the second series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$C$2:$C$7")

# Set the name for the series instead of the default "Series 2".
chart_series_set_name(series, raw"=Sheet1!$C$1")

# Add a chart title and some axis labels.
chart_title_set_name(chart, "Results of sample analysis")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_X), "Test number")
chart_axis_set_name(chart_axis_get(chart, LXW_CHART_AXIS_TYPE_Y), "Sample length (mm)")

# Set an Excel chart style.
chart_set_style(chart, 15)

# Insert the chart into the worksheet.
worksheet_insert_chart(worksheet, CELL("E66"), chart)

workbook_close(workbook)
