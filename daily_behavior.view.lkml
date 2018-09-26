view: daily_behavior {
  sql_table_name: "467b3f825dfd2fbc67cb350cd0fea7d3".daily_behavior ;;

  dimension: campaign_id {
    type: string
    # hidden: true
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: daily_behavior {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: monthly_users {
    type: number
    sql: ${TABLE}.monthly_users ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}.site_id ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: weekly_users {
    type: number
    sql: ${TABLE}.weekly_users ;;
  }

  measure: count {
    type: count
    drill_fields: [campaigns.name, campaigns.remote_campaign_id]
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue}   ;;
  }

}
