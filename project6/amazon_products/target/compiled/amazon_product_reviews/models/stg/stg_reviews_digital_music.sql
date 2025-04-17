

SELECT
    SAFE_CAST(rating AS FLOAT64) AS rating,
    title,
    text,
    images,
    asin,
    parent_asin,
    user_id,
    DATE(TIMESTAMP_MILLIS(SAFE_CAST(timestamp AS INT64))) AS review_date,
    SAFE_CAST(helpful_vote AS INT64) AS helpful_vote,
    SAFE_CAST(verified_purchase AS BOOL) AS verified_purchase,
    details,
    videos,
    _data_source,
    _load_time
FROM `amazon-product-reviews-452322`.`product_data_raw`.`reviews_Digital_Music`