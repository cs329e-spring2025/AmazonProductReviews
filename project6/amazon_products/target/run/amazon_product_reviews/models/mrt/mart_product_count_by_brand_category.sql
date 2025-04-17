

  create or replace view `amazon-product-reviews-452322`.`jaffle_shop`.`mart_product_count_by_brand_category`
  OPTIONS()
  as SELECT
    pid.brand_name,
    pid.main_category,
    COUNT(DISTINCT pid.product_id) AS product_count
FROM
    `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_image_data` AS pid
WHERE
    pid.brand_name IS NOT NULL
    AND pid.main_category IS NOT NULL
    AND pid.product_id IS NOT NULL
GROUP BY
    pid.brand_name,
    pid.main_category;

