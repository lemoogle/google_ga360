connection: "mandm_bigquery"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: ga_sessions {
  extends: [ga_sessions_block]

  join: user_facts {
    relationship: many_to_one
    sql_on: ${hits_customDimensions.user_id}=${user_facts.user_id} ;;
  }
}

explore: user_facts {}
