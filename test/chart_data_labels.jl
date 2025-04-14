#=
https://github.com/jmcnamara/libxlsxwriter/blob/main/examples/chart_data_labels.c
/*
 * A demo of an various Excel chart data label features that are available via
 * a libxlsxwriter chart.
 *
 * Copyright 2014-2025, John McNamara, jmcnamara@cpan.org
 *
 */
=#

using LibXLSXWriter: workbook_new, workbook_add_worksheet, workbook_add_format, format_set_bold, lxw_chart_options, worksheet_write_string, worksheet_write_number, workbook_add_chart, LXW_CHART_COLUMN, chart_title_set_name, chart_add_series, chart_series_set_labels, chart_legend_set_position, LXW_CHART_LEGEND_NONE, worksheet_insert_chart_opt, CELL, chart_series_set_labels_options, LXW_FALSE, LXW_TRUE, lxw_chart_font, LXW_COLOR_RED, chart_series_set_labels_font, LXW_COLOR_YELLOW, lxw_chart_line, lxw_chart_fill, chart_series_set_labels_line, chart_series_set_labels_fill, lxw_chart_data_label, chart_series_set_labels_custom, LXW_COLOR_BLUE, LXW_COLOR_GREEN, workbook_close

## Create a worksheet with examples charts.

workbook = workbook_new("chart_data_labels.xlsx")
worksheet = workbook_add_worksheet(workbook, C_NULL)

# Add a bold format to use to highlight the header cells.
bold = workbook_add_format(workbook)
format_set_bold(bold)

# Some chart positioning options.
options = lxw_chart_options(x_offset = 25, y_offset = 10)

# Write some data for the chart.
worksheet_write_string(worksheet, 0, 0, "Number",  bold)
worksheet_write_number(worksheet, 1, 0, 2,         C_NULL)
worksheet_write_number(worksheet, 2, 0, 3,         C_NULL)
worksheet_write_number(worksheet, 3, 0, 4,         C_NULL)
worksheet_write_number(worksheet, 4, 0, 5,         C_NULL)
worksheet_write_number(worksheet, 5, 0, 6,         C_NULL)
worksheet_write_number(worksheet, 6, 0, 7,         C_NULL)

worksheet_write_string(worksheet, 0, 1, "Data",    bold)
worksheet_write_number(worksheet, 1, 1, 20,        C_NULL)
worksheet_write_number(worksheet, 2, 1, 10,        C_NULL)
worksheet_write_number(worksheet, 3, 1, 20,        C_NULL)
worksheet_write_number(worksheet, 4, 1, 30,        C_NULL)
worksheet_write_number(worksheet, 5, 1, 40,        C_NULL)
worksheet_write_number(worksheet, 6, 1, 30,        C_NULL)

worksheet_write_string(worksheet, 0, 2, "Text",    bold)
worksheet_write_string(worksheet, 1, 2, "Jan",     C_NULL)
worksheet_write_string(worksheet, 2, 2, "Feb",     C_NULL)
worksheet_write_string(worksheet, 3, 2, "Mar",     C_NULL)
worksheet_write_string(worksheet, 4, 2, "Apr",     C_NULL)
worksheet_write_string(worksheet, 5, 2, "May",     C_NULL)
worksheet_write_string(worksheet, 6, 2, "Jun",     C_NULL)


## Chart 1. Example with standard data labels.
chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Add a chart title.
chart_title_set_name(chart, "Chart with standard data labels")

# Add a data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Add the series data labels.
chart_series_set_labels(series)

# Turn off the legend.
chart_legend_set_position(chart, LXW_CHART_LEGEND_NONE)

# Insert the chart into the worksheet.
worksheet_insert_chart_opt(worksheet, CELL("D2"), chart, options)


## Chart 2. Example with value and category data labels.

chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Add a chart title.
chart_title_set_name(chart, "Category and Value data labels")

# Add a data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Add the series data labels.
chart_series_set_labels(series)

# Turn on Value and Category labels.
chart_series_set_labels_options(series, LXW_FALSE, LXW_TRUE, LXW_TRUE)

# Turn off the legend.
chart_legend_set_position(chart, LXW_CHART_LEGEND_NONE)

# Insert the chart into the worksheet.
worksheet_insert_chart_opt(worksheet, CELL("D18"), chart, options)


## Chart 3. Example with standard data labels with different font.
chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Add a chart title.
chart_title_set_name(chart, "Data labels with user defined font")

# Add a data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Add the series data labels.
chart_series_set_labels(series)

font1 = lxw_chart_font(bold = LXW_TRUE, color = LXW_COLOR_RED, rotation = -30)
chart_series_set_labels_font(series, font1)

# Turn off the legend.
chart_legend_set_position(chart, LXW_CHART_LEGEND_NONE)

# Insert the chart into the worksheet.
worksheet_insert_chart_opt(worksheet, CELL("D34"), chart, options)


## Chart 4. Example with standard data labels and formatting.
chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Add a chart title.
chart_title_set_name(chart, "Data labels with formatting")

# Add a data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Add the series data labels.
chart_series_set_labels(series)

# Set the border/line and fill for the data labels.
line1 = lxw_chart_line(color = LXW_COLOR_RED)
fill1 = lxw_chart_fill(color = LXW_COLOR_YELLOW)

chart_series_set_labels_line(series, line1)
chart_series_set_labels_fill(series, fill1)

# Turn off the legend.
chart_legend_set_position(chart, LXW_CHART_LEGEND_NONE)

# Insert the chart into the worksheet.
worksheet_insert_chart_opt(worksheet, CELL("D50"), chart, options)


## Chart 5.Example with custom string data labels.
chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Add a chart title.
chart_title_set_name(chart, "Chart with custom string data labels")

# Add a data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Add the series data labels.
chart_series_set_labels(series)

# Create some custom labels.
data_label5_1 = lxw_chart_data_label(value = "Amy")
data_label5_2 = lxw_chart_data_label(value = "Bea")
data_label5_3 = lxw_chart_data_label(value = "Eva")
data_label5_4 = lxw_chart_data_label(value = "Fay")
data_label5_5 = lxw_chart_data_label(value = "Liv")
data_label5_6 = lxw_chart_data_label(value = "Una")

# Create an array of label pointers. C_NULL indicates the end of the array.
data_labels5 = [
    data_label5_1,
    data_label5_2,
    data_label5_3,
    data_label5_4,
    data_label5_5,
    data_label5_6
]

# Set the custom labels.
chart_series_set_labels_custom(series, data_labels5)

# Turn off the legend.
chart_legend_set_position(chart, LXW_CHART_LEGEND_NONE)

# Insert the chart into the worksheet.
worksheet_insert_chart_opt(worksheet, CELL("D66"), chart, options)


## Chart 6. Example with custom data labels from cells.
chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Add a chart title.
chart_title_set_name(chart, "Chart with custom data labels from cells")

# Add a data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Add the series data labels.
chart_series_set_labels(series)

# Create some custom labels.
data_label6_1 = lxw_chart_data_label(value = raw"=Sheet1!$C$2")
data_label6_2 = lxw_chart_data_label(value = raw"=Sheet1!$C$3")
data_label6_3 = lxw_chart_data_label(value = raw"=Sheet1!$C$4")
data_label6_4 = lxw_chart_data_label(value = raw"=Sheet1!$C$5")
data_label6_5 = lxw_chart_data_label(value = raw"=Sheet1!$C$6")
data_label6_6 = lxw_chart_data_label(value = raw"=Sheet1!$C$7")

# Create an array of label pointers. C_NULL indicates the end of the array.
data_labels6 = [
    data_label6_1,
    data_label6_2,
    data_label6_3,
    data_label6_4,
    data_label6_5,
    data_label6_6
]

# Set the custom labels.
chart_series_set_labels_custom(series, data_labels6)

# Turn off the legend.
chart_legend_set_position(chart, LXW_CHART_LEGEND_NONE)

# Insert the chart into the worksheet.
worksheet_insert_chart_opt(worksheet, CELL("D82"), chart, options)


## Chart 7. Example with custom and default data labels.
chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Add a chart title.
chart_title_set_name(chart, "Mixed custom and default data labels")

# Add a data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

font2 = lxw_chart_font(color = LXW_COLOR_RED)

# Add the series data labels.
chart_series_set_labels(series)

# Create some custom labels.

# The following is used to get a mix of default and custom labels. The
# items initialized with '{0}' and items without a custom label (points 5
# and 6 which come after C_NULL) will get the default value. We also set a
# font for the custom items as an extra example.

data_label7_1 = lxw_chart_data_label(value = raw"=Sheet1!$C$2", font = font2)
data_label7_2 = lxw_chart_data_label()
data_label7_3 = lxw_chart_data_label(value = raw"=Sheet1!$C$4", font = font2)
data_label7_4 = lxw_chart_data_label(value = raw"=Sheet1!$C$5", font = font2)

# Create an array of label pointers. C_NULL indicates the end of the array.
data_labels7 = [
    data_label7_1,
    data_label7_2,
    data_label7_3,
    data_label7_4
]

# Set the custom labels.
chart_series_set_labels_custom(series, data_labels7)

# Turn off the legend.
chart_legend_set_position(chart, LXW_CHART_LEGEND_NONE)

# Insert the chart into the worksheet.
worksheet_insert_chart_opt(worksheet, CELL("D98"), chart, options)


## Chart 8. Example with deleted/hidden custom data labels.
chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Add a chart title.
chart_title_set_name(chart, "Chart with deleted data labels")

# Add a data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Add the series data labels.
chart_series_set_labels(series)

# Create some custom labels.
hide = lxw_chart_data_label(hide = LXW_TRUE)
keep = lxw_chart_data_label(hide = LXW_FALSE)

# An initialized struct like this would also work:
# lxw_chart_data_label keep = {0}

# Create an array of label pointers. C_NULL indicates the end of the array.
data_labels8 = [
    hide,
    keep,
    hide,
    hide,
    keep,
    hide
]

# Set the custom labels.
chart_series_set_labels_custom(series, data_labels8)

# Turn off the legend.
chart_legend_set_position(chart, LXW_CHART_LEGEND_NONE)

# Insert the chart into the worksheet.
worksheet_insert_chart_opt(worksheet, CELL("D114"), chart, options)


## Chart 9.Example with custom string data labels and formatting.
chart = workbook_add_chart(workbook, LXW_CHART_COLUMN)

# Add a chart title.
chart_title_set_name(chart, "Chart with custom labels and formatting")

# Add a data series to the chart.
series = chart_add_series(chart, raw"=Sheet1!$A$2:$A$7", raw"=Sheet1!$B$2:$B$7")

# Add the series data labels.
chart_series_set_labels(series)

# Set the border/line and fill for the data labels.
line2 = lxw_chart_line(color = LXW_COLOR_RED)
fill2 = lxw_chart_fill(color = LXW_COLOR_YELLOW)
line3 = lxw_chart_line(color = LXW_COLOR_BLUE)
fill3 = lxw_chart_fill(color = LXW_COLOR_GREEN)

# Create some custom labels.
data_label9_1 = lxw_chart_data_label(value = "Amy", line = line3)
data_label9_2 = lxw_chart_data_label(value = "Bea")
data_label9_3 = lxw_chart_data_label(value = "Eva")
data_label9_4 = lxw_chart_data_label(value = "Fay")
data_label9_5 = lxw_chart_data_label(value = "Liv")
data_label9_6 = lxw_chart_data_label(value = "Una", fill = fill3)

# Set the default formatting for the data labels in the series.
chart_series_set_labels_line(series, line2)
chart_series_set_labels_fill(series, fill2)

# Create an array of label pointers. C_NULL indicates the end of the array.
data_labels9 = [
    data_label9_1,
    data_label9_2,
    data_label9_3,
    data_label9_4,
    data_label9_5,
    data_label9_6
]

# Set the custom labels.
chart_series_set_labels_custom(series, data_labels9)

# Turn off the legend.
chart_legend_set_position(chart, LXW_CHART_LEGEND_NONE)

# Insert the chart into the worksheet.
worksheet_insert_chart_opt(worksheet, CELL("D130"), chart, options)

workbook_close(workbook)
