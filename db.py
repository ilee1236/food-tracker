"""Snowflake connection, stage upload and table access."""

import io
import os
import uuid
from pathlib import Path

import pandas as pd
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


def save_receipt(conn, store, purchased_on, image_path, items):
    """Write one receipt and its items in a single transaction; return the receipt id."""
    receipt_id = str(uuid.uuid4())
    total = round(sum(i["price"] for i in items), 2)
    cur = conn.cursor()
    cur.execute("BEGIN")
    try:
        cur.execute(
            "INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH) VALUES (%s, %s, %s, %s, %s)",
            (receipt_id, store, purchased_on, total, image_path),
        )
        cur.executemany(
            "INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE) VALUES (%s, %s, %s, %s, %s)",
            [(receipt_id, i["raw_name"], i["name"], i["category"], i["price"]) for i in items],
        )
        cur.execute("COMMIT")
    except Exception:
        cur.execute("ROLLBACK")
        raise
    return receipt_id


# The pantry is a query, not a table: unused items from receipts scanned in the last 21 days.
PANTRY_SQL = """
SELECT i.ITEM_ID, i.NAME, i.CATEGORY, i.PRICE, r.STORE, r.CREATED_AT
FROM ITEMS i JOIN RECEIPTS r ON r.RECEIPT_ID = i.RECEIPT_ID
WHERE NOT i.USED AND r.CREATED_AT >= DATEADD(day, -21, CURRENT_TIMESTAMP())
ORDER BY r.CREATED_AT DESC, i.NAME
"""


def get_pantry(conn):
    cur = conn.cursor().execute(PANTRY_SQL)
    return pd.DataFrame(cur.fetchall(), columns=[c[0].lower() for c in cur.description])


def set_used(conn, item_id, used):
    conn.cursor().execute(
        "UPDATE ITEMS SET USED = %s, USED_AT = IFF(%s, CURRENT_TIMESTAMP(), NULL) WHERE ITEM_ID = %s",
        (used, used, item_id),
    )


def get_recently_used(conn, limit=3):
    cur = conn.cursor().execute(
        "SELECT ITEM_ID, NAME, CATEGORY, USED_AT FROM ITEMS WHERE USED AND USED_AT IS NOT NULL "
        "ORDER BY USED_AT DESC LIMIT %s",
        (limit,),
    )
    return pd.DataFrame(cur.fetchall(), columns=[c[0].lower() for c in cur.description])
