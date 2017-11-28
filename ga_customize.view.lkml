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

}


view: ga_sessions {
  extends: [ga_sessions_base]
  # The SQL_TABLE_NAME must be replaced here for date partitioned queries to work properly.


  sql_table_name: `43786551.ga_sessions_*` ;;

  parameter: site {
    hidden: yes
    type: number
    allowed_value: {
      label: "mandmdirect.com"
      value: "43786551"
    }
    allowed_value: {
      label: "mandmdirect.de"
      value: "43787040"
    }
    allowed_value: {
      label: "mandmdirect.nl"
      value: "82755245"
    }
    allowed_value: {
      label: "mandmdirect.dk"
      value: "43786178"
    }
    allowed_value: {
      value: "43786097"
      label: "mandmdirect.ie"
    }
    allowed_value: {
      value: "43786092"
      label: "mandmdirect.fr"
    }
    allowed_value: {
      value: "160971340"
      label: "mandmdirect.dk2?"
    }
    default_value: "43786551"
  }
  measure: firstvisit {
    type: min
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
  }


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
}

view: hits_customVariables {
  extends: [hits_customVariables_base]
}
