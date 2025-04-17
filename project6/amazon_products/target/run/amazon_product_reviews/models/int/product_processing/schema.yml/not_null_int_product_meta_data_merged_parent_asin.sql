select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select parent_asin
from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
where parent_asin is null



      
    ) dbt_internal_test