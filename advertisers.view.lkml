view: advertisers {
  sql_table_name: "883d44d664a54beb94e411f1a4e76004".advertisers
    ;;

  dimension: advertiser_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: bundle_id {
    type: string
    sql: ${TABLE}.bundle_id ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  measure: count {
    type: count
    drill_fields: [advertiser_id]
  }
}
