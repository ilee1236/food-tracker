"""Snowflake connection and stage upload."""

import io
import os
from pathlib import Path

import snowflake.connector

PROJECT_DIR = Path(__file__).resolve().parent


def connect():
    key_file = PROJECT_DIR / os.getenv("SNOWFLAKE_PRIVATE_KEY_FILE", ".snowflake/rsa_key.p8")
    return snowflake.connector.connect(
        account=os.environ["SNOWFLAKE_ACCOUNT"],
        user=os.environ["SNOWFLAKE_USER"],
        authenticator="SNOWFLAKE_JWT",
        private_key_file=str(key_file),
        role=os.getenv("SNOWFLAKE_ROLE", "ACCOUNTADMIN"),
        warehouse=os.getenv("SNOWFLAKE_WAREHOUSE", "FOOD_WH"),
        database="FOOD_TRACKER",
        schema="APP",
    )


def put_image(conn, file_name, data):
    """Write image bytes to the RECEIPT_IMAGES stage, uncompressed."""
    conn.cursor().execute(
        f"PUT 'file://{file_name}' @RECEIPT_IMAGES AUTO_COMPRESS=FALSE OVERWRITE=TRUE",
        file_stream=io.BytesIO(data),
    )
