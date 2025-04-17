WITH user_info AS (

    SELECT
        user_id,
        devices_used,
        feedback_ratings
    FROM `amazon-product-reviews-452322`.`jaffle_shop`.`int_user_info`
    WHERE devices_used IS NOT NULL
      AND user_id IS NOT NULL

),

product_reviews AS (

    SELECT
        user_id,
        rating,
        review_id
    FROM `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_reviews`
    WHERE rating IS NOT NULL
      AND user_id IS NOT NULL
      AND review_id IS NOT NULL

)

SELECT
    ui.devices_used AS device_type,
    AVG(pr.rating) AS average_rating,
    COUNT(pr.review_id) AS total_reviews,
    AVG(ui.feedback_ratings) AS average_feedback_rating
FROM
    user_info AS ui
INNER JOIN
    product_reviews AS pr
    ON ui.user_id = pr.user_id
GROUP BY
    ui.devices_used