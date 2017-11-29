view: crm_data {
  sql_table_name: `43786551`.CRM_Data_2
    ;;

  dimension: customer_group {
    type: string
    sql: ${TABLE}.Customer_Group ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: last_order_cust_core {
    type: date
    sql: ${TABLE}.Last_Order_Cust_Core ;;
  }

  dimension: last_order_device_type {
    type: string
    sql: ${TABLE}.Last_Order_Device_Type ;;
  }

  dimension: last_visit_date {
    type: date
    sql: ${TABLE}.Last_Visit_Date ;;
  }

  dimension: latest_google_id {
    type: string
    sql: ${TABLE}.Latest_GoogleID ;;
    primary_key: yes
  }

  dimension: number_of_visits {
    type: number
    sql: ${TABLE}.Number_of_Visits ;;
  }

  dimension: personicx_individual_classification {
    type: string
    sql: ${TABLE}.Personicx_Individual_Classification ;;
  }

  dimension: postal_district {
    type: string
    sql: ${TABLE}.Postal_District ;;
  }

  dimension: total_fin_qtyrefunded {
    type: number
    sql: ${TABLE}.Total_Fin_Qtyrefunded ;;
  }

  dimension: total_orders_core_net {
    type: number
    sql: ${TABLE}.Total_Orders_Core_Net ;;
  }

  dimension: total_orders_cust_core {
    type: number
    sql: ${TABLE}.Total_Orders_Cust_Core ;;
  }

  dimension: total_value_core_net {
    type: number
    sql: ${TABLE}.Total_Value_Core_Net ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
