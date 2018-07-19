include: "ga_customize.view.lkml"
view: ga_sessions_mandm {
  extends: [ga_sessions]


  measure: firstvisit {
    label: "First Visit"
    type: min
    sql: ${visitStart_raw} ;;
  }

  measure: lastvisit {
    label: "Last Visit"
    type: max
    sql: ${visitStart_raw} ;;
  }

  measure: firsttransaction{
    type: min
    sql: ${visitStart_raw} ;;
    filters: {
      field: has_transaction
      value: "yes"
    }
  }
  measure: conversion_rate {
    type: number
    value_format: "0.00%"
    sql: ${totals.transactions_count}/NULLIF(${totals.visits_total},0);;
  }

  dimension: checkout_stage {
    type: string
    sql: CASE WHEN ${hits_eventInfo.eventAction} LIKE "1_Sign In" THEN "Started"
    WHEN ${hits_eventInfo.eventAction} LIKE "%_Order Confirmation" THEN "Completed" END;;
  }

  measure: visits_total_last_year {
    type: count
    filters: {
      field: visitStart_date
      value: "last year"
    }
  }
  measure: visits_total_this_year {
    type: count
    filters: {
      field: visitStart_date
      value: "this year"
    }
  }

  dimension_group: test {
    hidden: yes
    type: time
    timeframes: [raw, date]
    sql: TIMESTAMP_SECONDS(ga_sessions.visitStarttime) ;;
  }


  dimension: block_name {
    type: string
    sql: "Google Analytics" ;;
    # link: {
    #   url: "https://googlecloud.looker.com/dashboards/44"
    #   label: "Google Analytics Dashboard"
    #   icon_url: "http://www.looker.com/favicon.ico"
    # }
  }


dimension: has_transaction {
  type: yesno
  sql: ${totals.transactions}>0 ;;
}

dimension: days_since_firstvisit {
  type: number
  sql: DATE_DIFF(${visitStart_date},${user_facts.first_visit_date},DAY) ;;
}

dimension: months_since_firstvisit {
  type: number
  sql: DATE_DIFF(${visitStart_date},${user_facts.first_visit_date},MONTH) ;;
}

dimension: days_since_firstpurchase {
  type: number
  sql: DATE_DIFF(${visitStart_date},${user_facts.first_visit_date},DAY) ;;
}

dimension: months_since_firstpurchase {
  type: number
  sql: DATE_DIFF(${visitStart_date},${user_facts.first_visit_date},MONTH) ;;
}

measure: total_identified_sessions {
  type: count
  filters: {
    field: is_identified
    value: "yes"
  }
}


dimension: is_identified {
  type: yesno
  sql: ${new_user_id} IS NOT NULL and ${new_user_id}<>'undefined' and ${new_user_id}<>'true' ;;
}



measure: identification_rate {
  type: number
  value_format_name: percent_1
  sql: 1.0*${total_identified_sessions}/${session_count} ;;
}

# If you have custom dimensions on sessions, declare them here.

dimension: new_user_id {
  sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=2) ;;
  label: "User ID"
  description: "Primary MandM user key, the GUID."
}

######## TEST PERAMETER #########

  parameter: show_me {
    type: unquoted
    allowed_value: {
      label: "Sessions"
      value: "visits"
    }
    allowed_value: {
      label: "Transactions"
      value: "transactions_count"
    }
    allowed_value: {
      label: "Users"
      value: "unique_visitor"
    }
  }

  measure: dynamic_sum {
    type: sum
    sql: ${TABLE}.{% parameter show_me %} ;;
    value_format_name: "usd"
  }

### EVENT BASED FIELDS

  measure: pdp_adds_to_basket {
    type: count
    filters: {
      field: hits_eventInfo.eventCategory
      value: "/productpage-addtobasket-pdp_UA"
    }
  }

  measure: plp_adds_to_basket {
    type: count
    filters: {
      field: hits_eventInfo.eventCategory
      value: "/productpage-addtobasket-plp_UA"
    }
  }

}
