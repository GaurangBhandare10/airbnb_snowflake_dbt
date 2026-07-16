{{config(
    materialized='incremental',
    unique_key='HOST_ID'
)}}

select HOST_ID, REPLACE(HOST_NAME, ' ', '_') as HOST_NAME, HOST_SINCE, IS_SUPERHOST, RESPONSE_RATE, 
CASE 
WHEN RESPONSE_RATE > 95 THEN 'Excellent'
WHEN RESPONSE_RATE >= 80 AND RESPONSE_RATE <= 95 THEN 'Good'
WHEN RESPONSE_RATE < 80 THEN 'Poor'
END AS RESPONSE_CATEGORY, CREATED_AT
from {{ ref('bronze_hosts') }}