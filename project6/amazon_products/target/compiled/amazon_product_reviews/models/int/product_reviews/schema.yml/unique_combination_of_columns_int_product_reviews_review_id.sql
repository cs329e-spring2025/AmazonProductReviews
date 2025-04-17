





with validation_errors as (

    select
        review_id
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_reviews`
    group by review_id
    having count(*) > 1

)

select *
from validation_errors


