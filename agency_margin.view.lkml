view: agency_margin {
  sql_table_name: "883d44d664a54beb94e411f1a4e76004".agency_margin
    ;;

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: agency_margin {
    type: number
    sql: ${TABLE}.agency_margin ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
