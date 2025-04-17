





with validation_errors as (

    select
        not_null, review_id
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_reviews`
    group by not_null, review_id
    having count(*) > 1

)

select *
from validation_errors


