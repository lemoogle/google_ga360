connection: "mandm_bigquery"

# include all the views
include: "*.view"

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
  # always_filter: {
  #   filters: {
  #     field: site
  #     value: "43786551"
  #   }
  # }
  join: user_facts {
    relationship: many_to_one
    sql_on: ${hits_customDimensions.user_id}=${user_facts.user_id} ;;
  }
}

explore: user_facts {}
