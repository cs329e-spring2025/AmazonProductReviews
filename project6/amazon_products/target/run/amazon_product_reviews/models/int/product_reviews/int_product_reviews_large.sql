
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_reviews_large`
      
    
    

    OPTIONS()
    as (
      





    

        (
            select
                cast('''`amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_appliances`''' as string) as _dbt_source_relation,

                
                    cast(`rating` as FLOAT64) as `rating` ,
                    cast(`title` as STRING) as `title` ,
                    cast(`text` as STRING) as `text` ,
                    cast(`images` as ARRAY<STRING>) as `images` ,
                    cast(`asin` as STRING) as `asin` ,
                    cast(`parent_asin` as STRING) as `parent_asin` ,
                    cast(`user_id` as STRING) as `user_id` ,
                    cast(`review_date` as DATE) as `review_date` ,
                    cast(`helpful_vote` as INT64) as `helpful_vote` ,
                    cast(`verified_purchase` as BOOLEAN) as `verified_purchase` ,
                    cast(`details` as STRING) as `details` ,
                    cast(`videos` as ARRAY<STRING>) as `videos` ,
                    cast(`_data_source` as STRING) as `_data_source` ,
                    cast(`_load_time` as TIMESTAMP) as `_load_time` 

            from `amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_appliances`

            
        )

        union all
        

        (
            select
                cast('''`amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_automotive`''' as string) as _dbt_source_relation,

                
                    cast(`rating` as FLOAT64) as `rating` ,
                    cast(`title` as STRING) as `title` ,
                    cast(`text` as STRING) as `text` ,
                    cast(`images` as ARRAY<STRING>) as `images` ,
                    cast(`asin` as STRING) as `asin` ,
                    cast(`parent_asin` as STRING) as `parent_asin` ,
                    cast(`user_id` as STRING) as `user_id` ,
                    cast(`review_date` as DATE) as `review_date` ,
                    cast(`helpful_vote` as INT64) as `helpful_vote` ,
                    cast(`verified_purchase` as BOOLEAN) as `verified_purchase` ,
                    cast(`details` as STRING) as `details` ,
                    cast(`videos` as ARRAY<STRING>) as `videos` ,
                    cast(`_data_source` as STRING) as `_data_source` ,
                    cast(`_load_time` as TIMESTAMP) as `_load_time` 

            from `amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_automotive`

            
        )

        union all
        

        (
            select
                cast('''`amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_books`''' as string) as _dbt_source_relation,

                
                    cast(`rating` as FLOAT64) as `rating` ,
                    cast(`title` as STRING) as `title` ,
                    cast(`text` as STRING) as `text` ,
                    cast(`images` as ARRAY<STRING>) as `images` ,
                    cast(`asin` as STRING) as `asin` ,
                    cast(`parent_asin` as STRING) as `parent_asin` ,
                    cast(`user_id` as STRING) as `user_id` ,
                    cast(`review_date` as DATE) as `review_date` ,
                    cast(`helpful_vote` as INT64) as `helpful_vote` ,
                    cast(`verified_purchase` as BOOLEAN) as `verified_purchase` ,
                    cast(`details` as STRING) as `details` ,
                    cast(`videos` as ARRAY<STRING>) as `videos` ,
                    cast(`_data_source` as STRING) as `_data_source` ,
                    cast(`_load_time` as TIMESTAMP) as `_load_time` 

            from `amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_books`

            
        )

        union all
        

        (
            select
                cast('''`amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_digital_music`''' as string) as _dbt_source_relation,

                
                    cast(`rating` as FLOAT64) as `rating` ,
                    cast(`title` as STRING) as `title` ,
                    cast(`text` as STRING) as `text` ,
                    cast(`images` as ARRAY<STRING>) as `images` ,
                    cast(`asin` as STRING) as `asin` ,
                    cast(`parent_asin` as STRING) as `parent_asin` ,
                    cast(`user_id` as STRING) as `user_id` ,
                    cast(`review_date` as DATE) as `review_date` ,
                    cast(`helpful_vote` as INT64) as `helpful_vote` ,
                    cast(`verified_purchase` as BOOLEAN) as `verified_purchase` ,
                    cast(`details` as STRING) as `details` ,
                    cast(`videos` as ARRAY<STRING>) as `videos` ,
                    cast(`_data_source` as STRING) as `_data_source` ,
                    cast(`_load_time` as TIMESTAMP) as `_load_time` 

            from `amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_digital_music`

            
        )

        union all
        

        (
            select
                cast('''`amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_gift_cards`''' as string) as _dbt_source_relation,

                
                    cast(`rating` as FLOAT64) as `rating` ,
                    cast(`title` as STRING) as `title` ,
                    cast(`text` as STRING) as `text` ,
                    cast(`images` as ARRAY<STRING>) as `images` ,
                    cast(`asin` as STRING) as `asin` ,
                    cast(`parent_asin` as STRING) as `parent_asin` ,
                    cast(`user_id` as STRING) as `user_id` ,
                    cast(`review_date` as DATE) as `review_date` ,
                    cast(`helpful_vote` as INT64) as `helpful_vote` ,
                    cast(`verified_purchase` as BOOLEAN) as `verified_purchase` ,
                    cast(`details` as STRING) as `details` ,
                    cast(`videos` as ARRAY<STRING>) as `videos` ,
                    cast(`_data_source` as STRING) as `_data_source` ,
                    cast(`_load_time` as TIMESTAMP) as `_load_time` 

            from `amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_gift_cards`

            
        )

        union all
        

        (
            select
                cast('''`amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_magazine_subscriptions`''' as string) as _dbt_source_relation,

                
                    cast(`rating` as FLOAT64) as `rating` ,
                    cast(`title` as STRING) as `title` ,
                    cast(`text` as STRING) as `text` ,
                    cast(`images` as ARRAY<STRING>) as `images` ,
                    cast(`asin` as STRING) as `asin` ,
                    cast(`parent_asin` as STRING) as `parent_asin` ,
                    cast(`user_id` as STRING) as `user_id` ,
                    cast(`review_date` as DATE) as `review_date` ,
                    cast(`helpful_vote` as INT64) as `helpful_vote` ,
                    cast(`verified_purchase` as BOOLEAN) as `verified_purchase` ,
                    cast(`details` as STRING) as `details` ,
                    cast(`videos` as ARRAY<STRING>) as `videos` ,
                    cast(`_data_source` as STRING) as `_data_source` ,
                    cast(`_load_time` as TIMESTAMP) as `_load_time` 

            from `amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_magazine_subscriptions`

            
        )

        union all
        

        (
            select
                cast('''`amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_movies_and_tv`''' as string) as _dbt_source_relation,

                
                    cast(`rating` as FLOAT64) as `rating` ,
                    cast(`title` as STRING) as `title` ,
                    cast(`text` as STRING) as `text` ,
                    cast(`images` as ARRAY<STRING>) as `images` ,
                    cast(`asin` as STRING) as `asin` ,
                    cast(`parent_asin` as STRING) as `parent_asin` ,
                    cast(`user_id` as STRING) as `user_id` ,
                    cast(`review_date` as DATE) as `review_date` ,
                    cast(`helpful_vote` as INT64) as `helpful_vote` ,
                    cast(`verified_purchase` as BOOLEAN) as `verified_purchase` ,
                    cast(`details` as STRING) as `details` ,
                    cast(`videos` as ARRAY<STRING>) as `videos` ,
                    cast(`_data_source` as STRING) as `_data_source` ,
                    cast(`_load_time` as TIMESTAMP) as `_load_time` 

            from `amazon-product-reviews-452322`.`jaffle_shop`.`stg_reviews_movies_and_tv`

            
        )

        
    );
  