WITH user_info AS (
    SELECT favorite_genres
    FROM {{ ref('int_user_info') }}

),

unnested_genres AS (
    SELECT
        TRIM(genre) AS genre
    FROM
        user_info,
        UNNEST(SPLIT(favorite_genres, ',')) AS genre
    WHERE
        favorite_genres IS NOT NULL
        AND favorite_genres != ''

)
SELECT
    genre,
    COUNT(*) AS count
FROM
    unnested_genres
WHERE
    genre != ''
GROUP BY
    genre
ORDER BY
    count DESC
