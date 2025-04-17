
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
        
  (
    parent_asin string,
    main_category string,
    title string,
    average_rating float64,
    rating_number int64,
    features string,
    description string,
    price float64,
    store string,
    images_str string,
    videos_str string,
    categories_str string,
    details string,
    bought_together string,
    _data_source string,
    _load_time timestamp
    
    )

      
    
    

    OPTIONS()
    as (
      
    select parent_asin, main_category, title, average_rating, rating_number, features, description, price, store, images_str, videos_str, categories_str, details, bought_together, _data_source, _load_time
    from (
        
WITH source1 AS (
    SELECT
        CAST(parent_asin AS STRING) AS parent_asin,
        CAST(main_category AS STRING) AS main_category,
        CAST(title AS STRING) AS title,
        CAST(average_rating AS FLOAT64) AS average_rating,
        CAST(rating_number AS INT64) AS rating_number,
        CAST(features AS STRING) AS features,
        CAST(description AS STRING) AS description,
        CAST(price AS FLOAT64) AS price,
        CAST(store AS STRING) AS store,
        ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(COALESCE(images, ARRAY<STRING>[])) AS x ORDER BY x), ',', 'NULL') AS images_str,
        ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(COALESCE(videos, ARRAY<STRING>[])) AS x ORDER BY x), ',', 'NULL') AS videos_str,
        ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(COALESCE(categories, ARRAY<STRING>[])) AS x ORDER BY x), ',', 'NULL') AS categories_str,
        CAST(details AS STRING) AS details,
        CAST(bought_together AS STRING) AS bought_together,
        CAST(_data_source AS STRING) AS _data_source,
        CAST(_load_time AS TIMESTAMP) AS _load_time

    FROM `amazon-product-reviews-452322`.`jaffle_shop`.`stg_product_meta_data`
),

source2 AS (
    SELECT
        CAST(parent_asin AS STRING) AS parent_asin,
        CAST(main_category AS STRING) AS main_category,
        CAST(title AS STRING) AS title,
        CAST(average_rating AS FLOAT64) AS average_rating,
        CAST(rating_number AS INT64) AS rating_number,
        CAST(features AS STRING) AS features,
        CAST(description AS STRING) AS description,
        CAST(price AS FLOAT64) AS price,
        CAST(store AS STRING) AS store,
        ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(COALESCE(images, ARRAY<STRING>[])) AS x ORDER BY x), ',', 'NULL') AS images_str,
        ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(COALESCE(videos, ARRAY<STRING>[])) AS x ORDER BY x), ',', 'NULL') AS videos_str,
        ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(COALESCE(categories, ARRAY<STRING>[])) AS x ORDER BY x), ',', 'NULL') AS categories_str,
        CAST(details AS STRING) AS details,
        CAST(bought_together AS STRING) AS bought_together,
        CAST(_data_source AS STRING) AS _data_source,
        CAST(_load_time AS TIMESTAMP) AS _load_time

    FROM `amazon-product-reviews-452322`.`jaffle_shop`.`tmp_product_meta_data_transformed`
)

SELECT
    s1.parent_asin,
    s1.main_category,
    s1.title,
    s1.average_rating,
    s1.rating_number,
    s1.features,
    s1.description,
    s1.price,
    s1.store,
    s1.images_str,
    s1.videos_str,
    s1.categories_str,
    s1.details,
    s1.bought_together,
    s1._data_source,
    s1._load_time
FROM source1 s1
UNION ALL
SELECT
    s2.parent_asin,
    s2.main_category,
    s2.title,
    s2.average_rating,
    s2.rating_number,
    s2.features,
    s2.description,
    s2.price,
    s2.store,
    s2.images_str,
    s2.videos_str,
    s2.categories_str,
    s2.details,
    s2.bought_together,
    s2._data_source,
    s2._load_time
FROM source2 s2

QUALIFY ROW_NUMBER() OVER (
    PARTITION BY parent_asin
    ORDER BY _data_source DESC
) = 1
    ) as model_subq
    );
  