

SELECT
    main_category,
    title,
    SAFE_CAST(average_rating AS FLOAT64) AS average_rating,
    SAFE_CAST(rating_number AS INT64) AS rating_number,
    NULLIF(features, '[]') AS features,
    NULLIF(description, '[]') AS description,
    SAFE_CAST(NULLIF(CAST(price AS STRING), '') AS FLOAT64) AS price,
    REGEXP_REPLACE(store, r'[^a-zA-Z0-9\s]', '') AS store,
    JSON_QUERY_ARRAY(images) AS images,
    JSON_QUERY_ARRAY(videos) AS videos,
    JSON_QUERY_ARRAY(categories) AS categories,
    details,
    parent_asin,
    NULLIF(bought_together, 'null') AS bought_together,
    _data_source,
    _load_time
FROM `amazon-product-reviews-452322`.`product_data_raw`.`Products_Meta_Movies_And_Tv`