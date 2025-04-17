

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