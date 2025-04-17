

  create or replace view `amazon-product-reviews-452322`.`jaffle_shop`.`mrt_subscription_plan_distribution`
  OPTIONS()
  as SELECT
    mi.subscription_plan,
    COUNT(DISTINCT mi.user_id) AS user_count
FROM
    `amazon-product-reviews-452322`.`jaffle_shop`.`int_membership_info` AS mi
WHERE
    mi.subscription_plan IS NOT NULL
GROUP BY
    mi.subscription_plan;

