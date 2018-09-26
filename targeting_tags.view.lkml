view: targeting_tags {
  sql_table_name: "467b3f825dfd2fbc67cb350cd0fea7d3".targeting_tags ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension: standard {
    type: yesno
    sql: ${TABLE}.standard ;;
  }

  measure: count {
    type: count
    drill_fields: [id, campaigns_targeting_tags.count]
  }
}
