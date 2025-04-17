{{ config(
    materialized='table'
) }}

SELECT
    *
FROM {{ source('product_data_int', 'Product_Reviews') }}