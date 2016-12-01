view: campaigns {
  sql_table_name: e9c99ee016bbd36d3081045bb02d600a.campaigns ;;

  dimension: remote_campaign_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.remote_campaign_id ;;
  }

  dimension: ad_network_id {
    type: number
    # hidden: true
    sql: ${TABLE}.ad_network_id ;;
  }

  dimension: app_id {
    type: string
    # hidden: true
    sql: ${TABLE}.app_id ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [remote_campaign_id, name, ad_networks.id, ad_networks.name, apps.id, apps.name, campaigns_targeting_tags.count, cohort_behavior.count, daily_behavior.count, daily_spend.count, user_attributes.count]
  }
}
