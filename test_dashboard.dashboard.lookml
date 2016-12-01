- dashboard: test_dashboard
  title: Test Dashboard
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: add_a_unique_name_1480631276
    title: Untitled Visualization
    type: looker_line
    model: tenjin
    explore: events
    dimensions: [events.created_date]
    fill_fields: [events.created_date]
    measures: [events.count]
    filters:
      events.created_date: 7 days
    sorts: [events.created_date desc]
    limit: '500'
    column_limit: '50'
    query_timezone: America/Los_Angeles
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
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
    series_types: {}
