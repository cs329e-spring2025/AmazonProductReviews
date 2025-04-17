
    
    

with dbt_test__target as (

  select review_id as unique_field
  from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_reviews`
  where review_id is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


