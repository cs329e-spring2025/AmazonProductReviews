

SELECT
    user_id,
    username,
    NULL as review_id,
    _data_source,
    _load_time

FROM `amazon-product-reviews-452322`.`jaffle_shop`.`stg_prime_users`