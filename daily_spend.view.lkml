view: daily_spend {
  sql_table_name: "883d44d664a54beb94e411f1a4e76004".daily_spend ;;

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

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: daily_spend {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: installs {
    type: number
    hidden: yes
    sql: ${TABLE}.installs ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
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
    value_format: "$0"
    sql:  ${spend}/100.0 ;;
  }

  measure: total_installs {
    type:  sum
    sql:  ${installs} ;;
  }
}
