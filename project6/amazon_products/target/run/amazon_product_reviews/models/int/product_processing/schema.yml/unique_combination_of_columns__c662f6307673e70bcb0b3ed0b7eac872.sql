select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        parent_asin, details, description, categories_str, videos_str, images_str, _load_time
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
    group by parent_asin, details, description, categories_str, videos_str, images_str, _load_time
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test