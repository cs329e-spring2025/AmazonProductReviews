{{ config(materialized='table') }}
WITH product_reviews AS (

    SELECT
        verified_purchase,
        rating,
        helpful_vote,
        review_id
    FROM {{ ref('int_product_reviews') }}
    WHERE verified_purchase IS NOT NULL
      AND review_id IS NOT NULL

)

SELECT
    pr.verified_purchase,
    AVG(pr.rating) AS average_rating,
    AVG(pr.helpful_vote) AS average_helpful_votes,
    COUNT(pr.review_id) AS total_reviews
FROM
    product_reviews AS pr
GROUP BY
    pr.verified_purchase

