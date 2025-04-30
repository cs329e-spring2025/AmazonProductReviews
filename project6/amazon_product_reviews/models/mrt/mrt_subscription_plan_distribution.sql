{{ config(materialized='table') }}
SELECT
    mi.subscription_plan,
    COUNT(DISTINCT mi.user_id) AS user_count
FROM
    {{ ref('int_membership_info') }} AS mi
WHERE
    mi.subscription_plan IS NOT NULL
GROUP BY
    mi.subscription_plan
