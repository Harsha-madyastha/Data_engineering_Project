CREATE OR REPLACE EXTERNAL TABLE `de-zoomcamp-416715.Real_Estate_Sales_project_bq.Real_estate_sales_data`
OPTIONS (
  format = 'parquet',
  uris = ['gs://real-estate-sales-bucket/Cleaned/Real_Estate_Sales_raw.parquet']
);

SELECT DISTINCT Residential_Type FROM de-zoomcamp-416715.Real_Estate_Sales_project_bq.external_table;

CREATE OR REPLACE TABLE `de-zoomcamp-416715.Real_Estate_Sales_project_bq.salesdata_partitioned_cluster`
PARTITION BY EXTRACT(YEAR FROM CAST(PARSE_DATE('%m/%d/%Y', Date_Recorded) AS DATE))
CLUSTER BY Property_Type AS
SELECT * FROM `de-zoomcamp-416715.Real_Estate_Sales_project_bq.Real_estate_sales_data`;





CREATE OR REPLACE TABLE `de-zoomcamp-416715.Real_Estate_Sales_project_bq.salesdata_partitoned_clustered` (
`Serial Number` INTEGER,
`List Year` INTEGER,
`Date Recorded`TIMESTAMP,
`Town` STRING,
`Address` STRING,
`Assessed Value` FLOAT64,
`Sale Amount` FLOAT64,
`Sales Ratio` FLOAT64,
`Property Type` STRING,
`Residential Type` STRING,
`Non Use Code` STRING
) AS (
SELECT serial_number, list_year,CAST(date_recorded AS TIMESTAMP), cast(town AS STRING), CAST(address AS STRING),assessed_value,sale_amount,sales_ratio,
CAST(property_type AS STRING), residential_type, non_use_code
FROM `de-zoomcamp-416715.Real_Estate_Sales_project_bq.external_table`
);

SELECT date_recorded
FROM `de-zoomcamp-416715`.`dbt_hmanjunath`.`stg_Real_estate_sales_data`
LIMIT 10;

-- Query to check for anomalies in the Date_Recorded column
SELECT TO_STRING(Date_Recorded, '%Y-%m-%d') AS formatted_date
FROM `de-zoomcamp-416715.dbt_hmanjunath.stg_Real_estate_sales_data`
LIMIT 10;

-- Get dates with time (YYYY-MM-DD HH:MM:SS)
SELECT FORMAT_DATETIME('%Y-%m-%d %H:%M:%S', date_recorded) AS formatted_datetime
FROM `de-zoomcamp-416715.dbt_hmanjunath.stg_Real_estate_sales_data`
LIMIT 10;

select * from `Real_Estate_Sales_project_bq.external_table`limit 10;



