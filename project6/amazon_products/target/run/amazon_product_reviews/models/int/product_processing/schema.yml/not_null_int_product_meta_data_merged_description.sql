select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select description
from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
where description is null



      
    ) dbt_internal_test