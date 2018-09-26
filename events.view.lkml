view: events {
  sql_table_name: "467b3f825dfd2fbc67cb350cd0fea7d3".events
    ;;

  dimension_group: acquired {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.acquired_at ;;
  }

  dimension: advertising_id {
    type: string
    sql: ${TABLE}.advertising_id ;;
  }

  dimension: app_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.app_id ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}.app_version ;;
  }

  dimension: bundle_id {
    type: string
    sql: ${TABLE}.bundle_id ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.created_at ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: developer_device_id {
    type: string
    sql: ${TABLE}.developer_device_id ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: limit_ad_tracking {
    type: yesno
    sql: ${TABLE}.limit_ad_tracking ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: purchase_state {
    type: number
    sql: ${TABLE}.purchase_state ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}.site_id ;;
  }

  dimension: source_campaign_id {
    type: string
    sql: ${TABLE}.source_campaign_id ;;
  }

#   dimension: total_revenue {
#     type: number
#     sql: ${TABLE}.total_revenue ;;
#   }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  dimension:  days_until_acquisition {
    type:  number
    sql:  date_diff('day',${acquired_raw},${created_raw}) ;;
  }

  dimension: created_now_diff {
    type: number
    sql: date_diff('sec', ${created_raw}, getdate()) ;;
  }

  dimension: days_until_acquisition_cohorts {
    type: tier
    sql: ${days_until_acquisition} ;;
    tiers: [7, 30, 60, 90, 120]
    style: integer}

  measure: count {
    type: count
  }

  measure:  distinct_users {
    type: count_distinct
    sql:  ${advertising_id} ;;
  }

  measure: tracked_installs {
    type: count_distinct
    sql: coalesce(${advertising_id},${developer_device_id}) ;;
  }

  measure: payers {
    type: count_distinct
    sql: ${advertising_id} ;;
    filters: {
      field: event_type
      value: "purchase"
    }
  }

  measure: total_revenue {
    type: sum
    sql:  ${revenue}/100.0 ;;
    value_format_name: usd
    filters: {
      field: event_type
      value: "purchase"
    }
  }

  measure:  revenue_per_payer {
    type:  number
    sql: ${total_revenue}::float/NULLIF(${payers},0) ;;
    value_format_name: usd
  }

  measure: total_purchases {
    type: count
    filters: {
      field: event_type
      value: "purchase"
    }
  }

  dimension: created_acquired_diff {
    type: number
    sql: date_diff('sec', ${acquired_raw}, ${created_raw})/86400;;
  }

  dimension:created_acquired_diff_tier {
    type: tier
    sql: ${created_acquired_diff} ;;
    tiers: [1,2,3,7,14,21,28,90]
  }

  measure: total_revenue_d01 {
    type: sum
    sql:  ${revenue}/100.0 ;;
    value_format_name: usd
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: "1"
    }
  }

  measure: total_revenue_d02 {
    type: sum
    sql:  ${revenue}/100.0 ;;
    value_format_name: usd
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: ">=1 AND <=3"
    }
  }

  measure: total_revenue_d03 {
    type: sum
    sql:  ${revenue}/100.0 ;;
    value_format_name: usd
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: ">=1 AND <=3"
    }
  }

  measure: total_revenue_d07 {
    type: sum
    sql:  ${revenue}/100.0 ;;
    value_format_name: usd
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: ">=1 AND <=7"
    }
  }

  measure: total_revenue_d14 {
    type: sum
    sql:  ${revenue}/100.0 ;;
    value_format_name: usd
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: ">=1 AND <=14"
    }
  }

  measure: total_revenue_d21 {
    type: sum
    sql:  ${revenue}/100.0 ;;
    value_format_name: usd
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: ">=1 AND <=21"
    }
  }

  measure: total_revenue_d28 {
    type: sum
    sql:  ${revenue}/100.0 ;;
    value_format_name: usd
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: ">=1 AND <=28"
    }
  }

  measure: total_revenue_d90 {
    type: sum
    sql:  ${revenue}/100.0 ;;
    value_format_name: usd
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: ">=1 AND <=90"
    }
  }

  measure: leading_30_day_revenue {
    type: sum
    sql:  ${revenue}/100.0 ;;
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: "<=30"
    }
  }
  measure: trailing_30_day_revenue {
    type: sum
    sql:  ${revenue}/100.0 ;;
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_now_diff
      value: "<=30"
    }
  }

  measure: leading_30_day_purchases {
    type: count
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_acquired_diff
      value: "<=30"
    }
  }
  measure: trailing_30_day_purchases {
    type: count
    filters: {
      field: event_type
      value: "purchase"
    }
    filters: {
      field: created_now_diff
      value: "<=30"
    }
  }

  measure: days_returned {
    type: count_distinct
    sql: ${created_date} ;;
    filters: {
      field: event
      value: "open"
    }
  }

  measure: sessions {
    type: count
    filters: {
      field: event
      value: "open"
    }
  }
}
