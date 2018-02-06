include: "ga_block.view.lkml"
include: "financial_calcs_extend.view.lkml"
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
  extends: [ga_sessions_base,financial_calcs_extend]
  # The SQL_TABLE_NAME must be replaced here for date partitioned queries to work properly.


  sql_table_name: (SELECT * FROM (
            SELECT 'mandmdirect.com' as site, _TABLE_SUFFIX as tablesuffix, *
            FROM `43786551.ga_sessions_*`
            UNION ALL
            SELECT 'mandmdirect.de' as site, _TABLE_SUFFIX as tablesuffix, *
            FROM `43787040.ga_sessions_*`
            UNION ALL
            SELECT 'mandmdirect.fr' as site, _TABLE_SUFFIX as tablesuffix, *
            FROM `43786092.ga_sessions_*`
            UNION ALL
            SELECT 'mandmdirect.ie' as site, _TABLE_SUFFIX as tablesuffix, *
            FROM `43786097.ga_sessions_*`
            UNION ALL
            SELECT 'mandmdirect.dk' as site, _TABLE_SUFFIX as tablesuffix, *
            FROM `43786178.ga_sessions_*`
            UNION ALL
            SELECT 'mandmdirect.nl' as site, _TABLE_SUFFIX as tablesuffix, *
            FROM `82755245.ga_sessions_*`
            ))
            ;;

  dimension: site {
    type: string
    suggestions: ["mandmdirect.com","mandmdirect.de","mandmdirect.fr","mandmdirect.ie","mandmdirect.dk","mandmdirect.nl"]
  }

  dimension: tablesuffix {
    type: string
    hidden: yes
  }

  dimension: partition_date {
    type: date_time
    sql: TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(${tablesuffix},r'^\d\d\d\d\d\d\d\d')))  ;;
  }

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
  extends: [hits_item_base]
}

view: hits_product {
  extends: [hits_product_base]
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
