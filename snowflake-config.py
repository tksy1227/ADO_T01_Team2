# in case the secrets content cannot be retrieved
import snowflake.connector

def get_snowflake_connection():
    conn = snowflake.connector.connect(
        user='CAMEL',
        password='07G887322n06',
        account='sfedu02.bab83824',
        warehouse='CAMEL_WH',
        database='KN_LOGISTICS',
        schema='SNOWSQL'
    )
    return conn
