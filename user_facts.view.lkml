include: "*.model.lkml"
view: user_facts {


  derived_table: {
    #persist_for: "24 hours"
    explore_source: ga_sessions{
       filters: {
         field: ga_sessions.partition_date
         value: ""
       }
      column: user_id  {
        field:hits_customDimensions.user_id
      }

      column: lifetime_value {
        field: totals.transactionRevenue_total
      }

      column: first_visit {
        field: ga_sessions.firstvisit
      }

      column: transaction_count {
        field: totals.transactions_count
      }
      column: visit_count {
        field: totals.visits_total
      }

      column: pageview_count {
        field: totals.pageviews_total
      }

      column: timeonsite {
        field: totals.timeonsite_total
      }

    }
  }

  dimension:lifetime_value{hidden:yes}
  dimension: user_id {hidden:no}
  dimension_group: first_visit {
    type: time
    sql: ${TABLE}.first_visit ;;
    timeframes: [date,month,year]
  }
  dimension: transaction_count {hidden:yes}
  dimension: visit_count {hidden:yes}
  dimension: pageview_count {hidden:yes}
  dimension: timeonsite {hidden:yes}



  measure: total_lifetime_value {
    type: sum
    sql: ${lifetime_value} ;;
  }
  measure: total_transaction_count {
    type: sum
    sql: ${transaction_count} ;;
  }
  measure: total_timeonsite {
    type: sum
    sql: ${timeonsite} ;;
  }
  measure: total_pageview_count {
    type: sum
    sql: ${pageview_count} ;;
  }

  measure: average_transaction_revenue {
    type: number
    sql: ${total_lifetime_value}/${total_transaction_count} ;;
  }

  measure: average_visit_revenue {
    type: number
    sql: ${total_lifetime_value}/${total_visit_count} ;;
  }

  measure: total_visit_count {
    type: sum
    sql: ${visit_count} ;;
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

# view: user_facts {
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
