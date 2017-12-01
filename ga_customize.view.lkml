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
      label: "mandmdirect.rollup"
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
  measure: conversion_rate {
    type: number
    value_format: "0.00%"
    sql: ${totals.transactions_count}/${totals.visits_total};;
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

  dimension: UK_master_channel_group{
    type: string
sql: CASE WHEN ( ${channelGrouping} LIKE "Affiliates" or (${trafficSource.source} like "hotukdeals.com" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "shopstyle.co.uk" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "topcashback.co.uk" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "quidco.com" and ${trafficSource.medium} like "referral")or (${trafficSource.source} like "bargainbuysforbusymums.co.uk" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "%voucher%" and ${trafficSource.medium} like "%voucher%") or (${trafficSource.source} like "lovefashionsales.com" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "lovesales.com" and ${trafficSource.medium} like "referral") or ${hits_page.pagePath} like "%affiliatewindow%" or ${hits_page.pagePath} like "%AW1%" or ${hits_page.pagePath} like "%AW2%" or ${hits_page.pagePath} like "%awin%" or ${hits_page.pagePath} like "%shopzilla%" or ${trafficSource.source} like "%ministryofdeals%" or ${trafficSource.source} like "%shopstyle%" or ${trafficSource.source} like "%thesolesupplier%" or ${trafficSource.source} like "%rewardgateway.co.uk%" or ${trafficSource.source} like "%trainerbargain.com%") and (${trafficSource.source} not like "%Blogger%" or ${trafficSource.source} not like "%blogger%") THEN "Affiliates"
# Organic Search - Google
WHEN  ( ${channelGrouping} like "Organic Search" or ${trafficSource.source} like "com.google.android.googlequicksearchbox") and ${trafficSource.source} like "%google%" THEN "Organic Search - Google"
# Organic Search - Any Other
WHEN ( ${channelGrouping} like "Organic Search" or ${trafficSource.source} like "%duckduckgo%") and ((${trafficSource.source} like "%bing%" and ${trafficSource.medium} like "%bing%") or (${trafficSource.source} like "%yahoo%" and ${trafficSource.medium} like "%yahoo%") or (${trafficSource.source} like "%duckduckgo.com%" and ${trafficSource.medium} like "%referral%") or (${trafficSource.source} like "%ask%" and ${trafficSource.medium} like "%organic%") or (${trafficSource.source} like "%aol%" and ${trafficSource.medium} like "%organic%") or (${trafficSource.source} like "%yandex%" and ${trafficSource.medium} like "%organic%")) THEN "Organic Search - Any Other"
# Social - Remarketing
WHEN ((${trafficSource.source} like "facebook" and ${trafficSource.medium} like "%cpc%") or (${trafficSource.source} like "%facebook+instagram%" and ${trafficSource.medium} like "%cpc%")) and (${trafficSource.campaign} like "%DPA%" or ${trafficSource.campaign} like "%Re-engagement - Automated Ad%")THEN "Social - Remarketing"
# Social - Prospecting
WHEN (((${trafficSource.source} like "facebook" and ${trafficSource.medium} like "%cpc%") or (${trafficSource.source} like "%facebook+instagram%" and ${trafficSource.medium} like "%cpc%")) and ${trafficSource.campaign} like "%prospecting%")THEN "Social - Prospecting"
# PPC - Branded
WHEN ( ${channelGrouping} like "Paid Search" and ${trafficSource.campaign} like "%Branded%") THEN "PPC - Branded"
# PPC - PLAs
WHEN ( ${channelGrouping} like "Paid Search" and ${trafficSource.campaign} like "%Product Listing Ad%")THEN "PPC - PLAs"
# PPC - Generic
WHEN  ${channelGrouping} like "Paid Search" and (${trafficSource.campaign} like "%Brand Products%" or ${trafficSource.campaign} like "%Products%" or ${trafficSource.campaign} like "%DSA%" or ${trafficSource.campaign} like "%Competitors%")THEN "PPC - Generic"
# Youtube - Remarketing
WHEN (${trafficSource.campaign} like "RemarketingYT") THEN "Youtube - Remarketing"
# Youtube - Prospecting
WHEN (${trafficSource.campaign} like "ProspectingYT") THEN "Youtube - Prospecting"
# Display - Remarketing
WHEN  ${channelGrouping} like "Display" and ${trafficSource.campaign} like "%Remarketing%" THEN "Display - Remarketing"
# Display - Re-engagement
WHEN  ${channelGrouping} like "Display" and (${trafficSource.campaign} like "%Reengage%" or ${trafficSource.campaign} like "%Re-engage%") THEN "Display - Re-engagement"
# Display - Prospecting
WHEN ${trafficSource.campaign} like "%Prospecting%" THEN "Display - Prospecting"
# Any Other Display
WHEN  ${channelGrouping} like "Display" THEN "Any Other Display"
# Social - Organic
WHEN ( ${channelGrouping} like "Social" or (${trafficSource.source} like "%t.co%" and ${trafficSource.medium} like "%t.co%") or (${trafficSource.source} like "%social%" and ${trafficSource.medium} like "%social%") or ${trafficSource.source} like "%facebook%" or ${trafficSource.source} like "%facbeook%" or ${trafficSource.source} like "Twitter" or ${trafficSource.source} like "Instagram" or ${trafficSource.source} like "%Blogger%" or ${trafficSource.source} like "PR" or ${trafficSource.source} like "m.vk.com" or ${trafficSource.source} like "youtubesocial" or ${trafficSource.campaign} like "RunningHeroes") and not (${trafficSource.source} like "facebook" and ${trafficSource.medium} like "cpc") THEN "Social - Organic"
# Email - Abandoned Basket
WHEN  ${channelGrouping} like "Email" and ((${trafficSource.source} like "%fresh_relevance%" and ${trafficSource.medium} like "%fresh_relevance%") or ${trafficSource.source} like "%fresh_relevance%" or (${trafficSource.source} like "%fresh-relevance%" and ${trafficSource.medium} like "%fresh-relevance%") or (${trafficSource.source} like "%sales_cycle%" and ${trafficSource.medium} like "%sales_cycle%") or ${trafficSource.source} like "%sales_cycle" or ${trafficSource.source} like "%tms") THEN "Email - Abandoned Basket"
# Email - CRM Campaigns
WHEN ( ${channelGrouping} like "Email" or ${trafficSource.source} like "Email" or (${trafficSource.source} like "%links.mandmdirect.mkt5765.com%" and ${trafficSource.medium} like "%referral%") or ${trafficSource.source} like "%outlook.live.com%" or ${trafficSource.source} like "%silverpopmailing%" or ${trafficSource.source} like "%silverpopmailings%" or ${trafficSource.source} like "%SilverpopMailings%" or ${trafficSource.source} like "%FRESH_RELEVANCE%" or ${trafficSource.source} like "%FRESH-RELEVANCE%") and not ((${trafficSource.source} like "%fresh_relevance%" and ${trafficSource.medium} like "%fresh_relevance%") or (${trafficSource.source} like "%sales_cycle%" and ${trafficSource.medium} like "%email%")) THEN  "Email - CRM Campaigns"
# Direct
WHEN  ${channelGrouping} like "Direct" THEN "Direct"
# From Other MandM Sites
WHEN (${trafficSource.source} like "mandmdirect.ie" and ${trafficSource.medium} like "refferal") or (${trafficSource.source} like "euro.mandmdirect.com" and ${trafficSource.medium} like "refferal") or (${trafficSource.source} like "mandmdirect.dk" and ${trafficSource.medium} like "refferal") or (${trafficSource.source} like "mandmdirect.de" and ${trafficSource.medium} like "refferal") or (${trafficSource.source} like "duffs.com" and ${trafficSource.medium} like "refferal") or (${trafficSource.source} like "mandmdirect.fr" and ${trafficSource.medium} like "refferal") or (${trafficSource.source} like "mandmdirect.nl" and ${trafficSource.medium} like "refferal") or (${trafficSource.source} like "mandmdirect.com" and ${trafficSource.medium} like "refferal") THEN "From other MandM sites"
ELSE "Other" END ;;
}
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
