connection: "mandm_bigquery"

# include all the views
include: "*.view"
include: "*view.lkml"
include: "ga*"

# include all the dashboards
include: "*.dashboard"

#persist_for: "24 hours"

persist_with: default
datagroup: default{

  max_cache_age: "24 hours"
  sql_trigger: SELECT
      MAX(FORMAT_TIMESTAMP('%F %T', TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'^\d\d\d\d\d\d\d\d')))  ))
    FROM `43786551.ga_sessions_*`  AS ga_sessions
    LIMIT 1 ;;
}
explore: ga_sessions {
  extends: [ga_sessions_block]
  always_filter: {
    filters: {
      field: site
      value: "mandmdirect.com"
    }
  }


  join: user_facts {
    relationship: many_to_one
    sql_on: ${ga_sessions.new_user_id}=${user_facts.user_id} ;;
  }

  join: crm_data {
    relationship: many_to_one
    sql_on: ${ga_sessions.new_user_id}=${crm_data.latest_google_id} ;;
  }

}


explore: user_facts {}

explore: Customer_and_site_engagement {
  from:  ga_sessions
  extends: [ga_sessions_block]

  join: user_facts {
    relationship: many_to_one
    sql_on: ${ga_sessions.new_user_id}=${user_facts.user_id} ;;
  }

  join: crm_data {
    relationship: many_to_one
    sql_on: ${ga_sessions.new_user_id}=${crm_data.latest_google_id} ;;
  }

}
