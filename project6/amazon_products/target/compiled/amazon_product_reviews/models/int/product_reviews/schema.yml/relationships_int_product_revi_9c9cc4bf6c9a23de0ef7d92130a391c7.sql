
    
    

with child as (
    select asin as from_field
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_reviews`
    where asin is not null
),

parent as (
    select asin as to_field
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


