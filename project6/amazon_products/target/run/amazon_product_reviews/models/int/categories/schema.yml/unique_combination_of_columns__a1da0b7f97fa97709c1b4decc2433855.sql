select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        main_category, subcategory_1, subcategory_2, subcategory_3, subcategory_4, subcategory_5, subcategory_6, subcategory_7, subcategory_8
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_categories`
    group by main_category, subcategory_1, subcategory_2, subcategory_3, subcategory_4, subcategory_5, subcategory_6, subcategory_7, subcategory_8
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test