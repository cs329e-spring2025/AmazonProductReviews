select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select asin
from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_image_data`
where asin is null



      
    ) dbt_internal_test