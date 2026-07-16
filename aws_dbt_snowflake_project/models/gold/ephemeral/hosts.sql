{{config(materialized='ephemeral')}}

with hosts as (
    select  
    host_id,
    host_name,
    host_since,
    RESPONSE_CATEGORY,
    host_created_at
    from {{ ref('obt') }}
)

select * from hosts