explore: sample_product_data {}

view: sample_product_data {
  sql_table_name: product_data.sample_product_data ;;

  dimension: _4_wks_unit_sales_ {
    type: string
    sql: ${TABLE}._4_Wks_Unit_Sales_ ;;
  }

  dimension: _6_wks_units_avg_ {
    type: string
    sql: ${TABLE}._6_Wks_Units_Avg_ ;;
  }

  dimension: ____net_price_ {
    type: string
    sql: ${TABLE}.____NetPrice_ ;;
  }

  dimension: ____price_ {
    type: string
    sql: ${TABLE}.____Price_ ;;
  }

  dimension: ____price__334 {
    type: string
    sql: ${TABLE}.____Price__334 ;;
  }

  dimension: ____price__368 {
    type: string
    sql: ${TABLE}.____Price__368 ;;
  }

  dimension: __available_stock__ {
    type: string
    sql: ${TABLE}.__Available_Stock__ ;;
  }

  dimension: __avg_sku__gender__category___ {
    type: string
    sql: ${TABLE}.__Avg_SKU__Gender__Category___ ;;
  }

  dimension: __initial_sku_s__ {
    type: number
    sql: ${TABLE}.__Initial_SKU_s__ ;;
  }

  dimension: __no_of_skus__ {
    type: string
    sql: ${TABLE}.__No_of_SKUs__ ;;
  }

  dimension: __saving {
    type: number
    sql: ${TABLE}.__Saving ;;
  }

  dimension: __sku_s_from_initial {
    type: number
    sql: ${TABLE}.__SKU_s_from_Initial ;;
  }

  dimension: _avg_pv_by_gender_webgroup_ {
    type: number
    sql: ${TABLE}._Avg_PV_by_GenderWebgroup_ ;;
  }

  dimension: _bounces_ {
    type: string
    sql: ${TABLE}._Bounces_ ;;
  }

  dimension: _de_price_ {
    type: string
    sql: ${TABLE}._DE_Price_ ;;
  }

  dimension: _de_product_available_ {
    type: string
    sql: ${TABLE}._DE_Product_Available_ ;;
  }

  dimension: _de_rrp_ {
    type: string
    sql: ${TABLE}._DE_RRP_ ;;
  }

  dimension: _dk_price_ {
    type: string
    sql: ${TABLE}._DK_Price_ ;;
  }

  dimension: _dk_product_available_ {
    type: string
    sql: ${TABLE}._DK_Product_Available_ ;;
  }

  dimension: _dk_rrp_ {
    type: string
    sql: ${TABLE}._DK_RRP_ ;;
  }

  dimension: _emb_de_ {
    type: string
    sql: ${TABLE}._Emb_DE_ ;;
  }

  dimension: _emb_dk_ {
    type: string
    sql: ${TABLE}._Emb_DK_ ;;
  }

  dimension: _emb_fr_ {
    type: string
    sql: ${TABLE}._Emb_FR_ ;;
  }

  dimension: _emb_ie_ {
    type: string
    sql: ${TABLE}._Emb_IE_ ;;
  }

  dimension: _emb_nl_ {
    type: string
    sql: ${TABLE}._Emb_NL_ ;;
  }

  dimension: _exits_ {
    type: string
    sql: ${TABLE}._Exits_ ;;
  }

  dimension: _fr_price_ {
    type: string
    sql: ${TABLE}._FR_Price_ ;;
  }

  dimension: _fr_product_available_ {
    type: string
    sql: ${TABLE}._FR_Product_Available_ ;;
  }

  dimension: _fr_rrp_ {
    type: string
    sql: ${TABLE}._FR_RRP_ ;;
  }

  dimension: _fwd_rrp_ {
    type: string
    sql: ${TABLE}._FWD_RRP_ ;;
  }

  dimension: _fwd_rrp__335 {
    type: string
    sql: ${TABLE}._FWD_RRP__335 ;;
  }

  dimension: _ie_price_ {
    type: string
    sql: ${TABLE}._IE_Price_ ;;
  }

  dimension: _ie_product_available_ {
    type: string
    sql: ${TABLE}._IE_Product_Available_ ;;
  }

  dimension: _ie_rrp_ {
    type: string
    sql: ${TABLE}._IE_RRP_ ;;
  }

  dimension: _last_net_price_ {
    type: string
    sql: ${TABLE}._Last_Net_Price_ ;;
  }

  dimension: _ls_2017_ {
    type: string
    sql: ${TABLE}._LS_2017_ ;;
  }

  dimension: _ly_pageviews_ {
    type: string
    sql: ${TABLE}._LY_Pageviews_ ;;
  }

  dimension: _media_brief_price_ {
    type: string
    sql: ${TABLE}._Media_Brief_Price_ ;;
  }

  dimension: _newness_ {
    type: number
    sql: ${TABLE}._Newness_ ;;
  }

  dimension: _next_sale_price_ {
    type: string
    sql: ${TABLE}._Next_Sale_Price_ ;;
  }

  dimension: _nl_price_first_search {
    type: string
    sql: ${TABLE}._NL_PRice_first_search ;;
  }

  dimension: _nl_product_available_ {
    type: string
    sql: ${TABLE}._NL_Product_Available_ ;;
  }

  dimension: _nl_rrp_ {
    type: string
    sql: ${TABLE}._NL_RRP_ ;;
  }

  dimension: _page_views_ {
    type: string
    sql: ${TABLE}._Page_Views_ ;;
  }

  dimension: _po_units_ {
    type: string
    sql: ${TABLE}._PO_Units_ ;;
  }

  dimension: _po_value_ {
    type: string
    sql: ${TABLE}._PO_Value_ ;;
  }

  dimension: _price_after_ {
    type: string
    sql: ${TABLE}._Price_After_ ;;
  }

  dimension: _price_before_ {
    type: string
    sql: ${TABLE}._Price_Before_ ;;
  }

  dimension: _sg_2017_ {
    type: string
    sql: ${TABLE}._SG_2017_ ;;
  }

  dimension: _sl_2017_ {
    type: string
    sql: ${TABLE}._SL_2017_ ;;
  }

  dimension: _sl_2018_ {
    type: string
    sql: ${TABLE}._SL_2018_ ;;
  }

  dimension: _sr_2017_ {
    type: string
    sql: ${TABLE}._SR_2017_ ;;
  }

  dimension: _stock_value_ {
    type: string
    sql: ${TABLE}._Stock_Value_ ;;
  }

  dimension: _stock_value_on_sale_core_ {
    type: string
    sql: ${TABLE}._Stock_Value_on_Sale_Core_ ;;
  }

  dimension: _stock_value_on_sale_de_ {
    type: string
    sql: ${TABLE}._Stock_Value_on_Sale_DE_ ;;
  }

  dimension: _stock_value_on_sale_dk_ {
    type: string
    sql: ${TABLE}._Stock_Value_on_Sale_DK_ ;;
  }

  dimension: _stock_value_on_sale_fr_ {
    type: string
    sql: ${TABLE}._Stock_Value_on_Sale_FR_ ;;
  }

  dimension: _stock_value_on_sale_ie_ {
    type: string
    sql: ${TABLE}._Stock_Value_on_Sale_IE_ ;;
  }

  dimension: _stock_value_on_sale_nl_ {
    type: string
    sql: ${TABLE}._Stock_Value_on_Sale_NL_ ;;
  }

  dimension: _ungroup_cost_value_ {
    type: string
    sql: ${TABLE}._Ungroup_Cost_Value_ ;;
  }

  dimension: _unit_cost_ {
    type: string
    sql: ${TABLE}._Unit_Cost_ ;;
  }



  dimension: _weeks_cover_ {
    type: string
    sql: ${TABLE}._Weeks_Cover_ ;;
  }

  dimension: _xs_2017_ {
    type: string
    sql: ${TABLE}._XS_2017_ ;;
  }

  dimension: _ytd_cost_ {
    type: string
    sql: ${TABLE}._YTD_Cost_ ;;
  }

  dimension: _ytd_gp_ {
    type: string
    sql: ${TABLE}._YTD_GP_ ;;
  }

  dimension: _ytd_sv_ {
    type: string
    sql: ${TABLE}._YTD_SV_ ;;
  }

  dimension: _ytd_unit_cost_ {
    type: string
    sql: ${TABLE}._YTD_Unit_Cost_ ;;
  }

  dimension: _ytd_units_ {
    type: string
    sql: ${TABLE}._YTD_Units_ ;;
  }

  dimension: avg_bounce_rate__gender___webgroup {
    type: number
    sql: ${TABLE}.Avg_Bounce_Rate__Gender___Webgroup ;;
  }

  dimension: avg_cv__by_gender_webgroup {
    type: number
    sql: ${TABLE}.Avg_CV__by_GenderWebgroup ;;
  }

  dimension: avg_exit_rate__gender___webgroup {
    type: number
    sql: ${TABLE}.Avg_Exit_Rate__Gender___Webgroup ;;
  }

  dimension: booked_in_date {
    type: string
    sql: ${TABLE}.Booked_in_Date ;;
  }

  dimension: bounce__ {
    type: number
    sql: ${TABLE}.Bounce__ ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: brand_class {
    type: string
    sql: ${TABLE}.Brand_Class ;;
  }

  dimension: buyer {
    type: string
    sql: ${TABLE}.Buyer ;;
  }

  dimension: clipped {
    type: yesno
    sql: ${TABLE}.Clipped ;;
  }

  dimension: conversion__ {
    type: number
    sql: ${TABLE}.Conversion__ ;;
  }

  dimension: current_media_freshness {
    type: string
    sql: ${TABLE}.Current_Media_Freshness ;;
  }

  dimension: de_media {
    type: string
    sql: ${TABLE}.DE_Media ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: description_status__approved_full___described_ {
    type: string
    sql: ${TABLE}.Description_Status__Approved_Full___Described_ ;;
  }

  dimension: discount_end_date {
    type: string
    sql: ${TABLE}.Discount_EndDate ;;
  }

  dimension: discount_start_date {
    type: string
    sql: ${TABLE}.Discount_StartDate ;;
  }

  dimension: discounted_selling_price {
    type: string
    sql: ${TABLE}.Discounted_Selling_Price ;;
  }

  dimension: dk_media {
    type: string
    sql: ${TABLE}.DK_Media ;;
  }

  dimension: emb_core {
    type: number
    sql: ${TABLE}.Emb_Core ;;
  }

  dimension: entrances {
    type: number
    sql: ${TABLE}.Entrances ;;
  }

  dimension: exit__ {
    type: number
    sql: ${TABLE}.Exit__ ;;
  }

  dimension: first_searchable_date {
    type: string
    sql: ${TABLE}.First_Searchable_Date ;;
  }

  dimension: flat {
    type: string
    sql: ${TABLE}.Flat ;;
  }

  dimension: fr_media {
    type: string
    sql: ${TABLE}.FR_Media ;;
  }

  dimension: fred_search {
    type: string
    sql: ${TABLE}.fred_search ;;
  }

  dimension: future_media__from_mediabriefs_ {
    type: string
    sql: ${TABLE}.Future_Media__from_Mediabriefs_ ;;
  }

  dimension: fwd_current_media {
    type: string
    sql: ${TABLE}.FWD_Current_Media ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: ie_media {
    type: string
    sql: ${TABLE}.IE_Media ;;
  }

  dimension: image_approval {
    type: string
    sql: ${TABLE}.Image_Approval ;;
  }

  dimension: image_publication {
    type: string
    sql: ${TABLE}.Image_Publication ;;
  }

  dimension: image_status {
    type: string
    sql: ${TABLE}.Image_Status ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.ImageUrl ;;
  }

  dimension: in_river_status {
    type: string
    sql: ${TABLE}.inRiver_status ;;
  }

  dimension: is_delete {
    type: number
    sql: ${TABLE}.Is_Delete ;;
  }

  dimension: is_embargoed {
    type: number
    sql: ${TABLE}.Is_Embargoed ;;
  }

  dimension: is_in_core_data_dump {
    type: yesno
    sql: ${TABLE}.Is_in_Core_Data_Dump ;;
  }

  dimension: is_in_in_river {
    type: yesno
    sql: ${TABLE}.Is_in_inRiver ;;
  }

  dimension: item_colours {
    type: string
    sql: ${TABLE}.Item_Colours ;;
  }

  dimension: item_last_published_date {
    type: string
    sql: ${TABLE}.ItemLastPublishedDate ;;
  }

  dimension: item_rating {
    type: number
    sql: ${TABLE}.Item_Rating ;;
  }

  dimension: item_terminal_status {
    type: string
    sql: ${TABLE}.Item_Terminal_Status ;;
  }

  dimension: item_update_timestamp {
    type: string
    sql: ${TABLE}.ItemUpdateTimestamp ;;
  }

  dimension: last_markdown_date {
    type: string
    sql: ${TABLE}.Last_Markdown_Date ;;
  }

  dimension: last_media {
    type: string
    sql: ${TABLE}.Last_Media ;;
  }

  dimension: last_sold_date {
    type: string
    sql: ${TABLE}.Last_Sold_Date ;;
  }

  dimension: lw_units {
    type: number
    sql: ${TABLE}.LW_Units ;;
  }

  dimension: ly_cv_ {
    type: string
    sql: ${TABLE}.LY_CV_ ;;
  }

  dimension: margin__ {
    type: number
    sql: ${TABLE}.Margin__ ;;
  }

  dimension: markdown_type {
    type: string
    sql: ${TABLE}.Markdown_Type ;;
  }

  dimension: media_code {
    type: string
    sql: ${TABLE}.MediaCode ;;
  }

  dimension: multi_buy_id {
    type: number
    sql: ${TABLE}.MultiBuyId ;;
  }

  dimension: next_release_date {
    type: string
    sql: ${TABLE}.Next_Release_Date ;;
  }

  dimension: nl_media {
    type: string
    sql: ${TABLE}.NL_Media ;;
  }

  dimension: on_sale_core {
    type: yesno
    sql: ${TABLE}.On_Sale_Core ;;
  }

  dimension: order_due_date {
    type: string
    sql: ${TABLE}.Order_Due_Date ;;
  }

  dimension: pack___hold {
    type: yesno
    sql: ${TABLE}.Pack___Hold ;;
  }

  dimension: photo_in_in_river {
    type: yesno
    sql: ${TABLE}.Photo_in_inRiver ;;
  }

  dimension: photographed {
    type: yesno
    sql: ${TABLE}.Photographed ;;
  }

  dimension: pipeline_status {
    type: string
    sql: ${TABLE}.pipeline_status ;;
  }

  dimension: po_no {
    type: string
    sql: ${TABLE}.PO_No ;;
  }

  dimension: po_order_date {
    type: string
    sql: ${TABLE}.PO_Order_Date ;;
  }

  dimension: previous_media {
    type: string
    sql: ${TABLE}.Previous_Media ;;
  }

  dimension: primary_colour {
    type: string
    sql: ${TABLE}.Primary_Colour ;;
  }

  dimension: product_adds_to_basket {
    type: string
    sql: ${TABLE}.Product_Adds_To_Basket ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.Product_Category ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.Product_Code ;;
  }

  dimension: product_flash {
    type: string
    sql: ${TABLE}.Product_Flash ;;
  }

  dimension: product_list_ctr {
    type: number
    sql: ${TABLE}.Product_List_CTR ;;
  }

  dimension: product_list_postition {
    type: string
    sql: ${TABLE}.Product_List_Postition ;;
  }

  dimension: product_list_views {
    type: string
    sql: ${TABLE}.Product_List_Views ;;
  }

  dimension: product_located {
    type: yesno
    sql: ${TABLE}.Product_Located ;;
  }

  dimension: product_removes_from_basket {
    type: string
    sql: ${TABLE}.Product_Removes_From_Basket ;;
  }

  dimension: product_sport_category {
    type: string
    sql: ${TABLE}.Product_Sport_Category ;;
  }

  dimension: product_stock_status {
    type: number
    sql: ${TABLE}.Product_Stock_Status ;;
  }

  dimension: product_sub_category {
    type: string
    sql: ${TABLE}.Product_SubCategory ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.Product_Type ;;
  }

  dimension: product_with_issues {
    type: string
    sql: ${TABLE}.Product_with_issues ;;
  }

  dimension: publication_status__published_ready_to_go_ {
    type: string
    sql: ${TABLE}.Publication_Status__Published_Ready_to_go_ ;;
  }

  dimension: release_date {
    type: string
    sql: ${TABLE}.Release_Date ;;
  }

  dimension: sample {
    type: string
    sql: ${TABLE}.Sample ;;
  }

  dimension: sku_s_available {
    type: string
    sql: ${TABLE}.SKU_s_Available ;;
  }

  dimension: stock_age_date {
    type: string
    sql: ${TABLE}.Stock_Age_Date ;;
  }

  dimension: stocked_product_age {
    type: number
    sql: ${TABLE}.Stocked_Product_Age ;;
  }

  dimension: strapline_long {
    type: string
    sql: ${TABLE}.Strapline_Long ;;
  }

  dimension: strapline_short {
    type: string
    sql: ${TABLE}.Strapline_Short ;;
  }

  dimension: string_field_367 {
    type: string
    sql: ${TABLE}.string_field_367 ;;
  }

  dimension: supplier {
    type: string
    sql: ${TABLE}.Supplier ;;
  }

  dimension: supplier_code {
    type: string
    sql: ${TABLE}.Supplier_Code ;;
  }

  dimension: true_mag {
    type: string
    sql: ${TABLE}.True_Mag ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  dimension: ungroup_gp_ {
    type: string
    sql: ${TABLE}.Ungroup_GP_ ;;
  }

  dimension: ungroup_sv_units {
    type: string
    sql: ${TABLE}.Ungroup_SV_Units ;;
  }

  dimension: ungroup_units {
    type: string
    sql: ${TABLE}.Ungroup_Units ;;
  }

  dimension: vat_code {
    type: string
    sql: ${TABLE}.VAT_Code ;;
  }

  dimension: web_colour {
    type: string
    sql: ${TABLE}.Web_Colour ;;
  }

  dimension: web_filter {
    type: string
    sql: ${TABLE}.Web_Filter ;;
  }

  dimension: web_live {
    type: string
    sql: ${TABLE}.web_live ;;
  }

  dimension: webgroup {
    type: string
    sql: ${TABLE}.Webgroup ;;
  }


  dimension: worn {
    type: string
    sql: ${TABLE}.Worn ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
