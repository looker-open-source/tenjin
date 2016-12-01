view: schema_info {
  sql_table_name: e9c99ee016bbd36d3081045bb02d600a.schema_info ;;

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
