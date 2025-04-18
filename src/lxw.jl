lxw_button_options(; caption="", _macro="", description="", width=LXW_DEF_COL_WIDTH_PIXELS, height=LXW_DEF_ROW_HEIGHT_PIXELS, x_scale=1.0, y_scale=1.0, x_offset=0, y_offset=0) =
   Ref(lxw_button_options(Cs(caption), Cs(_macro), Cs(description), width, height, x_scale, y_scale, x_offset, y_offset))

function lxw_chart_data_label(; value="", hide=0x0, font=C_NULL, line=C_NULL, fill=C_NULL, pattern=C_NULL)
   Ref(lxw_chart_data_label(
      Cs(value),
      hide,
      Base.unsafe_convert(Ptr{lxw_chart_font}, font),
      Base.unsafe_convert(Ptr{lxw_chart_line}, line),
      Base.unsafe_convert(Ptr{lxw_chart_fill}, fill),
      Base.unsafe_convert(Ptr{lxw_chart_pattern}, pattern)
   ))
end

lxw_chart_fill(; color=0x0, none=0x0, transparency=0x0) = Ref(lxw_chart_fill(color, none, transparency))

lxw_chart_font(; name="Arial", size=11.0, bold=0x0, italic=0x0, underline=0x0, rotation=0, color=LXW_COLOR_BLACK, pitch_family=0x0, charset=0x0, baseline=0) =
   Ref(lxw_chart_font(Cs(name), size, bold, italic, underline, rotation, color, pitch_family, charset, baseline))

lxw_chart_line(; color=0x0, none=0x0, width=0.0, dash_type=0x0, transparency=0x0) = Ref(lxw_chart_line(color, none, width, dash_type, transparency))

lxw_chart_options(; x_offset=0, y_offset=0, x_scale=1.0, y_scale=1.0, object_position=0x0, description="", decorative=0x0) =
   Ref(lxw_chart_options(x_offset, y_offset, x_scale, y_scale, object_position, Cs(description), decorative))

lxw_chart_pattern(; fg_color=0x0, bg_color=0x0, type=LXW_PATTERN_NONE) = Ref(lxw_chart_pattern(fg_color, bg_color, type))

function lxw_chart_point(; line=C_NULL, fill=C_NULL, pattern=C_NULL)
   Ref(lxw_chart_point(
      Base.unsafe_convert(Ptr{lxw_chart_line}, line),
      Base.unsafe_convert(Ptr{lxw_chart_fill}, fill),
      Base.unsafe_convert(Ptr{lxw_chart_pattern}, pattern)
   ))
end

lxw_comment_options(; visible=0x0, author="", width=0, height=0, x_scale=1.0, y_scale=1.0, color=LXW_COLOR_UNSET, font_name="", font_size=8, font_family=0x2, start_row=0x0, start_col=0x0, x_offset=15, y_offset=10) =
   Ref(lxw_comment_options(visible, Cs(author), width, height, x_scale, y_scale, color, Cs(font_name), font_size, font_family, start_row, start_col, x_offset, y_offset))

lxw_data_validation(; validate=0x0, criteria=0x0, ignore_blank=0x0, show_input=0x0, show_error=0x0, error_type=0x0, dropdown=0x0, value_number=0.0, value_formula="",
   value_list=String[], value_datetime=lxw_datetime(), minimum_number=0.0, minimum_formula="", minimum_datetime=lxw_datetime(), maximum_number=0.0,
   maximum_formula="", maximum_datetime=lxw_datetime(), input_title="", input_message="", error_title="", error_message="") =
   Ref(lxw_data_validation(validate, criteria, ignore_blank, show_input, show_error, error_type, dropdown, value_number, Cs_(value_formula),
   Cs(value_list),
   value_datetime.x, minimum_number, Cs_(minimum_formula), minimum_datetime.x, maximum_number,
   Cs_(maximum_formula), maximum_datetime.x, Cs_(input_title), Cs_(input_message), Cs_(error_title), Cs_(error_message)))

lxw_datetime(; year=0, month=0, day=0, hour=0, min=0, sec=0) = Ref(lxw_datetime(year, month, day, hour, min, sec))

lxw_doc_properties(; title="", subject="", author="", manager="", company="", category="", keywords="", comments="", status="", hyperlink_base="", created=0) =
   Ref(lxw_doc_properties(Cs(title), Cs(subject), Cs(author), Cs(manager), Cs(company), Cs(category), Cs(keywords), Cs(comments), Cs(status), Cs(hyperlink_base), created))

lxw_filter_rule(; criteria=0x0, value_string="", value=0.0) = Ref(lxw_filter_rule(criteria, Cs(value_string), value))

lxw_header_footer_options(; margin=0.0, image_left="", image_center="", image_right="") =
   Ref(lxw_header_footer_options(margin, Cs(image_left), Cs(image_center), Cs(image_right)))

function lxw_image_options(; x_offset=0, y_offset=0, x_scale=1.0, y_scale=1.0, object_position=0x0, description="", decorative=0x0, url="", tip="", cell_format=C_NULL)
   Ref(lxw_image_options(Int32(x_offset), Int32(y_offset), Float64(x_scale), Float64(y_scale), object_position, Cs_(description), decorative, Cs_(url), Cs_(tip),
   Base.unsafe_convert(Ptr{lxw_format}, cell_format)
   ))
end

lxw_rich_string_tuple(; format=C_NULL, string="") =
   Ref(lxw_rich_string_tuple(Base.unsafe_convert(Ptr{lxw_format}, format), Cs(string)))

lxw_row_col_options(; hidden=0x0, level=0x0, collapsed=0x0) = Ref(lxw_row_col_options(hidden, level, collapsed))
