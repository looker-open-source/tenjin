view: schema_info {
  sql_table_name: "467b3f825dfd2fbc67cb350cd0fea7d3".schema_info ;;

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
