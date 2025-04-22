lxw_button_options(;
    caption = "",
    _macro = "",
    description = "",
    width = LXW_DEF_COL_WIDTH_PIXELS,
    height = LXW_DEF_ROW_HEIGHT_PIXELS,
    x_scale = 1.0,
    y_scale = 1.0,
    x_offset = 0,
    y_offset = 0,
) = Ref(
    lxw_button_options(
        Cs(caption),
        Cs(_macro),
        Cs(description),
        width,
        height,
        x_scale,
        y_scale,
        x_offset,
        y_offset,
    ),
)

lxw_chart_data_label(;
    value = "",
    hide = 0x0,
    font = C_NULL,
    line = C_NULL,
    fill = C_NULL,
    pattern = C_NULL,
) = Ref(
    lxw_chart_data_label(
        Cs(value),
        hide,
        Base.unsafe_convert(Ptr{lxw_chart_font}, font),
        Base.unsafe_convert(Ptr{lxw_chart_line}, line),
        Base.unsafe_convert(Ptr{lxw_chart_fill}, fill),
        Base.unsafe_convert(Ptr{lxw_chart_pattern}, pattern),
    ),
)

lxw_chart_fill(; color = 0x0, none = 0x0, transparency = 0x0) =
    Ref(lxw_chart_fill(color, none, transparency))

lxw_chart_font(;
    name = "Arial",
    size = 11.0,
    bold = 0x0,
    italic = 0x0,
    underline = 0x0,
    rotation = 0,
    color = LXW_COLOR_BLACK,
    pitch_family = 0x0,
    charset = 0x0,
    baseline = 0,
) = Ref(
    lxw_chart_font(
        Cs(name),
        size,
        bold,
        italic,
        underline,
        rotation,
        color,
        pitch_family,
        charset,
        baseline,
    ),
)

lxw_chart_line(;
    color = 0x0,
    none = 0x0,
    width = 0.0,
    dash_type = 0x0,
    transparency = 0x0,
) = Ref(lxw_chart_line(color, none, width, dash_type, transparency))

lxw_chart_options(;
    x_offset = 0,
    y_offset = 0,
    x_scale = 1.0,
    y_scale = 1.0,
    object_position = 0x0,
    description = "",
    decorative = 0x0,
) = Ref(
    lxw_chart_options(
        x_offset,
        y_offset,
        x_scale,
        y_scale,
        object_position,
        Cs(description),
        decorative,
    ),
)

lxw_chart_pattern(; fg_color = 0x0, bg_color = 0x0, type = LXW_PATTERN_NONE) =
    Ref(lxw_chart_pattern(fg_color, bg_color, type))

lxw_chart_point(; line = C_NULL, fill = C_NULL, pattern = C_NULL) = Ref(
    lxw_chart_point(
        Base.unsafe_convert(Ptr{lxw_chart_line}, line),
        Base.unsafe_convert(Ptr{lxw_chart_fill}, fill),
        Base.unsafe_convert(Ptr{lxw_chart_pattern}, pattern),
    ),
)

lxw_comment_options(;
    visible = 0x0,
    author = C_NULL,
    width = 0,
    height = 0,
    x_scale = 1.0,
    y_scale = 1.0,
    color = LXW_COLOR_UNSET,
    font_name = C_NULL,
    font_size = 8,
    font_family = 0x2,
    start_row = 0x0,
    start_col = 0x0,
    x_offset = 15,
    y_offset = 10,
) = Ref(
    lxw_comment_options(
        visible,
        Cs(author),
        width,
        height,
        x_scale,
        y_scale,
        color,
        Cs(font_name),
        font_size,
        font_family,
        start_row,
        start_col,
        x_offset,
        y_offset,
    ),
)

lxw_conditional_format(;
    type = LXW_CONDITIONAL_TYPE_CELL,
    criteria = LXW_CONDITIONAL_CRITERIA_GREATER_THAN,
    value = 0.0,
    value_string = C_NULL,
    format = C_NULL,
    min_value = 0.0,
    min_value_string = C_NULL,
    min_rule_type = 0x0,
    min_color = LXW_COLOR_BLACK,
    mid_value = 0.0,
    mid_value_string = C_NULL,
    mid_rule_type = 0x0,
    mid_color = LXW_COLOR_BLACK,
    max_value = 0.0,
    max_value_string = C_NULL,
    max_rule_type = 0x0,
    max_color = LXW_COLOR_BLACK,
    bar_color = LXW_COLOR_BLACK,
    bar_only = 0x0,
    data_bar_2010 = 0x0,
    bar_solid = 0x0,
    bar_negative_color = LXW_COLOR_BLACK,
    bar_border_color = LXW_COLOR_BLACK,
    bar_negative_border_color = LXW_COLOR_BLACK,
    bar_negative_color_same = 0x0,
    bar_negative_border_color_same = 0x0,
    bar_no_border = 0x0,
    bar_direction = 0x0,
    bar_axis_position = 0x0,
    bar_axis_color = LXW_COLOR_BLACK,
    icon_style = 0x0,
    reverse_icons = 0x0,
    icons_only = 0x0,
    multi_range = C_NULL,
    stop_if_true = 0x0,
) = Ref(
    lxw_conditional_format(
        type,
        criteria,
        value,
        value_string,
        Base.unsafe_convert(Ptr{lxw_format}, format),
        min_value,
        min_value_string,
        min_rule_type,
        min_color,
        mid_value,
        mid_value_string,
        mid_rule_type,
        mid_color,
        max_value,
        max_value_string,
        max_rule_type,
        max_color,
        bar_color,
        bar_only,
        data_bar_2010,
        bar_solid,
        bar_negative_color,
        bar_border_color,
        bar_negative_border_color,
        bar_negative_color_same,
        bar_negative_border_color_same,
        bar_no_border,
        bar_direction,
        bar_axis_position,
        bar_axis_color,
        icon_style,
        reverse_icons,
        icons_only,
        multi_range,
        stop_if_true,
    ),
)

lxw_data_validation(;
    validate = 0x0,
    criteria = 0x0,
    ignore_blank = 0x0,
    show_input = 0x0,
    show_error = 0x0,
    error_type = 0x0,
    dropdown = 0x0,
    value_number = 0.0,
    value_formula = "",
    value_list = String[],
    value_datetime = lxw_datetime(),
    minimum_number = 0.0,
    minimum_formula = "",
    minimum_datetime = lxw_datetime(),
    maximum_number = 0.0,
    maximum_formula = "",
    maximum_datetime = lxw_datetime(),
    input_title = "",
    input_message = "",
    error_title = "",
    error_message = "",
) = Ref(
    lxw_data_validation(
        validate,
        criteria,
        ignore_blank,
        show_input,
        show_error,
        error_type,
        dropdown,
        value_number,
        Cs(value_formula),
        Cs(value_list),
        value_datetime.x,
        minimum_number,
        Cs(minimum_formula),
        minimum_datetime.x,
        maximum_number,
        Cs(maximum_formula),
        maximum_datetime.x,
        Cs(input_title),
        Cs(input_message),
        Cs(error_title),
        Cs(error_message),
    ),
)

lxw_datetime(; year = 0, month = 0, day = 0, hour = 0, min = 0, sec = 0) =
    Ref(lxw_datetime(year, month, day, hour, min, sec))

lxw_doc_properties(;
    title = C_NULL,
    subject = C_NULL,
    author = C_NULL,
    manager = C_NULL,
    company = C_NULL,
    category = C_NULL,
    keywords = C_NULL,
    comments = C_NULL,
    status = C_NULL,
    hyperlink_base = C_NULL,
    created = 0,
) = Ref(
    lxw_doc_properties(
        Cs(title),
        Cs(subject),
        Cs(author),
        Cs(manager),
        Cs(company),
        Cs(category),
        Cs(keywords),
        Cs(comments),
        Cs(status),
        Cs(hyperlink_base),
        created,
    ),
)

lxw_filter_rule(; criteria = 0x0, value_string = C_NULL, value = 0.0) =
    Ref(lxw_filter_rule(criteria, Cs(value_string), value))

lxw_header_footer_options(;
    margin = 0.0,
    image_left = C_NULL,
    image_center = C_NULL,
    image_right = C_NULL,
) = Ref(
    lxw_header_footer_options(margin, Cs(image_left), Cs(image_center), Cs(image_right)),
)

lxw_image_options(;
    x_offset = 0,
    y_offset = 0,
    x_scale = 1.0,
    y_scale = 1.0,
    object_position = 0x0,
    description = "",
    decorative = 0x0,
    url = "",
    tip = "",
    cell_format = C_NULL,
) = Ref(
    lxw_image_options(
        Int32(x_offset),
        Int32(y_offset),
        Float64(x_scale),
        Float64(y_scale),
        object_position,
        Cs(description),
        decorative,
        Cs(url),
        Cs(tip),
        Base.unsafe_convert(Ptr{lxw_format}, cell_format),
    ),
)

lxw_rich_string_tuple(; format = C_NULL, string = C_NULL) =
    Ref(lxw_rich_string_tuple(Base.unsafe_convert(Ptr{lxw_format}, format), Cs(string)))

lxw_row_col_options(; hidden = 0x0, level = 0x0, collapsed = 0x0) =
    Ref(lxw_row_col_options(hidden, level, collapsed))

lxw_table_column(;
    header = C_NULL,
    formula = C_NULL,
    total_string = C_NULL,
    total_function = false,
    header_format = C_NULL,
    format = C_NULL,
    total_value = 0.0,
) = Ref(
    lxw_table_column(
        Cs(header),
        Cs(formula),
        Cs(total_string),
        total_function,
        Base.unsafe_convert(Ptr{lxw_format}, header_format),
        Base.unsafe_convert(Ptr{lxw_format}, format),
        total_value,
    ),
)

lxw_table_options(;
    name = C_NULL,
    no_header_row = false,
    no_autofilter = false,
    no_banded_rows = false,
    banded_columns = false,
    first_column = false,
    last_column = false,
    style_type = LXW_TABLE_STYLE_TYPE_MEDIUM,
    style_type_number = 9,
    total_row = false,
    columns = C_NULL,
) = Ref(
    lxw_table_options(
        Cs(name),
        no_header_row,
        no_autofilter,
        no_banded_rows,
        banded_columns,
        first_column,
        last_column,
        style_type,
        style_type_number,
        total_row,
        Base.unsafe_convert(Ptr{Ptr{lxw_table_column}}, columns),
    ),
)

lxw_workbook_options(;
    constant_memory = LXW_FALSE,
    tmpdir = C_NULL,
    use_zip64 = LXW_FALSE,
    output_buffer = C_NULL,
    output_buffer_size = C_NULL,
) = Ref(
    lxw_workbook_options(
        constant_memory,
        Cs(tmpdir),
        use_zip64,
        Base.unsafe_convert(Ptr{Ptr{Cchar}}, output_buffer),
        Base.unsafe_convert(Ptr{Csize_t}, output_buffer_size),
    ),
)
