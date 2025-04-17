
    
    

with child as (
    select user_id as from_field
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_membership_info`
    where user_id is not null
),

parent as (
    select user_id as to_field
    from `amazon-product-reviews-452322`.`jaffle_shop`.`int_user_info`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


