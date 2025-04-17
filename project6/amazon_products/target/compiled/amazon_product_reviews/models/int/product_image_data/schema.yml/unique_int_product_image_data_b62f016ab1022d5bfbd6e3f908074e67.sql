
    
    

with dbt_test__target as (

  select ['product_id', 'product_name', 'object_features'] as unique_field
  from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_image_data`
  where ['product_id', 'product_name', 'object_features'] is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


