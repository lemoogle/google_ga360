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

  dimension: UK_master_channel_group{
    label: "Master Channel Grouping"
    type: string
    description: "MandM master channel grouping."
    sql: CASE
# Affiliates
    WHEN ( ${channelGrouping} LIKE "Affiliates" or (${trafficSource.source} like "hotukdeals.com" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "shopstyle.co.uk" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "topcashback.co.uk" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "%quidco%" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "bargainbuysforbusymums.co.uk" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "%voucher%" and ${trafficSource.medium} like "%voucher%") or (${trafficSource.source} like "lovefashionsales.com" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "lovesales.com" and ${trafficSource.medium} like "referral") or ${hits_page.pagePath} like "%affiliatewindow%" or ${hits_page.pagePath} like "%AW1%" or ${hits_page.pagePath} like "%AW2%" or ${hits_page.pagePath} like "%awin%" or ${trafficSource.source} like "%webgains%" or ${hits_page.pagePath} like "%shopzilla%" or ${trafficSource.source} like "%ministryofdeals%" or ${trafficSource.source} like "%awin%" or ${trafficSource.source} like "%shopstyle%" or ${trafficSource.source} like "%shopalike%"or ${trafficSource.source} like "%affiliatewindow%" or ${trafficSource.source} like "%thesolesupplier%" or ${trafficSource.source} like "%rewardgateway.co.uk%" or ${trafficSource.source} like "%trainerbargain.com%" or ${trafficSource} like "%shopalike%" or ${trafficSource} like "%webgains%" or ${trafficSource} like "%affiliatewindow%" or ${trafficSource} like "%stylight%" or ${trafficSource} like "%ladenzeile%" or ${trafficSource} like "%domodi%" or ${trafficSource} like "%billiger%" or ${trafficSource} like "%zanox%" or ${trafficSource} like "%guenstiger%" or ${trafficSource} like "%mybestbrands%" or ${hits_page.pagePath} like "%webgains%" or ${hits_page.pagePath} like "%affiliate%" or ${hits_page.pagePath} like "%WG1%" or  ${hits_page.pagePath} like "%WG2%" or ${hits_page.pagePath} like "%network=webgains%" or ${trafficSource} like "%AWIN%") and (${trafficSource.source} not like "%Blogger%" or ${trafficSource.source} not like "%blogger%") THEN "Affiliates"
# Organic Search - Google
    WHEN  ( ${channelGrouping} like "Organic Search" or ${trafficSource.source} like "com.google.android.googlequicksearchbox") and ${trafficSource.source} like "%google%" THEN "Organic Search - Google"
# Organic Search - Any Other
    WHEN ( ${channelGrouping} like "Organic Search" or ${trafficSource.source} like "%duckduckgo%") and ((${trafficSource.source} like "%bing%" and ${trafficSource.medium} like "%organic%") or (${trafficSource.source} like "%yahoo%" and ${trafficSource.medium} like "%yahoo%") or (${trafficSource.source} like "%duckduckgo.com%" and ${trafficSource.medium} like "%referral%") or (${trafficSource.source} like "%ask%" and ${trafficSource.medium} like "%organic%") or (${trafficSource.source} like "%aol%" and ${trafficSource.medium} like "%organic%") or (${trafficSource.source} like "%yandex%" and ${trafficSource.medium} like "%organic%")) THEN "Organic Search - Any Other"
# Social - Remarketing
    WHEN (${trafficSource} like "%facebook%" or ${trafficSource} like "%instagram%") and (${trafficSource.campaign} like "%Re-targeting%" or ${trafficSource.campaign} like "%DPA%") THEN "Social - Remarketing"
# Social - Prospecting
    WHEN (${trafficSource} like "%facebook%" or ${trafficSource} like "%instagram%") and ${trafficSource.campaign} like "%Prospecting%" then "Social - Prospecting"
# Social - Re-engagement
    WHEN (${trafficSource} like "%facebook%" or ${trafficSource} like "%instagram%") and ${trafficSource.campaign} like "%Re-engagement%" then "Social - Re-engagement"
# PPC - Branded
    WHEN ( ${channelGrouping} like "Paid Search" and ${trafficSource.campaign} like "%Branded%") THEN "PPC - Branded"
# PPC - PLAs
    WHEN ( ${channelGrouping} like "Paid Search" and ${trafficSource.campaign} like "%Product Listing Ad%") OR ${trafficSource.campaign} LIKE "Showcase Ads%" THEN "PPC - PLAs"
# PPC - Generic
    WHEN  ${channelGrouping} like "Paid Search" and (${trafficSource.campaign} like "%Brand Products%" or ${trafficSource.campaign} like "%Products%" or ${trafficSource.campaign} like "%DSA%" or ${trafficSource.campaign} like "%Competitors%") or (${trafficSource.campaign} LIKE "IMv2%") THEN "PPC - Generic"
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
    WHEN  (${channelGrouping} like "Email" or ${trafficSource} like "RedEye") and ((${trafficSource.source} like "%fresh_relevance%" and ${trafficSource.medium} like "%fresh_relevance%") or ${trafficSource.source} like "%fresh_relevance%" or (${trafficSource.source} like "%fresh-relevance%" and ${trafficSource.medium} like "%fresh-relevance%") or (${trafficSource.source} like "%sales_cycle%" and ${trafficSource.medium} like "%sales_cycle%") or ${trafficSource.source} like "%sales_cycle" or ${trafficSource.source} like "%tms" or ${trafficSource.campaign} like "%AbandonBasket R%" or ${trafficSource.campaign} like "%REC Abandon Basket%") THEN "Email - Abandoned Basket"
# Email - CRM Campaigns
    WHEN ( ${channelGrouping} like "Email" or ${trafficSource.source} like "Email" or ${trafficSource.source} like "RedEye" or ${hits_page.pagePath} like "%spMailingID=%" or (${trafficSource.source} like "%links.mandmdirect.mkt5765.com%" and ${trafficSource.medium} like "%referral%") or ${trafficSource.source} like "%outlook.live.com%" or ${trafficSource.source} like "%silverpopmailing%" or ${trafficSource.source} like "%silverpopmailings%" or ${trafficSource.source} like "%SilverpopMailings%" or ${trafficSource.source} like "%FRESH_RELEVANCE%" or ${trafficSource.source} like "%FRESH-RELEVANCE%") and not ((${trafficSource.source} like "%fresh_relevance%" and ${trafficSource.medium} like "%fresh_relevance%") or (${trafficSource.source} like "%sales_cycle%" and ${trafficSource.medium} like "%email%")) THEN  "Email - CRM Campaigns"
# Direct
    WHEN  ${channelGrouping} like "Direct" THEN "Direct"
# From Other MandM Sites
    WHEN (${trafficSource.source} like "mandmdirect.ie" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "euro.mandmdirect.com") or (${trafficSource.source} like "mandmdirect.dk" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "mandmdirect.de" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "duffs.com" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "mandmdirect.fr" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "mandmdirect.nl" and ${trafficSource.medium} like "referral") or (${trafficSource.source} like "mandmdirect.com" and ${trafficSource.medium} like "referral" or (${trafficSource.source} like "mandmdirect.pl" and ${trafficSource.medium} like "referral")) THEN "From other MandM sites"
    ELSE "Other" END ;;
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

######### FINANCIAL YEAR #########

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

}
