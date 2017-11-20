include: "*.model.lkml"
view: user_facts {


  derived_table: {
    datagroup_trigger: default
    #persist_for: "24 hours"
    explore_source: ga_sessions{
       filters: {
         field: ga_sessions.partition_date
         value: ""
       }
      filters: {
        field: ga_sessions.is_identified
        value: "yes"
      }
      column: user_id  {
        field:ga_sessions.new_user_id
      }

      column: lifetime_value {
        field: totals.transactionRevenue_total
      }

      column: first_visit {
        field: ga_sessions.firstvisit
      }

      column: first_purchase {
        field: ga_sessions.firsttransaction
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
  dimension: user_id {hidden:no
    primary_key:yes}
  dimension: first_visit_str {
    type: string
    hidden: yes
    sql: ${TABLE}.first_visit ;;

  }

  dimension_group: first_visit {
    type: time
    sql: ${TABLE}.first_visit ;;
    timeframes: [date,month,year]
  }

  dimension_group: first_purchase {
    type: time
    sql: ${TABLE}.first_purchase ;;
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


  measure: count {
    type: count
  }


}
