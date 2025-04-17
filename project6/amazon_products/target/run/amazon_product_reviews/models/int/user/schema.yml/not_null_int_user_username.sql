select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select username
from `amazon-product-reviews-452322`.`jaffle_shop`.`int_user`
where username is null



      
    ) dbt_internal_test