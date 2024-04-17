{{ config(materialized='table') }}

with source as (
  select
    *
  from {{ ref('stg_Real_estate_sales_data') }}
  where date_recorded is not null
  and REGEXP_CONTAINS(date_recorded, r'^\d{2}/\d{2}/\d{4}$')
),

indexed as (
  select 
    *
  from {{ ref('cin_index') }}
)

select 
  s.serial_number,
  s.list_year,
  s.date_recorded,
  s.town,
  s.address,
  s.assessed_value,
  s.sale_amount,
  s.sales_ratio,
  s.property_type,
  s.residential_type,
  s.non_use_code,
  i.index_nsa
from 
  source s
left join 
  indexed i
on 
  extract(year from parse_date('%m/%d/%Y', s.date_recorded)) = i.year
and
  case
    when extract(month from parse_date('%m/%d/%Y', s.date_recorded)) in (1, 2, 3) then 1
    when extract(month from parse_date('%m/%d/%Y', s.date_recorded)) in (4, 5, 6) then 2
    when extract(month from parse_date('%m/%d/%Y', s.date_recorded)) in (7, 8, 9) then 3
    else 4
  end = i.period
