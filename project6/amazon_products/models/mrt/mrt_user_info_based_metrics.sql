WITH user_info AS (
    SELECT *
    FROM {{ ref('int_user_info') }}
),

users AS (
    SELECT user_id
    FROM {{ ref('int_user') }}
),

product_reviews AS (
    SELECT user_id, rating
    FROM {{ ref('int_product_reviews') }}
),

unnested_genres AS (
    SELECT
        user_id,
        TRIM(genre) AS genre
    FROM
        user_info,
        UNNEST(SPLIT(favorite_genres, ',')) AS genre
    WHERE
        favorite_genres IS NOT NULL
        AND favorite_genres != ''
),

joined_data AS (
    SELECT
        ui.user_id,
        ui.devices_used,
        ui.feedback_ratings,
        ui.customer_support_interactions,
        ui.usage_frequency,
        pr.rating,
        ug.genre
    FROM user_info AS ui
    INNER JOIN users AS u ON ui.user_id = u.user_id
    INNER JOIN product_reviews AS pr ON u.user_id = pr.user_id
    INNER JOIN unnested_genres AS ug ON ui.user_id = ug.user_id
    WHERE ug.genre != ''

)

SELECT
    jd.devices_used AS device_type,
    COUNT(DISTINCT jd.user_id) AS total_reviews_users,
    AVG(jd.rating) AS average_rating,
    AVG(jd.feedback_ratings) AS average_feedback,
    COUNT(CASE WHEN jd.customer_support_interactions > 5 THEN 1 END) AS high_interaction_users,
    jd.usage_frequency,
    COUNT(DISTINCT jd.user_id) AS user_count_by_frequency,
    jd.genre,
    AVG(jd.rating) AS average_rating_by_genre,
    COUNT(DISTINCT jd.user_id) AS genre_user_count
FROM
    joined_data jd
GROUP BY
    jd.devices_used,
    jd.usage_frequency,
    jd.genre
