{{ config(
    materialized='table'
) }}

SELECT
    user_id,
    membership_start_date,
    membership_end_date,
    subscription_plan,
    payment_information,
    renewal_status,
    _data_source,
    _load_time
FROM {{ ref('stg_prime_users') }}