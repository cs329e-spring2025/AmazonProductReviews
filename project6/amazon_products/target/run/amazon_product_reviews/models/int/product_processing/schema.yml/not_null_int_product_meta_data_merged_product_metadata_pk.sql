select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product_metadata_pk
from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
where product_metadata_pk is null



      
    ) dbt_internal_test