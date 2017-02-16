- dashboard: events_overview
  title: Events Overview
  layout: grid

  rows:
  - elements: [distinct_users, paying_users, total_revenue,avg_rev_payer]
    height: 175
  - elements: [dau_and_rev]
    height: 300
  - elements: [monthly]
    height: 100
  - elements: [mau_pay, mau_platform]
    height: 300

  filters:

  - name: date
    title: 'Date Range'
    type: date_filter
    default_value: 30 days

  - name: bundle_id
    type: field_filter
    model: tenjin
    explore: events
    field: events.bundle_id

  - name: platform
    type: field_filter
    model: tenjin
    explore: events
    field: events.platform

  elements:
    - name: distinct_users
      title: Distinct Users
      type: single_value
      model: tenjin
      explore: events
      measures: [events.distinct_users]
      listen:
        date: events.created_date
        platform: events.platform
        bundle_id: events.bundle_id
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}

    - name: paying_users
      title: Paying Users
      type: single_value
      model: tenjin
      explore: events
      measures: [events.payers, events.distinct_users]
      listen:
        date: events.created_date
        platform: events.platform
        bundle_id: events.bundle_id
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      single_value_title: Paying Users
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      single_value_title: ''
      comparison_label: Active Users


    - name: total_revenue
      title: Total Revenue
      type: single_value
      model: tenjin
      explore: events
      measures: [events.total_revenue]
      listen:
        date: events.created_date
        platform: events.platform
        bundle_id: events.bundle_id
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      single_value_title: ''
      comparison_label: Active Users

    - name: avg_rev_payer
      title: Average Revenue per Payer
      type: single_value
      model: tenjin
      explore: events
      measures: [events.revenue_per_payer]
      listen:
        date: events.created_date
        platform: events.platform
        bundle_id: events.bundle_id
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      single_value_title: ''
      comparison_label: Active Users

    - name: dau_and_rev
      title: Daily Active Users and Revenue
      type: looker_line
      model: tenjin
      explore: events
      dimensions: [events.created_date]
      fill_fields: [events.created_date]
      measures: [events.total_revenue, events.distinct_users]
      listen:
        date: events.created_date
        platform: events.platform
        bundle_id: events.bundle_id
      sorts: [events.created_date desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: right
      x_axis_gridlines: true
      y_axis_gridlines: true
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: ordinal
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: circle_outline
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types:
        events.distinct_users: column
      y_axis_orientation: [left, right]
      colors: ['palette: Mixed Dark']
      series_colors:
        events.total_revenue: "#112633"
        events.distinct_users: "#9ec1de"
      hide_legend: true
      focus_on_hover: false

    - name: mau_platform
      title: Monthly Active Users by Platform
      type: looker_column
      model: tenjin
      explore: events
      dimensions: [events.created_month, events.platform]
      pivots: [events.platform]
      fill_fields: [events.created_month]
      measures: [events.distinct_users]
      filters:
        events.created_date: 12 months
      listen:
        platform: events.platform
        bundle_id: events.bundle_id
      sorts: [events.created_month, events.platform 0]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: normal
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      series_types: {}
      single_value_title: ''
      comparison_label: Active Users
      colors: ['palette: Mixed Dark']
      series_colors: {}
      column_group_spacing_ratio: ''

    - name: mau_pay
      title: Monthy Active Users and Payers
      type: looker_line
      model: tenjin
      explore: events
      dimensions: [events.created_month]
      fill_fields: [events.created_month]
      measures: [events.distinct_users, events.payers]
      filters:
        events.created_date: 12 months
      listen:
        platform: events.platform
        bundle_id: events.bundle_id
      sorts: [events.created_month]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      series_types: {}
      single_value_title: ''
      comparison_label: Active Users
      colors: ['palette: Mixed Dark']
      series_colors: {}
      column_group_spacing_ratio: ''
      series_labels:
        events.distinct_users: Monthly Active Users

    - name: monthly
      type: text
      title_text: 'Monthly Review'
      subtitle_text: 'Past 12 Months'
