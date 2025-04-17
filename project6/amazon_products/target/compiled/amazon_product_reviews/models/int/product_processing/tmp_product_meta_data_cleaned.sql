

WITH source_data AS (
    SELECT *
    FROM `amazon-product-reviews-452322`.`jaffle_shop`.`stg_product_meta_data_2`
),

cleaned_price AS (
    SELECT
        *,
        CASE
            WHEN selling_price IS NOT NULL AND REGEXP_CONTAINS(CAST(selling_price AS STRING), r'-')
                THEN REGEXP_EXTRACT(CAST(selling_price AS STRING), r'(\d+\.\d+)')
            WHEN selling_price IS NOT NULL AND REGEXP_CONTAINS(CAST(selling_price AS STRING), r'\d+\s+\d+')
                THEN REGEXP_REPLACE(REGEXP_REPLACE(CAST(selling_price AS STRING), r'[^\d ]', ''), r'(\d+)\s+(\d+)', r'\1.\2')
            WHEN selling_price IS NOT NULL AND REGEXP_CONTAINS(CAST(selling_price AS STRING), r'\d+\.\d+')
                THEN REGEXP_EXTRACT(CAST(selling_price AS STRING), r'(\d+\.\d+)')
            ELSE NULL
        END AS cleaned_selling_price_str
    FROM source_data
)

SELECT
    product_id,
    product_name,
    brand_name,
    asin,
    category,
    upc_ean_code,
    list_price,
    SAFE_CAST(cleaned_selling_price_str AS FLOAT64) AS selling_price,
    quantity,
    model_number,
    about_product,
    CONCAT(
        IFNULL(product_specification, ''),
        CASE
            WHEN list_price IS NOT NULL THEN CONCAT(' List Price: ', list_price)
            ELSE ''
        END
    ) AS product_specification,
    technical_details,
    shipping_weight,
    product_dimensions,
    image_urls,
    product_urls,
    variants,
    sku,
    stock,
    product_details,
    _data_source,
    _load_time
FROM cleaned_price