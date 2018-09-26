view: ad_networks {
  sql_table_name: "467b3f825dfd2fbc67cb350cd0fea7d3".ad_networks ;;

  dimension: id {
    primary_key: yes
    type: number
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
    drill_fields: [id, name, campaigns.count, publisher_apps.count]
  }
}
