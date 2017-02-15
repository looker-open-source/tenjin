view: daily_ad_revenue {
  sql_table_name: "883d44d664a54beb94e411f1a4e76004".daily_ad_revenue ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension_group: date {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: publisher_app_id {
    type: string
    # hidden: true
    sql: ${TABLE}.publisher_app_id ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, publisher_apps.id, publisher_apps.name]
  }
}
