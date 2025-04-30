{{ config(materialized='table') }}

WITH membership_info AS (
    SELECT
        user_id,
        subscription_plan
    FROM {{ ref('int_membership_info') }}
    WHERE subscription_plan IS NOT NULL
      AND user_id IS NOT NULL

),

product_reviews AS (
    SELECT
        user_id,
        rating
    FROM {{ ref('int_product_reviews') }}
    WHERE rating IS NOT NULL
      AND user_id IS NOT NULL

)

SELECT
    mi.subscription_plan,
    AVG(pr.rating) AS average_rating
FROM
    membership_info AS mi
INNER JOIN
    product_reviews AS pr
    ON mi.user_id = pr.user_id
GROUP BY
    mi.subscription_plan
