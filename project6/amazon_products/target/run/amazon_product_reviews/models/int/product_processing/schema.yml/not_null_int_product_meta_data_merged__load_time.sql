select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select _load_time
from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
where _load_time is null



      
    ) dbt_internal_test