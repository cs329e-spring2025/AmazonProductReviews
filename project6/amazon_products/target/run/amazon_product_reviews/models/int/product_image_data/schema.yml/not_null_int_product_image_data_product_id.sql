select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_id
from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_image_data`
where product_id is null



      
    ) dbt_internal_test