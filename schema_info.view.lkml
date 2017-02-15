view: schema_info {
  sql_table_name: "883d44d664a54beb94e411f1a4e76004".schema_info ;;

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
