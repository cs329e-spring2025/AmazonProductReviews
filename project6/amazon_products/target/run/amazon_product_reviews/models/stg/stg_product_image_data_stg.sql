
  
    

    create or replace table `amazon-product-reviews-452322`.`jaffle_shop`.`stg_product_image_data_stg`
      
    
    

    OPTIONS()
    as (
      

SELECT
    review_id,
    asin,
    parent_asin,
    variant,
    brand_name,
    product_name,
    main_category,
    subcategory_1,
    subcategory_2,
    subcategory_3,
    subcategory_4,
    subcategory_5,
    list_price,
    selling_price,
    about_product,
    product_technical,
    url,
    detected_text,
    dominant_colors,
    object_features,
    logo_detection,
    text_sentiment,
    object_detection,
    image_quality_clarity,
    image_quality_lighting,
    image_quality_watermarks,
    product_condition,
    packaging_type,
    target_demographic,
    competitor_products,
    background_type,
    product_completeness,
    viewing_angles,
    scale_reference,
    assembly_stage,
    promotional_badges,
    comparative_elements,
    certifications,
    seasonal_theme,
    special_edition,
    interface_visibility,
    controls_shown,
    ergonomic_highlights,
    accessories_shown,
    usage_environment,
    color_harmony_score,
    style_classification,
    visual_complexity,
    symmetry_score,
    focal_area,
    image_path,
    analysis_timestamp

FROM `amazon-product-reviews-452322`.`product_data_raw`.`product-image-data-all`
    );
  