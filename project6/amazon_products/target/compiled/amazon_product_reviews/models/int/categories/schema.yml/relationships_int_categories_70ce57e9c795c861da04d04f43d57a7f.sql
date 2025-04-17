
    
    

with child as (
    select main_category as from_field
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_categories`
    where main_category is not null
),

parent as (
    select main_category as to_field
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_meta_data_merged`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


