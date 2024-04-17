{{ config(materialized='view') }}  

with source as (
  select
    {{ dbt.safe_cast("Serial_Number", api.Column.translate_type("INTEGER")) }} as serial_number,
    {{ dbt.safe_cast("List_Year", api.Column.translate_type("INTEGER")) }} as list_year,
    {{ dbt.safe_cast("Date_Recorded", api.Column.translate_type("STRING")) }} as date_recorded,
    {{ dbt.safe_cast("Town", api.Column.translate_type("STRING")) }} as town,
    {{ dbt.safe_cast("Address", api.Column.translate_type("STRING")) }} as address,
    {{ dbt.safe_cast("Assessed_Value", api.Column.translate_type("FLOAT")) }} as assessed_value,
    {{ dbt.safe_cast("Sale_Amount", api.Column.translate_type("FLOAT")) }} as sale_amount,
    {{ dbt.safe_cast("Sales_Ratio", api.Column.translate_type("FLOAT")) }} as sales_ratio,
    {{ dbt.safe_cast("Property_Type", api.Column.translate_type("STRING")) }} as property_type,
    {{ dbt.safe_cast("Residential_Type", api.Column.translate_type("STRING")) }} as residential_type,
    {{ dbt.safe_cast("Non_Use_Code", api.Column.translate_type("STRING")) }} as non_use_code
    
  from {{ source('staging','Real_estate_sales_data') }}
),

renamed as (
  select
    serial_number,
    list_year,
    date_recorded,
    town,
    address,
    assessed_value,
    sale_amount,
    sales_ratio,
    property_type,
    residential_type,
    non_use_code
  from source
)

select * from renamed
