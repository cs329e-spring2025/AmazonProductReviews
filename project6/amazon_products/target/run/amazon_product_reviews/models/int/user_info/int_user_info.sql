
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`int_user_info`
        
  (
    user_id string,
    name string,
    email_address string,
    date_of_birth date,
    gender string,
    location string,
    usage_frequency string,
    purchase_history string,
    favorite_genres string,
    devices_used string,
    engagement_metrics string,
    feedback_ratings float64,
    customer_support_interactions int64,
    _data_source string,
    _load_time timestamp,
    
    primary key (user_id) not enforced
    )

      
    
    

    OPTIONS()
    as (
      
    select user_id, name, email_address, date_of_birth, gender, location, usage_frequency, purchase_history, favorite_genres, devices_used, engagement_metrics, feedback_ratings, customer_support_interactions, _data_source, _load_time
    from (
        

SELECT
    user_id,
    name,
    email_address,
    date_of_birth,
    gender,
    location,
    usage_frequency,
    purchase_history,
    favorite_genres,
    devices_used,
    engagement_metrics,
    feedback_ratings,
    customer_support_interactions,
    _data_source,
    _load_time
FROM `amazon-product-reviews-452322`.`jaffle_shop`.`stg_prime_users`
    ) as model_subq
    );
  