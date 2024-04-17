{{ config(materialized='table') }}

select year,
period,
index_nsa
from{{ref('house_price_index_cincinnati')}}