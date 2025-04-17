
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`tmp_product_meta_data_transformed`
      
    
    

    OPTIONS()
    as (
      

SELECT
    category AS main_category,
    product_name AS title,
    product_specification AS features,
    about_product AS description,
    selling_price AS price,
    image_urls AS images,
    asin,
    asin AS parent_asin,
    CAST(NULL AS FLOAT64) AS average_rating,
    CAST(NULL AS INT64) AS rating_number,
    CAST(NULL AS STRING) AS store,
    CAST(NULL AS ARRAY<STRING>) AS videos,
    CAST(NULL AS ARRAY<STRING>) AS categories,
    CAST(NULL AS STRING) AS bought_together,
    CONCAT(
            'product_details: ', IFNULL(CAST(product_details AS STRING), ''),
            ' | brand_name: ', IFNULL(CAST(brand_name AS STRING), ''),
            ' | list_price: ', IFNULL(CAST(list_price AS STRING), ''),
            ' | quantity: ', IFNULL(CAST(quantity AS STRING), ''),
            ' | model_number: ', IFNULL(CAST(model_number AS STRING), ''),
            ' | technical_details: ', IFNULL(CAST(technical_details AS STRING), ''),
            ' | shipping_weight: ', IFNULL(CAST(shipping_weight AS STRING), ''),
            ' | product_dimensions: ', IFNULL(CAST(product_dimensions AS STRING), ''),
            ' | product_urls: ', IFNULL(ARRAY_TO_STRING(product_urls, '; '), ''),
            ' | sku: ', IFNULL(CAST(sku AS STRING), ''),
            ' | image_urls: ', IFNULL(ARRAY_TO_STRING(image_urls, '; '), '')
        ) AS details,
    _data_source,
    _load_time

FROM `amazon-product-reviews-452322`.`jaffle_shop`.`tmp_product_meta_data_cleaned`
    );
  