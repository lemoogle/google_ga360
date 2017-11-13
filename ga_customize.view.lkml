include: "ga_block.view.lkml"

explore: ga_sessions_block {
  extends: [ga_sessions_base]
  extension: required

  always_filter: {
    filters: {
      field: ga_sessions.partition_date
      value: "2017-11-10 00:00:00"
      ## Partition Date should always be set to a recent date to avoid runaway queries
   }
  }


  join: mandm_user_id {
    relationship: many_to_one
    view_label: "MandM Dimensions"
    required_joins: [hits]
    from: mandm_custom_dims
    fields: [user_id]
    sql: LEFT JOIN UNNEST(hits.customDimensions) as mandm_user_id ON mandm_user_id.index=2 ;;
  }

}

view: mandm_custom_dims {

  dimension: user_id {
    sql: ${TABLE}.value ;;
  }
}


view: ga_sessions {
  extends: [ga_sessions_base]
  # The SQL_TABLE_NAME must be replaced here for date partitioned queries to work properly.


  sql_table_name: `43786551.ga_sessions_*` ;;
  measure: firstvisit {
    type: min
    sql: ${visitStart_date} ;;
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
    sql: DATEDIFF('days',${partition_date},${user_facts.first_visit_date}) ;;
  }

  dimension: months_since_firstvisit {
    type: number
    sql: DATEDIFF('months',${partition_date},${user_facts.first_visit_date}) ;;
  }

  measure: total_identified_users {
    type: count_distinct
    sql: ${fullVisitorId} ;;
    filters: {
      field: hits_customDimensions.is_identified
      value: "yes"
    }
  }

  measure: identification_rate {
    type: number
    sql: 1.0*${total_identified_users}/${total_visitors} ;;
  }

  # If you have custom dimensions on sessions, declare them here.

  # dimension: custom_dimension_2 {
  #   sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=2) ;;
  # }


  # dimension: custom_dimension_2 {
  #   sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=2) ;;
  # }

  # dimension: custom_dimension_3 {
  #   sql: (SELECT value FROM UNNEST(${TABLE}.customdimensions) WHERE index=3) ;;
  # }
}

view: geoNetwork {
  extends: [geoNetwork_base]
}

view: totals {
  extends: [totals_base]
  dimension: transactions {
    hidden: yes
    sql: ${TABLE}.transactions ;;
  }
}

view: trafficSource {
  extends: [trafficSource_base]
}

view: device {
  extends: [device_base]
}

view: hits {
  extends: [hits_base]
}

view: hits_page {
  extends: [hits_page_base]
}

# -- Ecommerce Fields

view: hits_transaction {
  #extends: [hits_transaction_base]  # Comment out to remove fields
}

view: hits_item {
  #extends: [hits_item_base]
}

# -- Advertising Fields

view: adwordsClickInfo {
  #extends: [adwordsClickInfo_base]
}

view: hits_publisher {
  #extends: [hits_publisher_base]   # Comment out this line to remove fields
}

#  We only want some of the interaction fields.
view: hits_social {
  extends: [hits_social_base]

  dimension: socialInteractionNetwork {hidden: yes}

  dimension: socialInteractionAction {hidden: yes}

  dimension: socialInteractions {hidden: yes}

  dimension: socialInteractionTarget {hidden: yes}

  #dimension: socialNetwork {hidden: yes}

  dimension: uniqueSocialInteractions {hidden: yes}

  #dimension: hasSocialSourceReferral {hidden: yes}

  dimension: socialInteractionNetworkAction {hidden: yes}
}


view: hits_appInfo {
  extends: [hits_appInfo_base]
}

view: hits_eventInfo {
  extends: [hits_eventInfo_base]
  dimension: play {
    sql: ${eventAction} = "play" ;;
    type: yesno
  }
}


view: hits_customDimensions {
  extends: [hits_customDimensions_base]

  dimension: user_id {
    type: string
    sql: IF(${index}=2,
          ${value},
          NULL) ;;
  }

  dimension: is_identified {
    type: yesno
    sql: ${user_id} IS NOT NULL and ${user_id}<>'undefined' and ${user_id}<>true ;;
  }
  measure: unique_loggedin_users {
    type: count_distinct
    sql: ${user_id} ;;

  }
}

view: hits_customVariables {
  extends: [hits_customVariables_base]
}
