view: user_event_facts {
  derived_table: {
    sql: WITH latest_user_event AS (
          SELECT
            advertising_id,
            max(created_at) AS created_at
          FROM events
          WHERE event = 'open'
                AND source_campaign_id IS NOT NULL
          GROUP BY 1
      )
          SELECT DISTINCT
            advertising_id,
            source_campaign_id,
            country,
            site_id,
            acquired_at :: DATE,
            limit_ad_tracking,
            created_at AS last_seen
          FROM events
            INNER JOIN latest_user_event
            USING (advertising_id, created_at)
          WHERE event = 'open'
                AND source_campaign_id IS NOT NULL
       ;;
  }

  dimension: advertising_id {
    type: string
    sql: ${TABLE}.advertising_id ;;
    primary_key: yes
  }

  dimension: source_campaign_id {
    type: string
    sql: ${TABLE}.source_campaign_id ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}.site_id ;;
  }

  dimension: acquired_at {
    type: date
    sql: ${TABLE}.acquired_at ;;
  }

  dimension: limit_ad_tracking {
    type: string
    sql: ${TABLE}.limit_ad_tracking ;;
  }

  dimension_group: last_seen {
    type: time
    sql: ${TABLE}.last_seen ;;
  }
}
