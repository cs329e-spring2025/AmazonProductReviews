select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select main_category
from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
where main_category is null



      
    ) dbt_internal_test