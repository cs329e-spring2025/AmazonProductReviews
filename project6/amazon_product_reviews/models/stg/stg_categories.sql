{{ config(
    materialized='table',          
) }}

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
FROM {{ source('product_data_raw', 'categories') }}