
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`mart_top_rated_products`
      
    
    

    OPTIONS()
    as (
      

WITH product_reviews AS (

    SELECT
        asin,
        rating
    FROM `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_reviews`
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
    );
  