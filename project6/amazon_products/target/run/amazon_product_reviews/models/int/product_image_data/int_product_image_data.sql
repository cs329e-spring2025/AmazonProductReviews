
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`int_product_image_data`
      
    
    

    OPTIONS()
    as (
      


SELECT *
FROM `amazon-product-reviews-452322`.`jaffle_shop`.`stg_product_image_data_stg`
    );
  