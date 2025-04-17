
  
    
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName('smallTest').getOrCreate()

spark.conf.set("viewsEnabled","true")
spark.conf.set("temporaryGcsBucket","dataproc_logs29471")
spark.conf.set("enableListInference", "True")


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



dbt = dbtObj(spark.read.format("bigquery").load)
df = model(dbt, spark)

# COMMAND ----------
# this is materialization code dbt generated, please do not modify

import pyspark
# make sure pandas exists before using it
try:
  import pandas
  pandas_available = True
except ImportError:
  pandas_available = False

# make sure pyspark.pandas exists before using it
try:
  import pyspark.pandas
  pyspark_pandas_api_available = True
except ImportError:
  pyspark_pandas_api_available = False

# make sure databricks.koalas exists before using it
try:
  import databricks.koalas
  koalas_available = True
except ImportError:
  koalas_available = False

# preferentially convert pandas DataFrames to pandas-on-Spark or Koalas DataFrames first
# since they know how to convert pandas DataFrames better than `spark.createDataFrame(df)`
# and converting from pandas-on-Spark to Spark DataFrame has no overhead
if pyspark_pandas_api_available and pandas_available and isinstance(df, pandas.core.frame.DataFrame):
  df = pyspark.pandas.frame.DataFrame(df)
elif koalas_available and pandas_available and isinstance(df, pandas.core.frame.DataFrame):
  df = databricks.koalas.frame.DataFrame(df)

# convert to pyspark.sql.dataframe.DataFrame
if isinstance(df, pyspark.sql.dataframe.DataFrame):
  pass  # since it is already a Spark DataFrame
elif pyspark_pandas_api_available and isinstance(df, pyspark.pandas.frame.DataFrame):
  df = df.to_spark()
elif koalas_available and isinstance(df, databricks.koalas.frame.DataFrame):
  df = df.to_spark()
elif pandas_available and isinstance(df, pandas.core.frame.DataFrame):
  df = spark.createDataFrame(df)
else:
  msg = f"{type(df)} is not a supported type for dbt Python materialization"
  raise Exception(msg)

# For writeMethod we need to use "indirect" if materializing a partitioned table
# otherwise we can use "direct". Note that indirect will fail if the GCS bucket has a retention policy set on it.
      

df.write \
  .mode("overwrite") \
  .format("bigquery") \
  .option("writeMethod", "direct") \
  .option("writeDisposition", 'WRITE_TRUNCATE') \
  .save("amazon-product-reviews-452322.jaffle_shop.int_product_meta_data_merged")

  