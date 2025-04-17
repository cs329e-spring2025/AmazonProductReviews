{{ config(materialized='table') }}

{% set review_relations = [
    ref('stg_reviews_appliances'),
    ref('stg_reviews_automotive'),
    ref('stg_reviews_books'),
    ref('stg_reviews_digital_music'),
    ref('stg_reviews_gift_cards'),
    ref('stg_reviews_magazine_subscriptions'),
    ref('stg_reviews_movies_and_tv')
] %}


{{ dbt_utils.union_relations(relations=review_relations) }}