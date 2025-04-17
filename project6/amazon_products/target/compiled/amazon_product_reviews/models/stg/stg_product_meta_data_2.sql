

WITH source_data AS (
    SELECT *
    FROM `amazon-product-reviews-452322`.`product_data_raw`.`product_meta_data_2`
),

filtered_data AS (
    SELECT *
    FROM source_data
    WHERE
        LOWER(CAST(`Selling Price` AS STRING)) != 'total price:'
        AND NOT REGEXP_CONTAINS(CAST(`List Price` AS STRING), r'\$\d+(\.\d+)?\s*-\s*\$\d+(\.\d+)?')
        AND NOT REGEXP_CONTAINS(CAST(`Selling Price` AS STRING), r'\$\d+(\.\d+)?\s*-\s*\$\d+(\.\d+)?')
)

SELECT
    `Uniq Id` AS product_id,
    `Product Name` AS product_name,
    `Brand Name` AS brand_name,
    Asin AS asin,
    REGEXP_REPLACE(CAST(`Category` AS STRING), r'\|', ', ') AS category,
    `Upc Ean Code` AS upc_ean_code,
    CAST(NULLIF(REGEXP_REPLACE(CAST(`List Price` AS STRING), r'[$,]', ''), '') AS FLOAT64) AS list_price,
    CAST(NULLIF(REGEXP_REPLACE(CAST(`Selling Price` AS STRING), r'[$,]', ''), '') AS FLOAT64) AS selling_price,
    CAST(NULLIF(CAST(Quantity AS STRING), '') AS INT64) AS quantity,
    `Model Number` AS model_number,
    NULLIF(`About Product`, '') AS about_product,
    `Product Specification` AS product_specification,
    `Technical Details` AS technical_details,
    CAST(NULLIF(REGEXP_REPLACE(CAST(`Shipping Weight` AS STRING), r'[^\d.]', ''), '') AS FLOAT64) AS shipping_weight,
    `Product Dimensions` AS product_dimensions,
    SPLIT(NULLIF(Image, ''), '|') AS image_urls,
    SPLIT(NULLIF(`Product Url`, ''), '|') AS product_urls,
    NULLIF(Variants, '') AS variants,
    NULLIF(Sku, '') AS sku,
    NULLIF(Stock, '') AS stock,
    `Product Details` AS product_details,
    NULLIF(Dimensions, '') AS dimensions,
    NULLIF(Color, '') AS color,
    _data_source,
    _load_time,
    SPLIT(CAST(`Category` AS STRING), '|')[SAFE_OFFSET(0)] AS main_category,
    SPLIT(CAST(`Category` AS STRING), '|')[SAFE_OFFSET(1)] AS subcategory_1,
    SPLIT(CAST(`Category` AS STRING), '|')[SAFE_OFFSET(2)] AS subcategory_2,
    SPLIT(CAST(`Category` AS STRING), '|')[SAFE_OFFSET(3)] AS subcategory_3,
    SPLIT(CAST(`Category` AS STRING), '|')[SAFE_OFFSET(4)] AS subcategory_4,
    SPLIT(CAST(`Category` AS STRING), '|')[SAFE_OFFSET(5)] AS subcategory_5,
    SPLIT(CAST(`Category` AS STRING), '|')[SAFE_OFFSET(6)] AS subcategory_6,
    SPLIT(CAST(`Category` AS STRING), '|')[SAFE_OFFSET(7)] AS subcategory_7,
    SPLIT(CAST(`Category` AS STRING), '|')[SAFE_OFFSET(8)] AS subcategory_8
FROM filtered_data