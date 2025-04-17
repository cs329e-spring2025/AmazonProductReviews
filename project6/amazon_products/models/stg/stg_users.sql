{{ config(materialized='table') }}

SELECT
    product_id,
    product_name,
    CAST(REGEXP_REPLACE(CAST(discounted_price AS STRING), r'[^\d.]', '') AS FLOAT64) AS discounted_price,
    CAST(REGEXP_REPLACE(CAST(actual_price AS STRING), r'[^\d.]', '') AS FLOAT64) AS actual_price,
    SAFE_DIVIDE(CAST(REGEXP_REPLACE(CAST(discount_percentage AS STRING), r'[^\d]', '') AS FLOAT64), 100) AS discount_percentage,
    SAFE_CAST(rating AS FLOAT64) AS rating,
    SAFE_CAST(rating_count AS INT64) AS rating_count,
    NULLIF(about_product, '') AS about_product,
    SPLIT(CAST(user_id AS STRING), ',') AS user_id,
    SPLIT(CAST(user_name AS STRING), ',') AS user_name,
    SPLIT(CAST(review_id AS STRING), ',') AS review_id,
    SPLIT(CAST(review_title AS STRING), ',') AS review_title,
    SPLIT(CAST(review_content AS STRING), ',') AS review_content,
    img_link,
    product_link,
    _data_source,
    _load_time,
    SPLIT(CAST(category AS STRING), '|')[SAFE_OFFSET(0)] AS main_category,
    SPLIT(CAST(category AS STRING), '|')[SAFE_OFFSET(1)] AS subcategory_1,
    SPLIT(CAST(category AS STRING), '|')[SAFE_OFFSET(2)] AS subcategory_2,
    SPLIT(CAST(category AS STRING), '|')[SAFE_OFFSET(3)] AS subcategory_3,
    SPLIT(CAST(category AS STRING), '|')[SAFE_OFFSET(4)] AS subcategory_4,
    SPLIT(CAST(category AS STRING), '|')[SAFE_OFFSET(5)] AS subcategory_5,
    SPLIT(CAST(category AS STRING), '|')[SAFE_OFFSET(6)] AS subcategory_6,
    SPLIT(CAST(category AS STRING), '|')[SAFE_OFFSET(7)] AS subcategory_7,
    SPLIT(CAST(category AS STRING), '|')[SAFE_OFFSET(8)] AS subcategory_8

FROM {{ source('product_data_raw', 'user') }}
