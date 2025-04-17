
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`int_user`
        
  (
    user_id string,
    username string,
    review_id int64,
    _data_source string,
    _load_time timestamp,
    
    primary key (user_id) not enforced
    )

      
    
    

    OPTIONS()
    as (
      
    select user_id, username, review_id, _data_source, _load_time
    from (
        

SELECT
    user_id,
    username,
    NULL as review_id,
    _data_source,
    _load_time

FROM `amazon-product-reviews-452322`.`jaffle_shop`.`stg_prime_users`
    ) as model_subq
    );
  