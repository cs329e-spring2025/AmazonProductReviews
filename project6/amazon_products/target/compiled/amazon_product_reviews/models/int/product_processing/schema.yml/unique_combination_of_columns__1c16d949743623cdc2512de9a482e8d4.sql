





with validation_errors as (

    select
        combination_of_columns
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
    group by combination_of_columns
    having count(*) > 1

)

select *
from validation_errors


