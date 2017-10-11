view: daily_user_metrics {
  derived_table: {
    sql: SELECT
        date_add('hour', 9, acquired_at) ::DATE              AS date
      , country                        AS country
      , source_campaign_id             AS campaign_id
      , count(DISTINCT CASE WHEN event = 'open' and datediff('sec', acquired_at, created_at) < 86400 THEN advertising_id ELSE NULL END) AS new_users
      , count(distinct advertising_id) as users
      , count(distinct coalesce(advertising_id, developer_device_id)) as tracked_installs
      , sum(case when event_type = 'purchase' then revenue else 0 end) as revenue
      , sum(case when event_type = 'purchase'  and date_diff('sec', acquired_at, created_at)/86400 = 1 then revenue else 0 end) as revenue_d1
      , sum(case when event_type = 'purchase'  and date_diff('sec', acquired_at, created_at)/86400 >= 1 and date_diff('sec', acquired_at, created_at)/86400 <= 2  then revenue else 0 end) as revenue_d2
      , sum(case when event_type = 'purchase'  and date_diff('sec', acquired_at, created_at)/86400 >= 1 and date_diff('sec', acquired_at, created_at)/86400 <= 3  then revenue else 0 end) as revenue_d3
      , sum(case when event_type = 'purchase'  and date_diff('sec', acquired_at, created_at)/86400 >= 1 and date_diff('sec', acquired_at, created_at)/86400 <= 7  then revenue else 0 end) as revenue_d7
      , sum(case when event_type = 'purchase'  and date_diff('sec', acquired_at, created_at)/86400 >= 1 and date_diff('sec', acquired_at, created_at)/86400 <= 14  then revenue else 0 end) as revenue_d14
      , sum(case when event_type = 'purchase'  and date_diff('sec', acquired_at, created_at)/86400 >= 1 and date_diff('sec', acquired_at, created_at)/86400 <= 21  then revenue else 0 end) as revenue_d21
      , sum(case when event_type = 'purchase'  and date_diff('sec', acquired_at, created_at)/86400 >= 1 and date_diff('sec', acquired_at, created_at)/86400 <= 28  then revenue else 0 end) as revenue_d28
      , sum(case when event_type = 'purchase'  and date_diff('sec', acquired_at, created_at)/86400 >= 1 and date_diff('sec', acquired_at, created_at)/86400 <= 90  then revenue else 0 end) as revenue_d90
      -- since country is more granular than campaign_id,
      -- we need to use the sum() window function to find the total acquired users for each campaign-day
      , sum(count(distinct advertising_id)) over (partition by acquired_at::date, source_campaign_id) as new_campaign_day_users
      , sum(count(distinct CASE WHEN event = 'open' and datediff('sec', acquired_at, created_at) < 86400 THEN advertising_id ELSE NULL END)) over (partition by acquired_at::date, source_campaign_id) as campaign_day_users
    FROM events
    GROUP BY acquired_at, country, source_campaign_id
 ;;
  }

  dimension_group: acquired {
    type: time
    timeframes: [date, week, month, year, raw]
    sql: ${TABLE}.date ;;
  }

  dimension_group: user_metrics {
    type: time
    timeframes: [date, week, month, year]
    sql:  coalesce(${acquired_raw},${daily_country_spend.daily_country_spend_raw});;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.new_users ;;
  }

  measure: total_new_users {
    type: sum
    sql: ${new_users} ;;
  }

  measure: cost_per_new_user {
    type: number
    sql: ${daily_country_spend.total_spend}::float/NULLIF(${total_new_users},0) ;;
    value_format: "\"¥\"#,##0"
    }

  measure: users {
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: tracked_installs {
    type: sum
    sql: ${TABLE}.tracked_installs ;;
    label: "CVs(SDK)"
  }

  measure: cost_per_tracked_install {
    type: number
    value_format: "\"¥\"#,##0"
    sql: ${daily_country_spend.total_spend}::float/NULLIF(${tracked_installs},0) ;;
    label: "CPA(SDK)"
  }

  measure: tracked_installs_per_click {
    type: number
    value_format_name: percent_2
    sql: ${daily_country_spend.total_clicks}::float/NULLIF(${tracked_installs},0) ;;
    label: "CVR(SDK)"
  }

  dimension: new_campaign_day_users {
    type: number
    sql: ${TABLE}.new_campaign_day_users ;;
    description: "Total acquired users for each campaign-day"
    hidden:  yes
  }

  dimension: campaign_day_users {
    type: number
    sql: ${TABLE}.campaign_day_users ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
    hidden:  yes
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue}/100.0 ;;
    value_format_name: usd
  }

  measure: revenue_d01 {
    type: sum
    sql: ${TABLE}.revenue_d1/100.0 ;;
    value_format_name: usd
  }

  measure: revenue_d02 {
    type: sum
    sql: ${TABLE}.revenue_d2/100.0 ;;
    value_format_name: usd
  }

  measure: revenue_d03 {
    type: sum
    sql: ${TABLE}.revenue_d3/100.0 ;;
    value_format_name: usd
  }

  measure: revenue_d07 {
    type: sum
    sql: ${TABLE}.revenue_d7/100.0 ;;
    value_format_name: usd
  }

  measure: revenue_d14 {
    type: sum
    sql: ${TABLE}.revenue_d14/100.0 ;;
    value_format_name: usd
  }

  measure: revenue_d21 {
    type: sum
    sql: ${TABLE}.revenue_d21/100.0 ;;
    value_format_name: usd
  }

  measure: revenue_d28 {
    type: sum
    sql: ${TABLE}.revenue_d28/100.0 ;;
    value_format_name: usd
  }

  measure: revenue_d90 {
    type: sum
    sql: ${TABLE}.revenue_d90/100.0 ;;
    value_format_name: usd
  }

  #### Metrics by Geo #####
  #### The APIs that we pull spend from don’t report the country, so we must estimate it.
  #### At a high level, spend by country is allocated by the proportion of acquired users in that country on that day of spend.

  dimension: country {
    type: string
    sql: coalesce(${TABLE}.country, ${daily_country_spend.country}) ;;
    view_label: "Geography Metrics"
  }

  measure: country_spend {
    type: sum
    sql: ((${daily_country_spend.spend} * ${new_users}) / ${campaign_day_users})/100.0 ;;
    value_format_name: usd
    view_label: "Geography Metrics"
    description: "Spend by country is allocated by the proportion of acquired users in that country on that day of spend."
  }

  measure:  country_cost_per_new_user {
    type: number
    sql: ${country_spend}::float/NULLIF(${total_new_users},0) ;;
    view_label: "Geography Metrics"
  }

  measure: country_installs {
    type: sum
    sql: ((${daily_country_spend.installs} * ${new_users}) / ${campaign_day_users}) ;;
    view_label: "Geography Metrics"
    description: "Installs by country is allocated by the proportion of acquired users in that country on that day of install."
  }

  measure:  country_cost_per_install {
    type: number
    sql:  ${country_spend}::float/NULLIF(${country_installs},0);;
    view_label: "Geography Metrics"
  }

  measure: count {
    type: count
  }
}
