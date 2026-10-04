-- Food Tracker: database, schema, warehouse, stage and tables.
-- Safe to re-run: every statement uses IF NOT EXISTS.

-- Smallest warehouse, suspends after 60 seconds idle to save credits.
CREATE WAREHOUSE IF NOT EXISTS FOOD_WH
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE;
USE WAREHOUSE FOOD_WH;

CREATE DATABASE IF NOT EXISTS FOOD_TRACKER;
CREATE SCHEMA IF NOT EXISTS FOOD_TRACKER.APP;
USE SCHEMA FOOD_TRACKER.APP;

-- Receipt images. Cortex image input requires server-side encryption.
CREATE STAGE IF NOT EXISTS RECEIPT_IMAGES
  DIRECTORY = (ENABLE = TRUE)
  ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE');

CREATE TABLE IF NOT EXISTS RECEIPTS (
  RECEIPT_ID    STRING DEFAULT UUID_STRING() PRIMARY KEY,
  STORE         STRING,
  PURCHASED_ON  DATE,
  FOOD_TOTAL    NUMBER(8,2),
  IMAGE_PATH    STRING,            -- file name in the stage; null for seed rows
  IS_SEED       BOOLEAN DEFAULT FALSE,
  CREATED_AT    TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE IF NOT EXISTS ITEMS (
  ITEM_ID     STRING DEFAULT UUID_STRING() PRIMARY KEY,
  RECEIPT_ID  STRING,
  RAW_NAME    STRING,              -- as printed, e.g. "ORG BNLS CHKN BRST"
  NAME        STRING,              -- cleaned, e.g. "Chicken breast"
  CATEGORY    STRING,
  PRICE       NUMBER(8,2),
  USED        BOOLEAN DEFAULT FALSE,
  USED_AT     TIMESTAMP_NTZ
);

CREATE TABLE IF NOT EXISTS MONTHLY_SUMMARIES (
  MONTH         DATE PRIMARY KEY,  -- first day of the month
  SUMMARY       STRING,
  GENERATED_AT  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- Image-input smoke test (run after uploading a receipt to the stage
-- uncompressed, e.g. PUT file://receipt.jpg @RECEIPT_IMAGES AUTO_COMPRESS=FALSE):
-- SELECT AI_COMPLETE('claude-haiku-4-5',
--   'List the food items and prices on this receipt.',
--   TO_FILE('@RECEIPT_IMAGES', 'receipt.jpg')) AS RESULT;
