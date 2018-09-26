view: daily_spend {
  sql_table_name: "467b3f825dfd2fbc67cb350cd0fea7d3".daily_spend
    ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: campaign_id {
    type: string
    # hidden: true
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: country {
    type: string
    # hidden: true
    sql: ${TABLE}.country ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: daily_spend {
    type: time
    timeframes: [date, week, month, day_of_week, raw]
    convert_tz: no
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: installs {
    type: number
    hidden: yes
    sql: ${TABLE}.installs ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, campaigns.name, campaigns.remote_campaign_id]
  }

  measure:  total_spend {
    type: sum
    value_format_name: "usd"
    sql:  ${spend}/100.0;;
    label: "COST"
  }

  measure: total_installs {
    type:  sum
    sql:  ${installs} ;;
    label: "CV"
  }

  measure: cost_per_install {
    type: number
    sql: ${total_spend}::float/NULLIF(${total_installs},0) ;;
    value_format_name: "usd"
    label: "CPI"
  }

  measure:  total_impressions {
    type:  sum
    sql: ${impressions} ;;
    label: "IMP"
  }

  measure: total_clicks {
    type:  sum
    sql: ${clicks} ;;
    label: "CLICK"
  }

  measure: cost_per_click {
    type: number
    sql: ${total_spend}::float/NULLIF(${total_clicks},0) ;;
    value_format_name: "usd"
    label: "CPC"
  }

  measure: click_through_rate {
    type: number
    sql:  ${total_clicks}::float/NULLIF(${total_impressions},0);;
    value_format_name: percent_2
    label: "CTR"
  }

  measure: conversion_rate {
    type: number
    sql:  ${total_installs}::float/NULLIF(${total_clicks},0);;
    value_format_name: percent_2
    label: "CVR"
  }

}
