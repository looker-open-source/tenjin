view: updated_at {
  sql_table_name: e9c99ee016bbd36d3081045bb02d600a.updated_at ;;

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
