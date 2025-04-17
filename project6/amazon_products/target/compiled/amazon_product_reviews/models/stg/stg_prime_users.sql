

SELECT
    CAST(user_id AS STRING) AS user_id,
    name,
    email_address,
    username,
    CAST(date_of_birth AS DATE) AS date_of_birth,
    gender,
    location,
    CAST(membership_start_date AS DATE) AS membership_start_date,
    CAST(membership_end_date AS DATE) AS membership_end_date,
    subscription_plan,
    payment_information,
    renewal_status,
    usage_frequency,
    purchase_history,
    favorite_genres,
    devices_used,
    engagement_metrics,
    CAST(feedback_ratings AS FLOAT64) AS feedback_ratings,
    CAST(customer_support_interactions AS INT64) AS customer_support_interactions,
    _data_source,
    _load_time
FROM `amazon-product-reviews-452322`.`product_data_raw`.`amazon_prime_users`