





with validation_errors as (

    select
        product_id
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_image_data`
    group by product_id
    having count(*) > 1

)

select *
from validation_errors


