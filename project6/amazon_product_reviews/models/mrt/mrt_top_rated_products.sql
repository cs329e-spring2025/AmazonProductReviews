{{ config(materialized='table') }}
WITH product_reviews AS (

    SELECT
        asin,
        rating
    FROM {{ ref('int_product_reviews') }}
    WHERE rating IS NOT NULL
      AND asin IS NOT NULL

)

SELECT
    pr.asin,
    AVG(pr.rating) AS average_rating
FROM
    product_reviews AS pr
GROUP BY
    pr.asin
ORDER BY
    average_rating DESC
LIMIT 5
