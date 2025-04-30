{{ config(
    materialized='table'
) }}

SELECT
    user_id,
    name,
    email_address,
    date_of_birth,
    gender,
    location,
    usage_frequency,
    purchase_history,
    favorite_genres,
    devices_used,
    engagement_metrics,
    feedback_ratings,
    customer_support_interactions,
    _data_source,
    _load_time
FROM {{ ref('stg_prime_users') }}
