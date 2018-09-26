view: publisher_apps {
  sql_table_name: "467b3f825dfd2fbc67cb350cd0fea7d3".publisher_apps ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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
    fields: [id, name, ad_networks.id, ad_networks.name, apps.id, apps.name, daily_ad_revenue.count]
  }
}
