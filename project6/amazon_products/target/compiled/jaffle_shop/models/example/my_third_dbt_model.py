import json
import vertexai
from vertexai.generative_models import GenerativeModel

region = "us-central1"
model_name = "gemini-2.0-flash-001"
prompt = """Generate a few customer records with the customer's ids and their first and last names. 
Return your answer as json objects with the following schema:
{"id": int, "first_name": string, "last_name": string}
For example:
{"id": 1, "first_name": "Jay", "last_name": "Kreps"},
{"id": 2, "first_name": "Gwen", "last_name": "Shapira"}
"""

def model(dbt, session):

    dbt.config(materialized="table")
    vertexai.init(location=region)
    model = GenerativeModel(model_name)
    resp = model.generate_content([prompt])
    resp_text = resp.text.replace("```json", "").replace("```", "").replace("\n", "")
    print(resp_text)
    
    json_obj = json.loads(resp_text)
    customer_records = session.createDataFrame(json_obj) 
    return customer_records


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args, **kwargs):
    refs = {}
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
    identifier = "my_third_dbt_model"
    
    def __repr__(self):
        return 'amazon-product-reviews-452322.jaffle_shop.my_third_dbt_model'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args, **kwargs: ref(*args, **kwargs, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------


