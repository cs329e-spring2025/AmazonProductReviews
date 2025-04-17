

SELECT
    user_id,
    membership_start_date,
    membership_end_date,
    subscription_plan,
    payment_information,
    renewal_status,
    _data_source,
    _load_time
FROM `amazon-product-reviews-452322`.`jaffle_shop`.`stg_prime_users`