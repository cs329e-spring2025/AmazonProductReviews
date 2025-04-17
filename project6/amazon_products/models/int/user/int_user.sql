{{ config(
    materialized='table'
) }}

SELECT
    user_id,
    username,
    NULL as review_id,
    _data_source,
    _load_time

FROM {{ ref('stg_prime_users') }}