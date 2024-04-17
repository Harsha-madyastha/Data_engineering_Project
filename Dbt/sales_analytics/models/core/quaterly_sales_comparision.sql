WITH cin_index AS (
  SELECT 
    year,
    period,
    index_nsa
  FROM {{ ref('cin_index') }}
),

sales_data AS (
  SELECT
    *,
    EXTRACT(YEAR FROM PARSE_DATE('%m/%d/%Y', date_recorded)) AS sales_year,
    CASE
      WHEN EXTRACT(MONTH FROM PARSE_DATE('%m/%d/%Y', date_recorded)) IN (1, 2, 3) THEN 1
      WHEN EXTRACT(MONTH FROM PARSE_DATE('%m/%d/%Y', date_recorded)) IN (4, 5, 6) THEN 2
      WHEN EXTRACT(MONTH FROM PARSE_DATE('%m/%d/%Y', date_recorded)) IN (7, 8, 9) THEN 3
      ELSE 4
    END AS sales_quarter
  FROM {{ ref('stg_Real_estate_sales_data') }}
  where date_recorded is not null
  and REGEXP_CONTAINS(date_recorded, r'^\d{2}/\d{2}/\d{4}$')),


avg_sales_ratio AS (
  SELECT
    sales_year,
    sales_quarter,
    {% for property_type in ['Public Utility', 'Apartments', 'Industrial', 'Condo', 'Two Family', 'Single Family', 'Three Family', 'Four Family'] %}
      COALESCE(AVG(CASE WHEN property_type = '{{ property_type }}' THEN sales_ratio END), 0) AS avg_sales_ratio_{{ property_type | replace(' ', '_') }},
    {% endfor %}
  FROM sales_data
  GROUP BY sales_year, sales_quarter
)

SELECT
  c.year,
  c.period,
  c.index_nsa,
  a.*
FROM cin_index c
LEFT JOIN avg_sales_ratio a ON c.year = a.sales_year AND c.period = a.sales_quarter
