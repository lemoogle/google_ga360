include: "ga_block.view.lkml"
view: financial_calcs_extend {
  extends: [ga_sessions_base]

  dimension: financial_week {
    type: string
    sql: CASE WHEN ${visitStart_date} BETWEEN '2017-11-6' AND '2017-11-12' THEN "Week 15 FY17"
        WHEN ${visitStart_date} BETWEEN '2017-11-13' AND '2017-11-19' THEN "Week 16 FY17"
        WHEN ${visitStart_date} BETWEEN '2017-11-20' AND '2017-11-26' THEN "Week 17 FY17"
        ELSE "Unknown" END;;
  }
  dimension: financial_week_number {
    type: string
    sql: CASE WHEN ${visitStart_date} BETWEEN '2017-11-6' AND '2017-11-12' THEN "15"
        WHEN ${visitStart_date} BETWEEN '2017-11-13' AND '2017-11-19' THEN "16"
        WHEN ${visitStart_date} BETWEEN '2017-11-20' AND '2017-11-26' THEN "17"
        ELSE "Unknown" END;;
  }

  dimension: financial_year {
    type: string
    sql: CASE WHEN ${visitStart_date} BETWEEN '2014-8-4' AND '2015-8-2' THEN "2015"
        WHEN ${visitStart_date} BETWEEN '2015-8-3' AND '2016-7-31' THEN "2016"
        WHEN ${visitStart_date} BETWEEN '2016-8-1' AND '2017-7-31' THEN "2017"
        WHEN ${visitStart_date} BETWEEN '2017-8-1' AND '2018-7-29' THEN "2018"
        ELSE "Unknown" END;;
  }
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: financial_calcs_extend {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
