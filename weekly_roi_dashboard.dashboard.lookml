- dashboard: weekly_roi_dashboard
  title: Weekly ROI Dashboard
  layout: grid

  rows:
  - elements: [total_spend, total_revenue, total_installs, total_new_users]
    height: 175
  - elements: [weekly_kpi_overview, cumulative_rev_wk]
    height: 350
  - elements: [time_series, roi_table]
    height: 350
  - elements: [campaign]
    height: 100
  - elements: [weekly_revenue_campaign, weekly_spend_campaign]
    height: 350
  - elements: [campaign_metrics, campaign_roi]
    height: 350

  filters:

  - name: date
    title: 'Date Range'
    type: date_filter
    default_value: 2016/09/26 to 2016/12/12

  elements:
    - name: total_spend
      title: Total Spend
      type: single_value
      model: tenjin
      explore: daily_user_metrics
      measures: [daily_country_spend.total_spend]
      listen:
        date: daily_country_spend.daily_country_spend_date
      limit: '500'
      column_limit: '50'
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users
      series_types: {}

    - name: total_revenue
      title: Total Revenue
      type: single_value
      model: tenjin
      explore: daily_user_metrics
      measures: [daily_user_metrics.total_revenue, daily_country_spend.total_spend]
      dynamic_fields:
      - table_calculation: roi
        label: ROI
        expression: "(${daily_user_metrics.total_revenue} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_0
      listen:
        date: daily_country_spend.daily_country_spend_date
      limit: '500'
      column_limit: '50'
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: true
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users
      series_types: {}
      hidden_fields: [daily_country_spend.total_spend]

    - name: total_installs
      title: Total Installs
      type: single_value
      model: tenjin
      explore: daily_user_metrics
      measures: [daily_country_spend.total_installs]
      listen:
        date: daily_country_spend.daily_country_spend_date
      limit: '500'
      column_limit: '50'
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users
      series_types: {}

    - name: total_new_users
      title: Total New Users
      type: single_value
      model: tenjin
      explore: daily_user_metrics
      measures: [daily_country_spend.total_installs, daily_user_metrics.total_new_users]
      dynamic_fields:
      - table_calculation: conversion_from_installs
        label: Conversion from Installs
        expression: "${daily_user_metrics.total_new_users}/${daily_country_spend.total_installs}"
        value_format:
        value_format_name: percent_0
      listen:
        date: daily_country_spend.daily_country_spend_date
      limit: '500'
      column_limit: '50'
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: true
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users
      series_types: {}
      hidden_fields: [daily_country_spend.total_installs]

    - name: weekly_kpi_overview
      title: Weekly KPI Overview
      type: table
      model: tenjin
      explore: daily_user_metrics
      dimensions: [daily_country_spend.daily_country_spend_week]
      fill_fields: [daily_country_spend.daily_country_spend_week]
      measures: [daily_country_spend.total_spend, daily_country_spend.total_installs, daily_user_metrics.total_new_users,
        daily_country_spend.cost_per_install, daily_user_metrics.cost_per_new_user]
      listen:
        date: daily_country_spend.daily_country_spend_date
      sorts: [daily_country_spend.daily_country_spend_week]
      limit: '500'
      column_limit: '50'
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users

    - name: cumulative_rev_wk
      title: Cumulative Revenue by Acquired Week
      type: table
      model: tenjin
      explore: events
      dimensions: [events.acquired_week]
      fill_fields: [events.acquired_week]
      measures: [events.total_revenue_d01, events.total_revenue_d02, events.total_revenue_d03,
        events.total_revenue_d07, events.total_revenue_d14, events.total_revenue_d21,
        events.total_revenue_d28, events.total_revenue_d90]
      listen:
        date: events.acquired_date
      sorts: [events.acquired_week]
      limit: '500'
      column_limit: '50'
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: true
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
          font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF", "#4FBC89"]},
          bold: false, italic: false, strikethrough: false}]
      series_labels:
        events.total_revenue_d01: Revenue D1
        events.total_revenue_d02: Revenue D2
        events.total_revenue_d03: Revenue D3
        events.total_revenue_d07: Revenue D7
        events.total_revenue_d14: Revenue D14
        events.total_revenue_d21: Revenue D21
        events.total_revenue_d28: Revenue D28
        events.total_revenue_d90: Revenue D90

    - name: time_series
      title: Time Series
      type: looker_line
      model: tenjin
      explore: daily_user_metrics
      dimensions: [daily_country_spend.daily_country_spend_week]
      fill_fields: [daily_country_spend.daily_country_spend_week]
      measures: [daily_country_spend.total_spend, daily_country_spend.total_installs, daily_user_metrics.total_new_users]
      listen:
        date: daily_country_spend.daily_country_spend_date
      sorts: [daily_country_spend.daily_country_spend_week]
      limit: '500'
      column_limit: '50'
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users
      series_types:
        daily_country_spend.total_spend: area
      colors: ['palette: Mixed Dark']
      series_colors:
        daily_user_metrics.total_new_users: "#33a02c"
        daily_country_spend.total_spend: "#cbd9e1"

    - name: roi_table
      title: ROI
      type: table
      model: tenjin
      explore: daily_user_metrics
      dimensions: [daily_country_spend.daily_country_spend_week]
      fill_fields: [daily_country_spend.daily_country_spend_week]
      measures: [daily_country_spend.total_spend, daily_user_metrics.revenue_d01, daily_user_metrics.revenue_d02,
        daily_user_metrics.revenue_d03, daily_user_metrics.revenue_d07, daily_user_metrics.revenue_d14,
        daily_user_metrics.revenue_d21, daily_user_metrics.revenue_d28, daily_user_metrics.revenue_d90]
      dynamic_fields:
      - table_calculation: roi_d1
        label: ROI% D1
        expression: "(${daily_user_metrics.revenue_d01} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d2
        label: ROI% D2
        expression: "(${daily_user_metrics.revenue_d02} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d3
        label: ROI% D3
        expression: "(${daily_user_metrics.revenue_d03} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d7
        label: ROI% D7
        expression: "(${daily_user_metrics.revenue_d07} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d14
        label: ROI% D14
        expression: "(${daily_user_metrics.revenue_d14} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d21
        label: ROI% D21
        expression: "(${daily_user_metrics.revenue_d21} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d28
        label: ROI% D28
        expression: "(${daily_user_metrics.revenue_d28} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d90
        label: ROI% D90
        expression: "(${daily_user_metrics.revenue_d90} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      listen:
        date: daily_country_spend.daily_country_spend_date
      sorts: [daily_country_spend.daily_country_spend_week]
      limit: '500'
      column_limit: '50'
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: true
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
          font_color: !!null '', palette: {name: Red to White to Green, colors: ["#F36254",
              "#FFFFFF", "#4FBC89"]}, bold: false, italic: false, strikethrough: false}]
      hidden_fields: [daily_country_spend.total_spend, daily_user_metrics.revenue_d01, daily_user_metrics.revenue_d02,
        daily_user_metrics.revenue_d07, daily_user_metrics.revenue_d14, daily_user_metrics.revenue_d21,
        daily_user_metrics.revenue_d28, daily_user_metrics.revenue_d90, daily_user_metrics.revenue_d03]

    - name: campaign
      type: text
      title_text: 'ROI Metrics by Campaign'

    - name: weekly_revenue_campaign
      title: Weekly Revenue by Campaign (User Acquired Week)
      type: looker_line
      model: tenjin
      explore: daily_user_metrics
      dimensions: [daily_country_spend.daily_country_spend_week, daily_user_metrics.campaign_id]
      pivots: [daily_user_metrics.campaign_id]
      fill_fields: [daily_country_spend.daily_country_spend_week]
      measures: [daily_user_metrics.total_revenue]
      listen:
        date: daily_country_spend.daily_country_spend_date
      sorts: [daily_country_spend.daily_country_spend_week, daily_user_metrics.campaign_id]
      limit: '500'
      column_limit: '50'
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: right
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users
      series_types:
        daily_country_spend.total_spend: area
      colors: ['palette: Mixed Dark']
      series_colors:
        daily_user_metrics.total_new_users: "#33a02c"
        daily_country_spend.total_spend: "#cbd9e1"

    - name: weekly_spend_campaign
      title: Weekly Spend by Campaign
      type: looker_line
      model: tenjin
      explore: daily_user_metrics
      dimensions: [daily_country_spend.daily_country_spend_week, daily_user_metrics.campaign_id]
      pivots: [daily_user_metrics.campaign_id]
      fill_fields: [daily_country_spend.daily_country_spend_week]
      measures: [daily_country_spend.total_spend]
      listen:
        date: daily_country_spend.daily_country_spend_date
      sorts: [daily_user_metrics.campaign_id, daily_country_spend.daily_country_spend_week desc]
      limit: '500'
      column_limit: '50'
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: right
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users
      series_types:
        daily_country_spend.total_spend: area
      colors: ['palette: Mixed Dark']
      series_colors:
        daily_user_metrics.total_new_users: "#33a02c"
        daily_country_spend.total_spend: "#cbd9e1"

    - name: campaign_metrics
      title: Campaign Metrics
      type: table
      model: tenjin
      explore: daily_user_metrics
      dimensions: [daily_user_metrics.campaign_id]
      measures: [daily_country_spend.total_spend, daily_country_spend.total_installs, daily_user_metrics.total_new_users,
        daily_country_spend.cost_per_install, daily_user_metrics.cost_per_new_user]
      listen:
        date: daily_country_spend.daily_country_spend_date
      sorts: [daily_country_spend.total_spend desc]
      limit: '500'
      column_limit: '50'
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: right
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users
        __FILE: tenjin/weekly_roi_dashboard.dashboard.lookml
        __LINE_NUM: 454
      series_types: {}
      colors: ['palette: Mixed Dark']
      series_colors:
        daily_user_metrics.total_new_users: "#33a02c"
        daily_country_spend.total_spend: "#cbd9e1"
        __FILE: tenjin/weekly_roi_dashboard.dashboard.lookml
        __LINE_NUM: 461

    - name: campaign_roi
      title: Campaign ROI
      type: table
      model: tenjin
      explore: daily_user_metrics
      dimensions: [daily_user_metrics.campaign_id]
      measures: [daily_country_spend.total_spend, daily_user_metrics.revenue_d01, daily_user_metrics.revenue_d02,
        daily_user_metrics.revenue_d03, daily_user_metrics.revenue_d07, daily_user_metrics.revenue_d14,
        daily_user_metrics.revenue_d21, daily_user_metrics.revenue_d28, daily_user_metrics.revenue_d90]
      dynamic_fields:
      - table_calculation: roi_d1
        label: ROI% D1
        expression: "(${daily_user_metrics.revenue_d01} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d2
        label: ROI% D2
        expression: "(${daily_user_metrics.revenue_d02} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d3
        label: ROI% D3
        expression: "(${daily_user_metrics.revenue_d03} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d7
        label: ROI% D7
        expression: "(${daily_user_metrics.revenue_d07} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d14
        label: ROI% D14
        expression: "(${daily_user_metrics.revenue_d14} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d21
        label: ROI% D21
        expression: "(${daily_user_metrics.revenue_d21} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d28
        label: ROI% D28
        expression: "(${daily_user_metrics.revenue_d28} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      - table_calculation: roi_d90
        label: ROI% D90
        expression: "(${daily_user_metrics.revenue_d90} - ${daily_country_spend.total_spend})/${daily_country_spend.total_spend}"
        value_format:
        value_format_name: percent_1
      listen:
        date: daily_country_spend.daily_country_spend_date
      sorts: [daily_country_spend.total_spend desc]
      limit: '500'
      column_limit: '50'
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: true
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: right
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      series_labels:
        daily_country_spend.total_installs: Installs
        daily_country_spend.total_spend: Spend
        daily_user_metrics.total_new_users: New Users
        __FILE: tenjin/weekly_roi_dashboard.dashboard.lookml
        __LINE_NUM: 562
      series_types:
        __FILE: tenjin/weekly_roi_dashboard.dashboard.lookml
        __LINE_NUM: 567
      colors: ['palette: Mixed Dark']
      series_colors:
        daily_user_metrics.total_new_users: "#33a02c"
        daily_country_spend.total_spend: "#cbd9e1"
        __FILE: tenjin/weekly_roi_dashboard.dashboard.lookml
        __LINE_NUM: 570
      hidden_fields: [daily_country_spend.total_spend, daily_user_metrics.revenue_d01, daily_user_metrics.revenue_d02,
        daily_user_metrics.revenue_d03, daily_user_metrics.revenue_d07, daily_user_metrics.revenue_d14,
        daily_user_metrics.revenue_d21, daily_user_metrics.revenue_d28, daily_user_metrics.revenue_d90]
      conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
          font_color: !!null '', palette: {name: Red to White to Green, colors: ["#F36254",
              "#FFFFFF", "#4FBC89"]}, bold: false, italic: false, strikethrough: false}]
