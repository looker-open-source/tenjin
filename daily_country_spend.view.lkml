view: daily_country_spend {
  sql_table_name: "883d44d664a54beb94e411f1a4e76004".daily_country_spend ;;

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

  dimension_group: daily_country_spend {
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
    sql: CASE
          WHEN ${agency_margin.type} = 0
            THEN spend /(1-coalesce(${agency_margin.agency_margin},0.15))
          WHEN ${agency_margin.type} = 1
            THEN spend * (1 + coalesce(${agency_margin.agency_margin},0.15))
          END;;
    }

  dimension: spend_usd {
    type: number
    hidden: yes
    sql: CASE
          WHEN ${agency_margin.type} = 0
            THEN spend/112.0 /(1-coalesce(${agency_margin.agency_margin},0.15))
          WHEN ${agency_margin.type} = 1
            THEN spend/112.0 * (1 + coalesce(${agency_margin.agency_margin},0.15))
          END;;
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
    value_format: "\"¥\"#,##0"
    sql:  ${spend};;
    label: "Cost"
  }

  measure:  total_spend_usd {
    type: sum
    value_format_name: "usd"
    sql:  ${spend_usd};;
    label: "Cost"
  }

  measure: total_installs {
    type:  sum
    sql:  ${installs} ;;
    label: "CVs(Media)"
  }

  measure: cost_per_install {
    type: number
    sql: ${total_spend}::float/NULLIF(${total_installs},0) ;;
    value_format: "\"¥\"#,##0"
    label: "CPA(Media)"
  }

  measure: cost_per_install_usd {
    type: number
    sql: ${total_spend_usd}::float/NULLIF(${total_installs},0) ;;
    value_format_name: "usd"
    label: "CPA(Media)"
  }

  measure:  total_impressions {
    type:  sum
    sql: ${impressions} ;;
    label: "IMPs"
  }

  measure: total_clicks {
    type:  sum
    sql: ${clicks} ;;
    label: "CLs"
  }

  measure: cost_per_click {
    type: number
    sql: ${total_spend}::float/NULLIF(${total_clicks},0) ;;
    value_format: "\"¥\"#,##0"
    label: "CPC"
  }

  measure: cost_per_click_usd {
    type: number
    sql: ${total_spend_usd}::float/NULLIF(${total_clicks},0) ;;
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
