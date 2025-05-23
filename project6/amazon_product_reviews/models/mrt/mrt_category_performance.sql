{{ config(materialized='table') }}

WITH categories AS (

    SELECT main_category
    FROM {{ ref('int_categories') }}
    WHERE main_category IS NOT NULL
    GROUP BY main_category

),

product_meta_data AS (

    SELECT main_category, average_rating, title
    FROM {{ ref('int_product_meta_data_merged') }}
    WHERE average_rating IS NOT NULL
      AND main_category IS NOT NULL

)

SELECT
    c.main_category,
    AVG(pmdm.average_rating) AS avg_rating,
    COUNT(pmdm.title) AS total_products
FROM
    categories AS c
INNER JOIN
    product_meta_data AS pmdm
    ON c.main_category = pmdm.main_category
GROUP BY
    c.main_category
