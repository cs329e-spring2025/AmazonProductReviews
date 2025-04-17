

  create or replace view `amazon-product-reviews-452322`.`jaffle_shop`.`mart_avg_rating_review_count_by_device`
  OPTIONS()
  as WITH user_info AS (

    SELECT
        user_id,
        devices_used,
        feedback_ratings,
        customer_support_interactions
    FROM `amazon-product-reviews-452322`.`jaffle_shop`.`int_user_info`
    WHERE devices_used IS NOT NULL
      AND user_id IS NOT NULL

),

product_reviews AS (

    SELECT
        user_id,
        rating
    FROM `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_reviews`
    WHERE rating IS NOT NULL
      AND user_id IS NOT NULL

)

SELECT
    ui.devices_used AS device_type,
    COUNT(DISTINCT pr.user_id) AS total_reviewing_users, -- Count of distinct users who reviewed
    AVG(ui.feedback_ratings) AS average_feedback_rating,
    AVG(pr.rating) AS average_rating,
    COUNT(CASE WHEN ui.customer_support_interactions > 5 THEN 1 END) AS high_interaction_users -- Kept logic from BQ query
FROM
    user_info AS ui
INNER JOIN
    product_reviews AS pr
    ON ui.user_id = pr.user_id
GROUP BY
    ui.devices_used;

