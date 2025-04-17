
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`int_membership_info`
        
  (
    user_id string,
    membership_start_date date,
    membership_end_date date,
    subscription_plan string,
    payment_information string,
    renewal_status string,
    _data_source string,
    _load_time timestamp,
    
    primary key (user_id) not enforced
    )

      
    
    

    OPTIONS()
    as (
      
    select user_id, membership_start_date, membership_end_date, subscription_plan, payment_information, renewal_status, _data_source, _load_time
    from (
        

SELECT
    user_id,
    membership_start_date,
    membership_end_date,
    subscription_plan,
    payment_information,
    renewal_status,
    _data_source,
    _load_time
FROM `amazon-product-reviews-452322`.`jaffle_shop`.`stg_prime_users`
    ) as model_subq
    );
  