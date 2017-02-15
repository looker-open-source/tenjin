view: updated_at {
  sql_table_name: "883d44d664a54beb94e411f1a4e76004".updated_at ;;

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
