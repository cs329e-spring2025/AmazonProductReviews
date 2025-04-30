{{ config(
    materialized='table',          
) }}

SELECT
    *
FROM {{ source('product_data_int', 'User_Reviews') }}