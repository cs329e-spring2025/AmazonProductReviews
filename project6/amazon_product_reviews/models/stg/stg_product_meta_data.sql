{{ config(materialized='table') }}

SELECT * FROM {{ ref('stg_products_meta_appliances') }}
UNION ALL
SELECT * FROM {{ ref('stg_products_meta_automotive') }}
UNION ALL
SELECT * FROM {{ ref('stg_products_meta_books') }}
UNION ALL
SELECT * FROM {{ ref('stg_products_meta_digital_music') }}
UNION ALL
SELECT * FROM {{ ref('stg_products_meta_gift_cards') }}
UNION ALL
SELECT * FROM {{ ref('stg_products_meta_magazine_subscriptions') }}
UNION ALL
SELECT * FROM {{ ref('stg_products_meta_movies_and_tv') }}
