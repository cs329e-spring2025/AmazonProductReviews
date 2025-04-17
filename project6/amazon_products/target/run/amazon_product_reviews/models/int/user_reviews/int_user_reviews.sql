
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`int_user_reviews`
        
  (
    user_id string,
    review_id string,
    
    primary key (review_id) not enforced
    )

      
    
    

    OPTIONS()
    as (
      
    select user_id, review_id
    from (
        

SELECT
    *
FROM `amazon-product-reviews-452322`.`product_data_int`.`User_Reviews`
    ) as model_subq
    );
  