{{ config(materialized='table') }}


SELECT *
FROM {{ ref('stg_product_image_data_stg') }}
