view: schema_info {
  sql_table_name: tenjin.schema_info ;;

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
