-- Use the `ref` function to select from other models

select *
from `amazon-product-reviews-452322`.`jaffle_shop`.`my_first_dbt_model`
where id = 1