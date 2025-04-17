import pyspark.sql.functions as F

def model(dbt, session):

    dbt.config(
        materialized = "table"
    )

    merged_data_df = dbt.ref('tmp_product_meta_data_merged')

    natural_key_columns = [
        "parent_asin",
        "details",
        "description",
        "categories_str",
        "main_category",
        "_load_time"
    ]

    final_df = merged_data_df.withColumn(
        "product_metadata_pk",
        F.sha2(F.concat_ws("||", *natural_key_columns), 256)
    )

    return final_df


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args, **kwargs):
    refs = {"tmp_product_meta_data_merged": "amazon-product-reviews-452322.jaffle_shop.tmp_product_meta_data_merged"}
    key = '.'.join(args)
    version = kwargs.get("v") or kwargs.get("version")
    if version:
        key += f".v{version}"
    dbt_load_df_function = kwargs.get("dbt_load_df_function")
    return dbt_load_df_function(refs[key])


def source(*args, dbt_load_df_function):
    sources = {}
    key = '.'.join(args)
    return dbt_load_df_function(sources[key])


config_dict = {}


class config:
    def __init__(self, *args, **kwargs):
        pass

    @staticmethod
    def get(key, default=None):
        return config_dict.get(key, default)

class this:
    """dbt.this() or dbt.this.identifier"""
    database = "amazon-product-reviews-452322"
    schema = "jaffle_shop"
    identifier = "int_product_meta_data_merged"
    
    def __repr__(self):
        return 'amazon-product-reviews-452322.jaffle_shop.int_product_meta_data_merged'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args, **kwargs: ref(*args, **kwargs, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------


