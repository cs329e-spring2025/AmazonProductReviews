
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`int_categories`
        
  (
    main_category string,
    subcategory_1 string,
    subcategory_2 string,
    subcategory_3 string,
    subcategory_4 string,
    subcategory_5 string,
    subcategory_6 string,
    subcategory_7 string,
    subcategory_8 string,
    _data_source string,
    _load_time timestamp
    
    )

      
    
    

    OPTIONS()
    as (
      
    select main_category, subcategory_1, subcategory_2, subcategory_3, subcategory_4, subcategory_5, subcategory_6, subcategory_7, subcategory_8, _data_source, _load_time
    from (
        

SELECT
    main_category,
    subcategory_1,
    subcategory_2,
    subcategory_3,
    subcategory_4,
    subcategory_5,
    subcategory_6,
    subcategory_7,
    subcategory_8,
    _data_source,
    _load_time

FROM
    `amazon-product-reviews-452322`.`jaffle_shop`.`stg_categories`

QUALIFY ROW_NUMBER() OVER (
    PARTITION BY
        main_category,
        subcategory_1,
        subcategory_2,
        subcategory_3,
        subcategory_4,
        subcategory_5,
        subcategory_6,
        subcategory_7,
        subcategory_8
    ORDER BY
        _load_time DESC
) = 1
    ) as model_subq
    );
  