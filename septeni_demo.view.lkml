view: septeni_demo {
  derived_table: {
    sql: select
      date
      , a.name as app_name
      , a.platform
      , an.name as ad_network_name
      , sum(impressions) as impressions
      , sum(clicks) as clicks
      , sum(installs) as installs
      , sum(spend)/100.0 as spend
      from daily_spend ds
      left outer join campaigns c
      on ds.campaign_id = c.id
      left outer join ad_networks an
      on c.ad_network_id = an.id
      left outer join apps a
      on c.app_id = a.id
      where date >= date_trunc('year', CURRENT_DATE)
      and a.id in ('ee270433-b7da-4e0f-9b03-8dd25d89da49','e6622911-ac27-4128-ace7-3a9df73d5fc8')
      group by 1,2,3,4
      order by 1,2,3,4
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: ad_network_name {
    type: string
    sql: ${TABLE}.ad_network_name ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: installs {
    type: number
    sql: ${TABLE}.installs ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  set: detail {
    fields: [
      date,
      app_name,
      platform,
      ad_network_name,
      impressions,
      clicks,
      installs,
      spend
    ]
  }
}
