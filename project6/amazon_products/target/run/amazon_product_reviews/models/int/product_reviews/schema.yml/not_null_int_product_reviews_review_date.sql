select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select review_date
from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_reviews`
where review_date is null



      
    ) dbt_internal_test