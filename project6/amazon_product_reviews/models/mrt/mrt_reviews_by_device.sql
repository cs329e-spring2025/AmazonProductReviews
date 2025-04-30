{{ config(materialized='table') }}
WITH user_info AS (

    SELECT
        user_id,
        devices_used
    FROM {{ ref('int_user_info') }}
    WHERE devices_used IS NOT NULL
      AND user_id IS NOT NULL

),

product_reviews AS (

    SELECT
        user_id
    FROM {{ ref('int_product_reviews') }}
    WHERE user_id IS NOT NULL

)

SELECT
    ui.devices_used AS device_type,
    COUNT(*) AS total_reviews
FROM
    user_info AS ui
INNER JOIN
    product_reviews AS pr
    ON ui.user_id = pr.user_id
GROUP BY
    ui.devices_used
