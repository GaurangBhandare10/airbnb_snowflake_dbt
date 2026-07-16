{{config(materialized='incremental', unique_key='LISTING_ID')}}

select listing_id, host_id , property_type, city ,country, room_type, accommodates, bathrooms, bedrooms, price_per_night, {{tag ('cast(price_per_night as INT)')}} as price_category, created_at
 from {{ ref('bronze_listings') }}