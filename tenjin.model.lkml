connection: "demo"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard" #comment

explore: daily_country_spend {
  join: campaigns {
    type: left_outer
    sql_on: ${daily_country_spend.campaign_id} = ${campaigns.remote_campaign_id} ;;
    relationship: many_to_one
  }

  join: ad_networks {
    type: left_outer
    sql_on: ${campaigns.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }

  join: apps {
    type: left_outer
    sql_on: ${campaigns.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }
}
explore: daily_user_metrics {

  join: daily_country_spend {
    type: full_outer
    sql_on: ${daily_user_metrics.acquired_date} = ${daily_country_spend.daily_country_spend_date} and
            ${daily_user_metrics.campaign_id} = ${daily_country_spend.campaign_id} and
            ${daily_user_metrics.country} = ${daily_country_spend.country};;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer
    sql_on: coalesce(${daily_user_metrics.campaign_id}, ${daily_country_spend.campaign_id}) = ${campaigns.id} ;;
    relationship: many_to_one
  }

  join: apps {
    type: left_outer
    sql_on: ${campaigns.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }

  join: ad_networks {
    type: left_outer
    sql_on: ${campaigns.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }
}

explore: daily_behavior {
  join: campaigns {
    type: left_outer
    sql_on: ${daily_behavior.campaign_id} = ${campaigns.remote_campaign_id} ;;
    relationship: many_to_one
  }

  join: ad_networks {
    type: left_outer
    sql_on: ${campaigns.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }

  join: apps {
    type: left_outer
    sql_on: ${campaigns.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }
}

explore: events {
  join: apps {
    type: left_outer
    sql_on: ${events.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }
  join: campaigns {
    type: left_outer
    sql_on: ${events.source_campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }
  join: ad_networks {
    type: left_outer
    sql_on: ${campaigns.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }
}

explore: ad_networks {}

explore: apps {}

explore: campaigns {
  join: ad_networks {
    type: left_outer
    sql_on: ${campaigns.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }

  join: apps {
    type: left_outer
    sql_on: ${campaigns.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }
}

explore: campaigns_targeting_tags {
  join: campaigns {
    type: left_outer
    sql_on: ${campaigns_targeting_tags.campaign_id} = ${campaigns.remote_campaign_id} ;;
    relationship: many_to_one
  }

  join: targeting_tags {
    type: left_outer
    sql_on: ${campaigns_targeting_tags.targeting_tag_id} = ${targeting_tags.id} ;;
    relationship: many_to_one
  }

  join: ad_networks {
    type: left_outer
    sql_on: ${campaigns.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }

  join: apps {
    type: left_outer
    sql_on: ${campaigns.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }
}

explore: cohort_behavior {
  join: campaigns {
    type: left_outer
    sql_on: ${cohort_behavior.campaign_id} = ${campaigns.remote_campaign_id} ;;
    relationship: many_to_one
  }

  join: ad_networks {
    type: left_outer
    sql_on: ${campaigns.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }

  join: apps {
    type: left_outer
    sql_on: ${campaigns.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }
}

explore: daily_ad_revenue {
  join: publisher_apps {
    type: left_outer
    sql_on: ${daily_ad_revenue.publisher_app_id} = ${publisher_apps.id} ;;
    relationship: many_to_one
  }

  join: ad_networks {
    type: left_outer
    sql_on: ${publisher_apps.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }

  join: apps {
    type: left_outer
    sql_on: ${publisher_apps.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }
}

explore: publisher_apps {
  join: ad_networks {
    type: left_outer
    sql_on: ${publisher_apps.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }

  join: apps {
    type: left_outer
    sql_on: ${publisher_apps.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }
}

explore: schema_info {}

explore: targeting_tags {}

explore: updated_at {}

explore: user_attributes {
  join: campaigns {
    type: left_outer
    sql_on: ${user_attributes.campaign_id} = ${campaigns.remote_campaign_id} ;;
    relationship: many_to_one
  }

  join: ad_networks {
    type: left_outer
    sql_on: ${campaigns.ad_network_id} = ${ad_networks.id} ;;
    relationship: many_to_one
  }

  join: apps {
    type: left_outer
    sql_on: ${campaigns.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }
}
