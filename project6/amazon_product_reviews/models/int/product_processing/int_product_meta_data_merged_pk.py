import pyspark.sql.functions as F
from pyspark.sql.window import Window

def model(dbt, session):

    dbt.config(
        materialized = "table"
    )

    merged_data_df = dbt.ref('int_product_meta_data_merged')

    natural_key_columns = [
        "parent_asin",
        "details",
        "description",
        "categories_str",
        "videos_str",
        "images_str",
        "main_category",
        "_load_time"
    ]

    deduplicated_df = merged_data_df.dropDuplicates(subset=natural_key_columns)
    final_df = deduplicated_df.withColumn(
        "product_metadata_pk",
        F.sha2(F.concat_ws("||", *natural_key_columns), 256)
    )
    return final_df