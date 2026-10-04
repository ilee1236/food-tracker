-- Food Tracker demo history: 53 receipts over the last 6 months.
-- Dates are relative to CURRENT_DATE() so the data always looks recent.
-- Receipts older than 21 days have their items marked used; about 40% of recent items are used too.
-- Older history leans toward snacks and frozen food; the last ~5 weeks lean toward produce and protein.
USE SCHEMA FOOD_TRACKER.APP;

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-001', 'Hilltop Grocer', DATEADD(day, -1, CURRENT_DATE()), 34.95, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -1, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-001', 'GARLIC 3CT', 'Garlic', 'Produce', 1.03, FALSE, NULL),
  ('seed-001', 'WW BREAD LOAF', 'Whole wheat bread', 'Grains', 3.57, FALSE, NULL),
  ('seed-001', 'STRAWBERRIES 1LB', 'Strawberries', 'Produce', 3.82, FALSE, NULL),
  ('seed-001', 'YELLOW ONION', 'Yellow onions', 'Produce', 1.67, FALSE, NULL),
  ('seed-001', 'BROCCOLI CRWN', 'Broccoli', 'Produce', 2.93, FALSE, NULL),
  ('seed-001', 'BROWN RICE 2LB', 'Brown rice', 'Grains', 3.14, FALSE, NULL),
  ('seed-001', 'LG EGGS 12CT', 'Eggs', 'Protein', 4.05, TRUE, DATEADD(hour, 21, DATEADD(day, -1, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-001', 'ATL SALMON FLT', 'Salmon fillet', 'Protein', 8.83, TRUE, DATEADD(hour, 22, DATEADD(day, -1, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-001', 'GRAPE TOMATO', 'Grape tomatoes', 'Produce', 3.94, FALSE, NULL),
  ('seed-001', 'AVOCADO HASS', 'Avocados', 'Produce', 1.1, TRUE, DATEADD(hour, 16, DATEADD(day, -1, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-001', 'LEMONS', 'Lemons', 'Produce', 0.87, FALSE, NULL);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-002', 'Corner Fresh', DATEADD(day, -4, CURRENT_DATE()), 21.77, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -4, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-002', 'BUTTER UNSLTD', 'Butter', 'Dairy', 4.45, TRUE, DATEADD(hour, 72, DATEADD(day, -4, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-002', 'PENNE PASTA 1LB', 'Penne pasta', 'Grains', 1.36, TRUE, DATEADD(hour, 94, DATEADD(day, -4, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-002', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.31, FALSE, NULL),
  ('seed-002', 'PEANUT BUTTER', 'Peanut butter', 'Pantry staples', 3.55, TRUE, DATEADD(hour, 54, DATEADD(day, -4, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-002', 'HONEY 12OZ', 'Honey', 'Pantry staples', 5.3, FALSE, NULL),
  ('seed-002', 'LG EGGS 12CT', 'Eggs', 'Protein', 3.8, FALSE, NULL);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-003', 'Sunrise Foods', DATEADD(day, -8, CURRENT_DATE()), 24.48, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -8, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-003', 'WW BREAD LOAF', 'Whole wheat bread', 'Grains', 3.48, TRUE, DATEADD(hour, 48, DATEADD(day, -8, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-003', 'FLOUR TORTILLAS', 'Tortillas', 'Grains', 3.33, FALSE, NULL),
  ('seed-003', 'GRND BEEF 85/15', 'Ground beef', 'Protein', 5.29, TRUE, DATEADD(hour, 25, DATEADD(day, -8, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-003', 'GALA APPLES 3LB', 'Gala apples', 'Produce', 3.99, FALSE, NULL),
  ('seed-003', 'ENERGY DRINK', 'Energy drink', 'Beverages', 3.04, TRUE, DATEADD(hour, 53, DATEADD(day, -8, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-003', 'BLACK BEANS 15OZ', 'Black beans', 'Protein', 1.25, FALSE, NULL),
  ('seed-003', 'MOZZ STRING 12CT', 'String cheese', 'Dairy', 4.1, FALSE, NULL);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-004', 'Green Basket Market', DATEADD(day, -11, CURRENT_DATE()), 29.83, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -11, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-004', 'GRND TURKEY 1LB', 'Ground turkey', 'Protein', 5.86, FALSE, NULL),
  ('seed-004', 'MOZZ STRING 12CT', 'String cheese', 'Dairy', 4.63, FALSE, NULL),
  ('seed-004', 'GRND BEEF 85/15', 'Ground beef', 'Protein', 6.28, TRUE, DATEADD(hour, 173, DATEADD(day, -11, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-004', 'BABY SPINACH 5OZ', 'Baby spinach', 'Produce', 3.44, TRUE, DATEADD(hour, 176, DATEADD(day, -11, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-004', 'LG EGGS 12CT', 'Eggs', 'Protein', 3.68, FALSE, NULL),
  ('seed-004', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 5.94, TRUE, DATEADD(hour, 108, DATEADD(day, -11, CURRENT_DATE())::TIMESTAMP_NTZ));

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-005', 'Hilltop Grocer', DATEADD(day, -15, CURRENT_DATE()), 43.16, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -15, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-005', 'GARLIC 3CT', 'Garlic', 'Produce', 1.95, FALSE, NULL),
  ('seed-005', 'CHOC CHIP COOKIES', 'Chocolate chip cookies', 'Snacks and sweets', 4.1, FALSE, NULL),
  ('seed-005', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 7.44, TRUE, DATEADD(hour, 45, DATEADD(day, -15, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-005', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 3.69, TRUE, DATEADD(hour, 314, DATEADD(day, -15, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-005', 'BUTTER UNSLTD', 'Butter', 'Dairy', 4.92, FALSE, NULL),
  ('seed-005', 'LG EGGS 12CT', 'Eggs', 'Protein', 3.4, FALSE, NULL),
  ('seed-005', 'SWEET POTATO', 'Sweet potatoes', 'Produce', 2.13, TRUE, DATEADD(hour, 336, DATEADD(day, -15, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-005', 'GRND TURKEY 1LB', 'Ground turkey', 'Protein', 6.36, TRUE, DATEADD(hour, 47, DATEADD(day, -15, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-005', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.23, FALSE, NULL),
  ('seed-005', 'WW BREAD LOAF', 'Whole wheat bread', 'Grains', 3.57, FALSE, NULL),
  ('seed-005', 'RED BELL PEPPER', 'Red bell pepper', 'Produce', 1.8, TRUE, DATEADD(hour, 134, DATEADD(day, -15, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-005', 'ZUCCHINI', 'Zucchini', 'Produce', 1.57, TRUE, DATEADD(hour, 261, DATEADD(day, -15, CURRENT_DATE())::TIMESTAMP_NTZ));

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-006', 'Corner Fresh', DATEADD(day, -18, CURRENT_DATE()), 30.79, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -18, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-006', 'GRND TURKEY 1LB', 'Ground turkey', 'Protein', 4.69, TRUE, DATEADD(hour, 111, DATEADD(day, -18, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-006', 'BUTTER UNSLTD', 'Butter', 'Dairy', 4.03, TRUE, DATEADD(hour, 242, DATEADD(day, -18, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-006', 'CHICKEN BROTH', 'Chicken broth', 'Pantry staples', 2.47, TRUE, DATEADD(hour, 106, DATEADD(day, -18, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-006', 'SHRIMP 12OZ', 'Shrimp', 'Protein', 6.64, TRUE, DATEADD(hour, 140, DATEADD(day, -18, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-006', 'SWEET POTATO', 'Sweet potatoes', 'Produce', 2.98, FALSE, NULL),
  ('seed-006', 'ORG BNLS CHKN BRST', 'Chicken breast', 'Protein', 7.18, TRUE, DATEADD(hour, 426, DATEADD(day, -18, CURRENT_DATE())::TIMESTAMP_NTZ)),
  ('seed-006', 'FIRM TOFU', 'Tofu', 'Protein', 2.8, FALSE, NULL);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-007', 'Sunrise Foods', DATEADD(day, -22, CURRENT_DATE()), 37.91, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -22, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-007', 'BANANAS', 'Bananas', 'Produce', 1.33, TRUE, DATEADD(day, 6, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-007', '2% MILK HALF GAL', 'Milk', 'Dairy', 3.78, TRUE, DATEADD(day, 2, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-007', 'FIRM TOFU', 'Tofu', 'Protein', 2.93, TRUE, DATEADD(day, 4, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-007', 'ZUCCHINI', 'Zucchini', 'Produce', 1.66, TRUE, DATEADD(day, 2, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-007', 'CARROTS 2LB', 'Carrots', 'Produce', 2.2, TRUE, DATEADD(day, 2, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-007', 'QUINOA 12OZ', 'Quinoa', 'Grains', 4.99, TRUE, DATEADD(day, 6, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-007', 'SWEET POTATO', 'Sweet potatoes', 'Produce', 2.49, TRUE, DATEADD(day, 5, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-007', 'ATL SALMON FLT', 'Salmon fillet', 'Protein', 8.46, TRUE, DATEADD(day, 6, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-007', 'LG EGGS 12CT', 'Eggs', 'Protein', 3.33, TRUE, DATEADD(day, 6, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-007', 'OLIVE OIL 500ML', 'Olive oil', 'Pantry staples', 6.74, TRUE, DATEADD(day, 3, DATEADD(day, -22, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-008', 'Green Basket Market', DATEADD(day, -25, CURRENT_DATE()), 18.5, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -25, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-008', 'CHOC CHIP COOKIES', 'Chocolate chip cookies', 'Snacks and sweets', 4.41, TRUE, DATEADD(day, 3, DATEADD(day, -25, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-008', 'GARLIC 3CT', 'Garlic', 'Produce', 1.25, TRUE, DATEADD(day, 4, DATEADD(day, -25, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-008', 'SWEET POTATO', 'Sweet potatoes', 'Produce', 1.56, TRUE, DATEADD(day, 3, DATEADD(day, -25, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-008', '2% MILK HALF GAL', 'Milk', 'Dairy', 3.04, TRUE, DATEADD(day, 4, DATEADD(day, -25, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-008', 'PARMESAN WEDGE', 'Parmesan', 'Dairy', 5.13, TRUE, DATEADD(day, 5, DATEADD(day, -25, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-008', 'BROCCOLI CRWN', 'Broccoli', 'Produce', 3.11, TRUE, DATEADD(day, 3, DATEADD(day, -25, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-009', 'Hilltop Grocer', DATEADD(day, -29, CURRENT_DATE()), 50.53, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -29, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-009', 'SHRD CHEDDAR 8OZ', 'Shredded cheddar', 'Dairy', 3.65, TRUE, DATEADD(day, 6, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', 'ATL SALMON FLT', 'Salmon fillet', 'Protein', 9.11, TRUE, DATEADD(day, 3, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', 'OJ 52OZ', 'Orange juice', 'Beverages', 4.16, TRUE, DATEADD(day, 4, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 5.22, TRUE, DATEADD(day, 3, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', 'STRAWBERRIES 1LB', 'Strawberries', 'Produce', 3.98, TRUE, DATEADD(day, 4, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', '2% MILK HALF GAL', 'Milk', 'Dairy', 3.37, TRUE, DATEADD(day, 6, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', 'BLACK BEANS 15OZ', 'Black beans', 'Protein', 1.08, TRUE, DATEADD(day, 5, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', 'SWEET POTATO', 'Sweet potatoes', 'Produce', 1.66, TRUE, DATEADD(day, 4, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', 'GRND TURKEY 1LB', 'Ground turkey', 'Protein', 5.03, TRUE, DATEADD(day, 2, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', 'ORG BNLS CHKN BRST', 'Chicken breast', 'Protein', 9.23, TRUE, DATEADD(day, 2, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-009', 'GALA APPLES 3LB', 'Gala apples', 'Produce', 4.04, TRUE, DATEADD(day, 5, DATEADD(day, -29, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-010', 'Corner Fresh', DATEADD(day, -32, CURRENT_DATE()), 33.12, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -32, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-010', 'AVOCADO HASS', 'Avocados', 'Produce', 1.04, TRUE, DATEADD(day, 2, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'BROCCOLI CRWN', 'Broccoli', 'Produce', 2.62, TRUE, DATEADD(day, 3, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'WW BREAD LOAF', 'Whole wheat bread', 'Grains', 3.14, TRUE, DATEADD(day, 4, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', '2% MILK HALF GAL', 'Milk', 'Dairy', 2.9, TRUE, DATEADD(day, 5, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'BANANAS', 'Bananas', 'Produce', 1.92, TRUE, DATEADD(day, 3, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'PENNE PASTA 1LB', 'Penne pasta', 'Grains', 1.88, TRUE, DATEADD(day, 4, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'GRND TURKEY 1LB', 'Ground turkey', 'Protein', 5.21, TRUE, DATEADD(day, 3, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'BLACK BEANS 15OZ', 'Black beans', 'Protein', 1.43, TRUE, DATEADD(day, 2, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'GARLIC 3CT', 'Garlic', 'Produce', 1.97, TRUE, DATEADD(day, 5, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'YELLOW ONION', 'Yellow onions', 'Produce', 2.39, TRUE, DATEADD(day, 2, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'MARINARA SAUCE', 'Marinara sauce', 'Pantry staples', 3.8, TRUE, DATEADD(day, 5, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-010', 'OJ 52OZ', 'Orange juice', 'Beverages', 4.82, TRUE, DATEADD(day, 3, DATEADD(day, -32, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-011', 'Sunrise Foods', DATEADD(day, -36, CURRENT_DATE()), 26.24, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -36, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-011', 'BROCCOLI CRWN', 'Broccoli', 'Produce', 2.19, TRUE, DATEADD(day, 4, DATEADD(day, -36, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-011', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 6.92, TRUE, DATEADD(day, 2, DATEADD(day, -36, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-011', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.03, TRUE, DATEADD(day, 2, DATEADD(day, -36, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-011', 'MOZZ STRING 12CT', 'String cheese', 'Dairy', 4.1, TRUE, DATEADD(day, 6, DATEADD(day, -36, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-011', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 4.41, TRUE, DATEADD(day, 5, DATEADD(day, -36, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-011', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.82, TRUE, DATEADD(day, 4, DATEADD(day, -36, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-011', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 1.77, TRUE, DATEADD(day, 4, DATEADD(day, -36, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-012', 'Green Basket Market', DATEADD(day, -39, CURRENT_DATE()), 39.55, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -39, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-012', 'OJ 52OZ', 'Orange juice', 'Beverages', 4.05, TRUE, DATEADD(day, 3, DATEADD(day, -39, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-012', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 6.87, TRUE, DATEADD(day, 6, DATEADD(day, -39, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-012', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.43, TRUE, DATEADD(day, 6, DATEADD(day, -39, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-012', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 6.8, TRUE, DATEADD(day, 4, DATEADD(day, -39, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-012', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 5.01, TRUE, DATEADD(day, 5, DATEADD(day, -39, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-012', 'QUINOA 12OZ', 'Quinoa', 'Grains', 4.11, TRUE, DATEADD(day, 6, DATEADD(day, -39, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-012', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 2.55, TRUE, DATEADD(day, 2, DATEADD(day, -39, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-012', 'LG EGGS 12CT', 'Eggs', 'Protein', 3.29, TRUE, DATEADD(day, 4, DATEADD(day, -39, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-012', 'ENERGY DRINK', 'Energy drink', 'Beverages', 3.44, TRUE, DATEADD(day, 4, DATEADD(day, -39, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-013', 'Hilltop Grocer', DATEADD(day, -43, CURRENT_DATE()), 27.47, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -43, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-013', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.24, TRUE, DATEADD(day, 3, DATEADD(day, -43, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-013', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 5.71, TRUE, DATEADD(day, 5, DATEADD(day, -43, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-013', 'QUINOA 12OZ', 'Quinoa', 'Grains', 4.45, TRUE, DATEADD(day, 6, DATEADD(day, -43, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-013', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.14, TRUE, DATEADD(day, 2, DATEADD(day, -43, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-013', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 6.68, TRUE, DATEADD(day, 5, DATEADD(day, -43, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-013', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 2.71, TRUE, DATEADD(day, 5, DATEADD(day, -43, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-013', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 2.54, TRUE, DATEADD(day, 6, DATEADD(day, -43, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-014', 'Corner Fresh', DATEADD(day, -46, CURRENT_DATE()), 25.09, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -46, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-014', 'BROWN RICE 2LB', 'Brown rice', 'Grains', 3.17, TRUE, DATEADD(day, 5, DATEADD(day, -46, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-014', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.44, TRUE, DATEADD(day, 6, DATEADD(day, -46, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-014', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.02, TRUE, DATEADD(day, 6, DATEADD(day, -46, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-014', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.34, TRUE, DATEADD(day, 5, DATEADD(day, -46, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-014', 'WW BREAD LOAF', 'Whole wheat bread', 'Grains', 3.18, TRUE, DATEADD(day, 6, DATEADD(day, -46, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-014', 'GRND BEEF 85/15', 'Ground beef', 'Protein', 6.34, TRUE, DATEADD(day, 5, DATEADD(day, -46, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-014', 'AVOCADO HASS', 'Avocados', 'Produce', 1.6, TRUE, DATEADD(day, 3, DATEADD(day, -46, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-015', 'Sunrise Foods', DATEADD(day, -50, CURRENT_DATE()), 42.84, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -50, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-015', 'BROCCOLI CRWN', 'Broccoli', 'Produce', 2.25, TRUE, DATEADD(day, 6, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 4.16, TRUE, DATEADD(day, 5, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'GREEK YOGURT 32OZ', 'Greek yogurt', 'Dairy', 4.85, TRUE, DATEADD(day, 5, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'STRAWBERRIES 1LB', 'Strawberries', 'Produce', 3.23, TRUE, DATEADD(day, 2, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.16, TRUE, DATEADD(day, 4, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'MOZZ STRING 12CT', 'String cheese', 'Dairy', 4.0, TRUE, DATEADD(day, 4, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.83, TRUE, DATEADD(day, 5, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 2.75, TRUE, DATEADD(day, 5, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.4, TRUE, DATEADD(day, 6, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'FLOUR TORTILLAS', 'Tortillas', 'Grains', 3.42, TRUE, DATEADD(day, 6, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-015', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.79, TRUE, DATEADD(day, 6, DATEADD(day, -50, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-016', 'Green Basket Market', DATEADD(day, -53, CURRENT_DATE()), 31.82, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -53, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-016', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 1.97, TRUE, DATEADD(day, 4, DATEADD(day, -53, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-016', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 7.45, TRUE, DATEADD(day, 5, DATEADD(day, -53, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-016', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.05, TRUE, DATEADD(day, 4, DATEADD(day, -53, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-016', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 5.18, TRUE, DATEADD(day, 3, DATEADD(day, -53, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-016', 'QUINOA 12OZ', 'Quinoa', 'Grains', 3.54, TRUE, DATEADD(day, 5, DATEADD(day, -53, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-016', 'PARMESAN WEDGE', 'Parmesan', 'Dairy', 4.86, TRUE, DATEADD(day, 4, DATEADD(day, -53, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-016', 'OLD FASH OATS', 'Rolled oats', 'Grains', 2.77, TRUE, DATEADD(day, 4, DATEADD(day, -53, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-017', 'Hilltop Grocer', DATEADD(day, -57, CURRENT_DATE()), 51.31, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -57, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-017', 'ORG BNLS CHKN BRST', 'Chicken breast', 'Protein', 9.26, TRUE, DATEADD(day, 6, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.5, TRUE, DATEADD(day, 5, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'OLIVE OIL 500ML', 'Olive oil', 'Pantry staples', 6.86, TRUE, DATEADD(day, 5, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.19, TRUE, DATEADD(day, 3, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'SWEET POTATO', 'Sweet potatoes', 'Produce', 1.67, TRUE, DATEADD(day, 2, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.2, TRUE, DATEADD(day, 6, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'SHRD CHEDDAR 8OZ', 'Shredded cheddar', 'Dairy', 3.5, TRUE, DATEADD(day, 3, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 3.91, TRUE, DATEADD(day, 2, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'HONEY 12OZ', 'Honey', 'Pantry staples', 5.44, TRUE, DATEADD(day, 4, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 3.23, TRUE, DATEADD(day, 6, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 1.66, TRUE, DATEADD(day, 2, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-017', 'MARINARA SAUCE', 'Marinara sauce', 'Pantry staples', 3.89, TRUE, DATEADD(day, 6, DATEADD(day, -57, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-018', 'Corner Fresh', DATEADD(day, -60, CURRENT_DATE()), 47.8, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -60, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-018', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 3.65, TRUE, DATEADD(day, 3, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'ENERGY DRINK', 'Energy drink', 'Beverages', 3.47, TRUE, DATEADD(day, 5, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'PENNE PASTA 1LB', 'Penne pasta', 'Grains', 1.82, TRUE, DATEADD(day, 3, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 4.16, TRUE, DATEADD(day, 4, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'FLOUR TORTILLAS', 'Tortillas', 'Grains', 2.65, TRUE, DATEADD(day, 4, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 2.89, TRUE, DATEADD(day, 4, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 4.28, TRUE, DATEADD(day, 4, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 5.2, TRUE, DATEADD(day, 6, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.49, TRUE, DATEADD(day, 4, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.07, TRUE, DATEADD(day, 6, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'SHRIMP 12OZ', 'Shrimp', 'Protein', 7.34, TRUE, DATEADD(day, 2, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-018', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.78, TRUE, DATEADD(day, 6, DATEADD(day, -60, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-019', 'Sunrise Foods', DATEADD(day, -64, CURRENT_DATE()), 30.02, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -64, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-019', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 2.64, TRUE, DATEADD(day, 5, DATEADD(day, -64, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-019', 'WW BREAD LOAF', 'Whole wheat bread', 'Grains', 3.11, TRUE, DATEADD(day, 4, DATEADD(day, -64, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-019', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.77, TRUE, DATEADD(day, 4, DATEADD(day, -64, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-019', 'MOZZ STRING 12CT', 'String cheese', 'Dairy', 4.05, TRUE, DATEADD(day, 4, DATEADD(day, -64, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-019', 'QUINOA 12OZ', 'Quinoa', 'Grains', 4.3, TRUE, DATEADD(day, 3, DATEADD(day, -64, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-019', 'FLOUR TORTILLAS', 'Tortillas', 'Grains', 3.49, TRUE, DATEADD(day, 2, DATEADD(day, -64, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-019', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.66, TRUE, DATEADD(day, 3, DATEADD(day, -64, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-020', 'Green Basket Market', DATEADD(day, -67, CURRENT_DATE()), 32.77, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -67, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-020', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 5.96, TRUE, DATEADD(day, 5, DATEADD(day, -67, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-020', 'OJ 52OZ', 'Orange juice', 'Beverages', 3.94, TRUE, DATEADD(day, 2, DATEADD(day, -67, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-020', 'SHRD CHEDDAR 8OZ', 'Shredded cheddar', 'Dairy', 2.73, TRUE, DATEADD(day, 2, DATEADD(day, -67, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-020', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.56, TRUE, DATEADD(day, 6, DATEADD(day, -67, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-020', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 3.41, TRUE, DATEADD(day, 4, DATEADD(day, -67, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-020', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 5.88, TRUE, DATEADD(day, 5, DATEADD(day, -67, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-020', 'QUINOA 12OZ', 'Quinoa', 'Grains', 4.92, TRUE, DATEADD(day, 5, DATEADD(day, -67, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-020', 'DICED TOMATO 28OZ', 'Canned diced tomatoes', 'Pantry staples', 2.37, TRUE, DATEADD(day, 5, DATEADD(day, -67, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-021', 'Hilltop Grocer', DATEADD(day, -71, CURRENT_DATE()), 33.76, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -71, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-021', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 2.73, TRUE, DATEADD(day, 5, DATEADD(day, -71, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-021', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 2.84, TRUE, DATEADD(day, 4, DATEADD(day, -71, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-021', 'PEANUT BUTTER', 'Peanut butter', 'Pantry staples', 2.63, TRUE, DATEADD(day, 6, DATEADD(day, -71, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-021', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.3, TRUE, DATEADD(day, 5, DATEADD(day, -71, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-021', 'STRAWBERRIES 1LB', 'Strawberries', 'Produce', 3.62, TRUE, DATEADD(day, 4, DATEADD(day, -71, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-021', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.58, TRUE, DATEADD(day, 6, DATEADD(day, -71, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-021', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 4.16, TRUE, DATEADD(day, 6, DATEADD(day, -71, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-021', 'COLD BREW COFFEE', 'Cold brew coffee', 'Beverages', 4.9, TRUE, DATEADD(day, 2, DATEADD(day, -71, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-022', 'Corner Fresh', DATEADD(day, -74, CURRENT_DATE()), 39.05, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -74, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-022', 'DICED TOMATO 28OZ', 'Canned diced tomatoes', 'Pantry staples', 2.09, TRUE, DATEADD(day, 3, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-022', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 4.07, TRUE, DATEADD(day, 2, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-022', 'SHRD CHEDDAR 8OZ', 'Shredded cheddar', 'Dairy', 3.42, TRUE, DATEADD(day, 2, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-022', 'COLD BREW COFFEE', 'Cold brew coffee', 'Beverages', 4.14, TRUE, DATEADD(day, 3, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-022', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 7.31, TRUE, DATEADD(day, 4, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-022', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 3.19, TRUE, DATEADD(day, 6, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-022', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.99, TRUE, DATEADD(day, 6, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-022', 'OJ 52OZ', 'Orange juice', 'Beverages', 4.14, TRUE, DATEADD(day, 4, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-022', 'CHOC BAR DARK', 'Dark chocolate', 'Snacks and sweets', 2.34, TRUE, DATEADD(day, 5, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-022', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 4.36, TRUE, DATEADD(day, 2, DATEADD(day, -74, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-023', 'Sunrise Foods', DATEADD(day, -78, CURRENT_DATE()), 37.82, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -78, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-023', 'PENNE PASTA 1LB', 'Penne pasta', 'Grains', 1.23, TRUE, DATEADD(day, 5, DATEADD(day, -78, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-023', 'WW BREAD LOAF', 'Whole wheat bread', 'Grains', 3.94, TRUE, DATEADD(day, 5, DATEADD(day, -78, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-023', 'HONEY 12OZ', 'Honey', 'Pantry staples', 5.72, TRUE, DATEADD(day, 2, DATEADD(day, -78, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-023', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 5.9, TRUE, DATEADD(day, 5, DATEADD(day, -78, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-023', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.32, TRUE, DATEADD(day, 4, DATEADD(day, -78, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-023', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.64, TRUE, DATEADD(day, 5, DATEADD(day, -78, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-023', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 3.71, TRUE, DATEADD(day, 4, DATEADD(day, -78, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-023', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.87, TRUE, DATEADD(day, 4, DATEADD(day, -78, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-023', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 7.49, TRUE, DATEADD(day, 2, DATEADD(day, -78, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-024', 'Green Basket Market', DATEADD(day, -81, CURRENT_DATE()), 42.55, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -81, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-024', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.49, TRUE, DATEADD(day, 3, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 4.92, TRUE, DATEADD(day, 2, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 4.97, TRUE, DATEADD(day, 5, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'PENNE PASTA 1LB', 'Penne pasta', 'Grains', 1.82, TRUE, DATEADD(day, 2, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.25, TRUE, DATEADD(day, 3, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', '2% MILK HALF GAL', 'Milk', 'Dairy', 2.76, TRUE, DATEADD(day, 5, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.2, TRUE, DATEADD(day, 4, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 2.16, TRUE, DATEADD(day, 6, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'CHOC BAR DARK', 'Dark chocolate', 'Snacks and sweets', 2.18, TRUE, DATEADD(day, 4, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 4.06, TRUE, DATEADD(day, 5, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'BUTTER UNSLTD', 'Butter', 'Dairy', 4.33, TRUE, DATEADD(day, 5, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-024', 'AVOCADO HASS', 'Avocados', 'Produce', 1.41, TRUE, DATEADD(day, 5, DATEADD(day, -81, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-025', 'Hilltop Grocer', DATEADD(day, -85, CURRENT_DATE()), 25.66, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -85, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-025', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.29, TRUE, DATEADD(day, 5, DATEADD(day, -85, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-025', 'CHOC BAR DARK', 'Dark chocolate', 'Snacks and sweets', 2.51, TRUE, DATEADD(day, 6, DATEADD(day, -85, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-025', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 2.76, TRUE, DATEADD(day, 5, DATEADD(day, -85, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-025', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 5.71, TRUE, DATEADD(day, 4, DATEADD(day, -85, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-025', 'SHRD CHEDDAR 8OZ', 'Shredded cheddar', 'Dairy', 3.59, TRUE, DATEADD(day, 4, DATEADD(day, -85, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-025', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 6.0, TRUE, DATEADD(day, 6, DATEADD(day, -85, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-025', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 2.8, TRUE, DATEADD(day, 6, DATEADD(day, -85, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-026', 'Corner Fresh', DATEADD(day, -88, CURRENT_DATE()), 35.26, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -88, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-026', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.83, TRUE, DATEADD(day, 3, DATEADD(day, -88, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-026', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.08, TRUE, DATEADD(day, 2, DATEADD(day, -88, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-026', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 3.74, TRUE, DATEADD(day, 5, DATEADD(day, -88, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-026', 'BROWN RICE 2LB', 'Brown rice', 'Grains', 2.19, TRUE, DATEADD(day, 4, DATEADD(day, -88, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-026', 'ENERGY DRINK', 'Energy drink', 'Beverages', 2.83, TRUE, DATEADD(day, 4, DATEADD(day, -88, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-026', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.81, TRUE, DATEADD(day, 6, DATEADD(day, -88, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-026', 'BUTTER UNSLTD', 'Butter', 'Dairy', 3.65, TRUE, DATEADD(day, 5, DATEADD(day, -88, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-026', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.02, TRUE, DATEADD(day, 2, DATEADD(day, -88, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-026', 'GREEK YOGURT 32OZ', 'Greek yogurt', 'Dairy', 5.11, TRUE, DATEADD(day, 4, DATEADD(day, -88, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-027', 'Sunrise Foods', DATEADD(day, -92, CURRENT_DATE()), 45.08, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -92, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-027', 'BROWN RICE 2LB', 'Brown rice', 'Grains', 2.65, TRUE, DATEADD(day, 5, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 6.9, TRUE, DATEADD(day, 6, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'DICED TOMATO 28OZ', 'Canned diced tomatoes', 'Pantry staples', 2.37, TRUE, DATEADD(day, 3, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'ENERGY DRINK', 'Energy drink', 'Beverages', 2.67, TRUE, DATEADD(day, 5, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'FIRM TOFU', 'Tofu', 'Protein', 2.9, TRUE, DATEADD(day, 6, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 5.31, TRUE, DATEADD(day, 3, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'OJ 52OZ', 'Orange juice', 'Beverages', 3.94, TRUE, DATEADD(day, 3, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'COLD BREW COFFEE', 'Cold brew coffee', 'Beverages', 4.86, TRUE, DATEADD(day, 5, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 2.3, TRUE, DATEADD(day, 4, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'QUINOA 12OZ', 'Quinoa', 'Grains', 4.52, TRUE, DATEADD(day, 5, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.25, TRUE, DATEADD(day, 4, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-027', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.41, TRUE, DATEADD(day, 2, DATEADD(day, -92, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-028', 'Green Basket Market', DATEADD(day, -95, CURRENT_DATE()), 47.45, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -95, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-028', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 1.98, TRUE, DATEADD(day, 3, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.95, TRUE, DATEADD(day, 2, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 4.36, TRUE, DATEADD(day, 2, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 4.04, TRUE, DATEADD(day, 4, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'HONEY 12OZ', 'Honey', 'Pantry staples', 5.32, TRUE, DATEADD(day, 5, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'PEANUT BUTTER', 'Peanut butter', 'Pantry staples', 2.51, TRUE, DATEADD(day, 2, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 6.78, TRUE, DATEADD(day, 6, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'SOY SAUCE', 'Soy sauce', 'Pantry staples', 3.25, TRUE, DATEADD(day, 4, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'PENNE PASTA 1LB', 'Penne pasta', 'Grains', 1.98, TRUE, DATEADD(day, 3, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.41, TRUE, DATEADD(day, 2, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 4.44, TRUE, DATEADD(day, 4, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-028', 'MARINARA SAUCE', 'Marinara sauce', 'Pantry staples', 3.43, TRUE, DATEADD(day, 4, DATEADD(day, -95, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-029', 'Hilltop Grocer', DATEADD(day, -99, CURRENT_DATE()), 47.18, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -99, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-029', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 4.12, TRUE, DATEADD(day, 5, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 4.21, TRUE, DATEADD(day, 4, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'BUTTER UNSLTD', 'Butter', 'Dairy', 4.94, TRUE, DATEADD(day, 2, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'LG EGGS 12CT', 'Eggs', 'Protein', 4.13, TRUE, DATEADD(day, 3, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 7.15, TRUE, DATEADD(day, 5, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.93, TRUE, DATEADD(day, 2, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 4.18, TRUE, DATEADD(day, 6, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 1.52, TRUE, DATEADD(day, 6, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'BLACK BEANS 15OZ', 'Black beans', 'Protein', 0.97, TRUE, DATEADD(day, 4, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'PEANUT BUTTER', 'Peanut butter', 'Pantry staples', 3.51, TRUE, DATEADD(day, 6, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-029', 'HONEY 12OZ', 'Honey', 'Pantry staples', 4.52, TRUE, DATEADD(day, 3, DATEADD(day, -99, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-030', 'Corner Fresh', DATEADD(day, -102, CURRENT_DATE()), 48.86, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -102, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-030', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 3.58, TRUE, DATEADD(day, 4, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'BROCCOLI CRWN', 'Broccoli', 'Produce', 2.74, TRUE, DATEADD(day, 6, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'SHRIMP 12OZ', 'Shrimp', 'Protein', 7.97, TRUE, DATEADD(day, 4, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.31, TRUE, DATEADD(day, 2, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.48, TRUE, DATEADD(day, 5, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 2.73, TRUE, DATEADD(day, 4, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'CHICKEN BROTH', 'Chicken broth', 'Pantry staples', 2.94, TRUE, DATEADD(day, 3, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.05, TRUE, DATEADD(day, 2, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 4.43, TRUE, DATEADD(day, 5, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 5.9, TRUE, DATEADD(day, 2, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-030', 'GRND BEEF 85/15', 'Ground beef', 'Protein', 5.73, TRUE, DATEADD(day, 3, DATEADD(day, -102, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-031', 'Sunrise Foods', DATEADD(day, -106, CURRENT_DATE()), 41.01, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -106, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-031', 'OJ 52OZ', 'Orange juice', 'Beverages', 3.99, TRUE, DATEADD(day, 5, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'MARINARA SAUCE', 'Marinara sauce', 'Pantry staples', 3.68, TRUE, DATEADD(day, 6, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 2.92, TRUE, DATEADD(day, 2, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 7.47, TRUE, DATEADD(day, 2, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'DICED TOMATO 28OZ', 'Canned diced tomatoes', 'Pantry staples', 1.75, TRUE, DATEADD(day, 5, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'GREEK YOGURT 32OZ', 'Greek yogurt', 'Dairy', 4.66, TRUE, DATEADD(day, 5, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 2.04, TRUE, DATEADD(day, 4, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'BANANAS', 'Bananas', 'Produce', 1.49, TRUE, DATEADD(day, 6, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 4.38, TRUE, DATEADD(day, 6, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 5.44, TRUE, DATEADD(day, 2, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-031', 'BABY SPINACH 5OZ', 'Baby spinach', 'Produce', 3.19, TRUE, DATEADD(day, 5, DATEADD(day, -106, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-032', 'Green Basket Market', DATEADD(day, -109, CURRENT_DATE()), 35.46, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -109, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-032', 'CHOC BAR DARK', 'Dark chocolate', 'Snacks and sweets', 3.03, TRUE, DATEADD(day, 2, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-032', 'COLD BREW COFFEE', 'Cold brew coffee', 'Beverages', 5.42, TRUE, DATEADD(day, 6, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-032', 'OLD FASH OATS', 'Rolled oats', 'Grains', 2.61, TRUE, DATEADD(day, 3, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-032', 'GRND TURKEY 1LB', 'Ground turkey', 'Protein', 5.14, TRUE, DATEADD(day, 5, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-032', 'WW BREAD LOAF', 'Whole wheat bread', 'Grains', 2.6, TRUE, DATEADD(day, 5, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-032', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.94, TRUE, DATEADD(day, 3, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-032', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 4.07, TRUE, DATEADD(day, 5, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-032', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 5.06, TRUE, DATEADD(day, 4, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-032', 'CHICKEN BROTH', 'Chicken broth', 'Pantry staples', 2.51, TRUE, DATEADD(day, 5, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-032', 'RED BELL PEPPER', 'Red bell pepper', 'Produce', 1.08, TRUE, DATEADD(day, 5, DATEADD(day, -109, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-033', 'Hilltop Grocer', DATEADD(day, -113, CURRENT_DATE()), 40.35, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -113, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-033', 'OLD FASH OATS', 'Rolled oats', 'Grains', 2.64, TRUE, DATEADD(day, 3, DATEADD(day, -113, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-033', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.75, TRUE, DATEADD(day, 3, DATEADD(day, -113, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-033', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 6.39, TRUE, DATEADD(day, 5, DATEADD(day, -113, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-033', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 4.01, TRUE, DATEADD(day, 3, DATEADD(day, -113, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-033', 'CHICKEN BROTH', 'Chicken broth', 'Pantry staples', 2.35, TRUE, DATEADD(day, 2, DATEADD(day, -113, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-033', 'FLOUR TORTILLAS', 'Tortillas', 'Grains', 3.3, TRUE, DATEADD(day, 4, DATEADD(day, -113, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-033', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 6.92, TRUE, DATEADD(day, 6, DATEADD(day, -113, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-033', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 4.62, TRUE, DATEADD(day, 4, DATEADD(day, -113, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-033', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.37, TRUE, DATEADD(day, 2, DATEADD(day, -113, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-034', 'Corner Fresh', DATEADD(day, -116, CURRENT_DATE()), 45.42, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -116, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-034', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 4.05, TRUE, DATEADD(day, 6, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 5.84, TRUE, DATEADD(day, 2, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 2.51, TRUE, DATEADD(day, 2, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'OJ 52OZ', 'Orange juice', 'Beverages', 4.35, TRUE, DATEADD(day, 4, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'BUTTER UNSLTD', 'Butter', 'Dairy', 3.6, TRUE, DATEADD(day, 5, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 5.23, TRUE, DATEADD(day, 5, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'FLOUR TORTILLAS', 'Tortillas', 'Grains', 2.32, TRUE, DATEADD(day, 5, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'COLD BREW COFFEE', 'Cold brew coffee', 'Beverages', 4.91, TRUE, DATEADD(day, 6, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 4.06, TRUE, DATEADD(day, 5, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'PENNE PASTA 1LB', 'Penne pasta', 'Grains', 1.98, TRUE, DATEADD(day, 5, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'BROWN RICE 2LB', 'Brown rice', 'Grains', 3.33, TRUE, DATEADD(day, 4, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-034', 'CHOC CHIP COOKIES', 'Chocolate chip cookies', 'Snacks and sweets', 3.24, TRUE, DATEADD(day, 3, DATEADD(day, -116, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-035', 'Sunrise Foods', DATEADD(day, -120, CURRENT_DATE()), 37.78, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -120, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-035', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 1.64, TRUE, DATEADD(day, 5, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.43, TRUE, DATEADD(day, 4, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'CHOC CHIP COOKIES', 'Chocolate chip cookies', 'Snacks and sweets', 3.01, TRUE, DATEADD(day, 2, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'QUINOA 12OZ', 'Quinoa', 'Grains', 4.15, TRUE, DATEADD(day, 5, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'OJ 52OZ', 'Orange juice', 'Beverages', 4.07, TRUE, DATEADD(day, 2, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 4.25, TRUE, DATEADD(day, 4, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 2.61, TRUE, DATEADD(day, 3, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 3.11, TRUE, DATEADD(day, 6, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'CHICKEN BROTH', 'Chicken broth', 'Pantry staples', 2.02, TRUE, DATEADD(day, 5, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.79, TRUE, DATEADD(day, 4, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'CHOC BAR DARK', 'Dark chocolate', 'Snacks and sweets', 2.64, TRUE, DATEADD(day, 2, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-035', 'SOY SAUCE', 'Soy sauce', 'Pantry staples', 3.06, TRUE, DATEADD(day, 5, DATEADD(day, -120, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-036', 'Green Basket Market', DATEADD(day, -123, CURRENT_DATE()), 45.91, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -123, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-036', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.53, TRUE, DATEADD(day, 2, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.15, TRUE, DATEADD(day, 5, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.59, TRUE, DATEADD(day, 5, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'CHOC CHIP COOKIES', 'Chocolate chip cookies', 'Snacks and sweets', 3.38, TRUE, DATEADD(day, 4, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'GALA APPLES 3LB', 'Gala apples', 'Produce', 4.7, TRUE, DATEADD(day, 4, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'PARMESAN WEDGE', 'Parmesan', 'Dairy', 4.15, TRUE, DATEADD(day, 6, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 2.74, TRUE, DATEADD(day, 2, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'MOZZ STRING 12CT', 'String cheese', 'Dairy', 4.64, TRUE, DATEADD(day, 4, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 5.36, TRUE, DATEADD(day, 6, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'ENERGY DRINK', 'Energy drink', 'Beverages', 3.14, TRUE, DATEADD(day, 2, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 4.8, TRUE, DATEADD(day, 4, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-036', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 1.73, TRUE, DATEADD(day, 5, DATEADD(day, -123, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-037', 'Hilltop Grocer', DATEADD(day, -127, CURRENT_DATE()), 41.57, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -127, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-037', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.17, TRUE, DATEADD(day, 5, DATEADD(day, -127, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-037', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.07, TRUE, DATEADD(day, 5, DATEADD(day, -127, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-037', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.8, TRUE, DATEADD(day, 6, DATEADD(day, -127, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-037', 'COLD BREW COFFEE', 'Cold brew coffee', 'Beverages', 5.0, TRUE, DATEADD(day, 6, DATEADD(day, -127, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-037', 'OLIVE OIL 500ML', 'Olive oil', 'Pantry staples', 6.35, TRUE, DATEADD(day, 6, DATEADD(day, -127, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-037', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 3.35, TRUE, DATEADD(day, 3, DATEADD(day, -127, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-037', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 4.97, TRUE, DATEADD(day, 4, DATEADD(day, -127, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-037', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 5.76, TRUE, DATEADD(day, 4, DATEADD(day, -127, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-037', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 5.1, TRUE, DATEADD(day, 4, DATEADD(day, -127, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-038', 'Corner Fresh', DATEADD(day, -130, CURRENT_DATE()), 37.02, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -130, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-038', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.7, TRUE, DATEADD(day, 6, DATEADD(day, -130, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-038', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 5.75, TRUE, DATEADD(day, 2, DATEADD(day, -130, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-038', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 3.62, TRUE, DATEADD(day, 5, DATEADD(day, -130, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-038', 'PARMESAN WEDGE', 'Parmesan', 'Dairy', 4.28, TRUE, DATEADD(day, 6, DATEADD(day, -130, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-038', 'PENNE PASTA 1LB', 'Penne pasta', 'Grains', 1.51, TRUE, DATEADD(day, 4, DATEADD(day, -130, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-038', 'CHOC BAR DARK', 'Dark chocolate', 'Snacks and sweets', 2.19, TRUE, DATEADD(day, 2, DATEADD(day, -130, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-038', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 4.41, TRUE, DATEADD(day, 4, DATEADD(day, -130, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-038', 'OLD FASH OATS', 'Rolled oats', 'Grains', 3.34, TRUE, DATEADD(day, 4, DATEADD(day, -130, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-038', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 4.22, TRUE, DATEADD(day, 3, DATEADD(day, -130, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-039', 'Sunrise Foods', DATEADD(day, -134, CURRENT_DATE()), 33.77, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -134, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-039', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 5.54, TRUE, DATEADD(day, 3, DATEADD(day, -134, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-039', 'PARMESAN WEDGE', 'Parmesan', 'Dairy', 5.77, TRUE, DATEADD(day, 5, DATEADD(day, -134, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-039', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.49, TRUE, DATEADD(day, 2, DATEADD(day, -134, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-039', 'HONEY 12OZ', 'Honey', 'Pantry staples', 5.24, TRUE, DATEADD(day, 5, DATEADD(day, -134, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-039', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.57, TRUE, DATEADD(day, 4, DATEADD(day, -134, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-039', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.45, TRUE, DATEADD(day, 3, DATEADD(day, -134, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-039', 'MOZZ STRING 12CT', 'String cheese', 'Dairy', 4.71, TRUE, DATEADD(day, 5, DATEADD(day, -134, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-040', 'Green Basket Market', DATEADD(day, -137, CURRENT_DATE()), 38.9, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -137, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-040', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.19, TRUE, DATEADD(day, 2, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-040', 'SHRD CHEDDAR 8OZ', 'Shredded cheddar', 'Dairy', 3.51, TRUE, DATEADD(day, 3, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-040', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.05, TRUE, DATEADD(day, 4, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-040', 'OJ 52OZ', 'Orange juice', 'Beverages', 4.73, TRUE, DATEADD(day, 5, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-040', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 1.64, TRUE, DATEADD(day, 6, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-040', 'GRAPE TOMATO', 'Grape tomatoes', 'Produce', 2.58, TRUE, DATEADD(day, 3, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-040', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 5.75, TRUE, DATEADD(day, 5, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-040', 'GARLIC 3CT', 'Garlic', 'Produce', 1.93, TRUE, DATEADD(day, 2, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-040', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 4.27, TRUE, DATEADD(day, 3, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-040', 'HONEY 12OZ', 'Honey', 'Pantry staples', 4.25, TRUE, DATEADD(day, 5, DATEADD(day, -137, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-041', 'Hilltop Grocer', DATEADD(day, -141, CURRENT_DATE()), 40.07, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -141, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-041', 'GRND TURKEY 1LB', 'Ground turkey', 'Protein', 6.18, TRUE, DATEADD(day, 2, DATEADD(day, -141, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-041', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.67, TRUE, DATEADD(day, 4, DATEADD(day, -141, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-041', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.34, TRUE, DATEADD(day, 3, DATEADD(day, -141, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-041', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.88, TRUE, DATEADD(day, 3, DATEADD(day, -141, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-041', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.2, TRUE, DATEADD(day, 6, DATEADD(day, -141, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-041', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 4.14, TRUE, DATEADD(day, 6, DATEADD(day, -141, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-041', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 4.9, TRUE, DATEADD(day, 6, DATEADD(day, -141, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-041', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 6.76, TRUE, DATEADD(day, 5, DATEADD(day, -141, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-042', 'Corner Fresh', DATEADD(day, -144, CURRENT_DATE()), 22.83, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -144, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-042', '2% MILK HALF GAL', 'Milk', 'Dairy', 2.64, TRUE, DATEADD(day, 3, DATEADD(day, -144, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-042', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 2.9, TRUE, DATEADD(day, 6, DATEADD(day, -144, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-042', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.45, TRUE, DATEADD(day, 5, DATEADD(day, -144, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-042', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.36, TRUE, DATEADD(day, 3, DATEADD(day, -144, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-042', 'OJ 52OZ', 'Orange juice', 'Beverages', 3.94, TRUE, DATEADD(day, 2, DATEADD(day, -144, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-042', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 6.54, TRUE, DATEADD(day, 6, DATEADD(day, -144, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-043', 'Sunrise Foods', DATEADD(day, -148, CURRENT_DATE()), 29.62, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -148, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-043', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.38, TRUE, DATEADD(day, 3, DATEADD(day, -148, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-043', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 5.89, TRUE, DATEADD(day, 5, DATEADD(day, -148, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-043', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 5.36, TRUE, DATEADD(day, 5, DATEADD(day, -148, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-043', 'DICED TOMATO 28OZ', 'Canned diced tomatoes', 'Pantry staples', 2.16, TRUE, DATEADD(day, 3, DATEADD(day, -148, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-043', 'OJ 52OZ', 'Orange juice', 'Beverages', 4.66, TRUE, DATEADD(day, 3, DATEADD(day, -148, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-043', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.26, TRUE, DATEADD(day, 2, DATEADD(day, -148, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-043', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.07, TRUE, DATEADD(day, 5, DATEADD(day, -148, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-043', 'ENERGY DRINK', 'Energy drink', 'Beverages', 2.84, TRUE, DATEADD(day, 2, DATEADD(day, -148, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-044', 'Green Basket Market', DATEADD(day, -151, CURRENT_DATE()), 39.73, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -151, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-044', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.63, TRUE, DATEADD(day, 5, DATEADD(day, -151, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-044', 'GREEK YOGURT 32OZ', 'Greek yogurt', 'Dairy', 4.93, TRUE, DATEADD(day, 4, DATEADD(day, -151, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-044', 'ORG BNLS CHKN BRST', 'Chicken breast', 'Protein', 9.6, TRUE, DATEADD(day, 6, DATEADD(day, -151, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-044', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.41, TRUE, DATEADD(day, 4, DATEADD(day, -151, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-044', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.16, TRUE, DATEADD(day, 2, DATEADD(day, -151, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-044', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.49, TRUE, DATEADD(day, 5, DATEADD(day, -151, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-044', 'RED BELL PEPPER', 'Red bell pepper', 'Produce', 1.27, TRUE, DATEADD(day, 2, DATEADD(day, -151, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-044', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 6.24, TRUE, DATEADD(day, 5, DATEADD(day, -151, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-045', 'Hilltop Grocer', DATEADD(day, -155, CURRENT_DATE()), 41.89, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -155, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-045', 'CHICKEN BROTH', 'Chicken broth', 'Pantry staples', 2.04, TRUE, DATEADD(day, 3, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-045', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.92, TRUE, DATEADD(day, 4, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-045', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 2.91, TRUE, DATEADD(day, 4, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-045', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 3.42, TRUE, DATEADD(day, 5, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-045', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 6.18, TRUE, DATEADD(day, 6, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-045', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.73, TRUE, DATEADD(day, 2, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-045', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 4.43, TRUE, DATEADD(day, 6, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-045', 'WW BREAD LOAF', 'Whole wheat bread', 'Grains', 3.77, TRUE, DATEADD(day, 3, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-045', 'CHOC BAR DARK', 'Dark chocolate', 'Snacks and sweets', 3.17, TRUE, DATEADD(day, 5, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-045', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.32, TRUE, DATEADD(day, 4, DATEADD(day, -155, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-046', 'Corner Fresh', DATEADD(day, -158, CURRENT_DATE()), 34.43, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -158, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-046', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 6.25, TRUE, DATEADD(day, 5, DATEADD(day, -158, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-046', 'CHOC BAR DARK', 'Dark chocolate', 'Snacks and sweets', 3.37, TRUE, DATEADD(day, 3, DATEADD(day, -158, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-046', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 2.89, TRUE, DATEADD(day, 5, DATEADD(day, -158, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-046', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.56, TRUE, DATEADD(day, 2, DATEADD(day, -158, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-046', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 4.49, TRUE, DATEADD(day, 4, DATEADD(day, -158, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-046', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.39, TRUE, DATEADD(day, 4, DATEADD(day, -158, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-046', 'CHICKEN BROTH', 'Chicken broth', 'Pantry staples', 2.2, TRUE, DATEADD(day, 2, DATEADD(day, -158, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-046', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 4.28, TRUE, DATEADD(day, 6, DATEADD(day, -158, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-047', 'Sunrise Foods', DATEADD(day, -162, CURRENT_DATE()), 44.79, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -162, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-047', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 6.98, TRUE, DATEADD(day, 5, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-047', 'FRZ PEPPERONI PIZZA', 'Frozen pepperoni pizza', 'Frozen and prepared', 5.4, TRUE, DATEADD(day, 5, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-047', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.7, TRUE, DATEADD(day, 6, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-047', 'FLOUR TORTILLAS', 'Tortillas', 'Grains', 2.19, TRUE, DATEADD(day, 4, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-047', 'BROWN RICE 2LB', 'Brown rice', 'Grains', 2.1, TRUE, DATEADD(day, 3, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-047', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 3.0, TRUE, DATEADD(day, 6, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-047', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.05, TRUE, DATEADD(day, 6, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-047', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 5.65, TRUE, DATEADD(day, 3, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-047', 'OLIVE OIL 500ML', 'Olive oil', 'Pantry staples', 5.38, TRUE, DATEADD(day, 3, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-047', 'SHRD CHEDDAR 8OZ', 'Shredded cheddar', 'Dairy', 3.34, TRUE, DATEADD(day, 5, DATEADD(day, -162, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-048', 'Green Basket Market', DATEADD(day, -165, CURRENT_DATE()), 41.36, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -165, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-048', 'GRND TURKEY 1LB', 'Ground turkey', 'Protein', 5.0, TRUE, DATEADD(day, 2, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-048', 'ICE CREAM PINT', 'Ice cream', 'Snacks and sweets', 4.25, TRUE, DATEADD(day, 6, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-048', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 3.92, TRUE, DATEADD(day, 4, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-048', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.25, TRUE, DATEADD(day, 3, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-048', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 2.39, TRUE, DATEADD(day, 6, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-048', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 4.31, TRUE, DATEADD(day, 5, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-048', 'QUINOA 12OZ', 'Quinoa', 'Grains', 4.44, TRUE, DATEADD(day, 6, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-048', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.68, TRUE, DATEADD(day, 2, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-048', 'SOY SAUCE', 'Soy sauce', 'Pantry staples', 2.06, TRUE, DATEADD(day, 5, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-048', 'GRND BEEF 85/15', 'Ground beef', 'Protein', 5.06, TRUE, DATEADD(day, 6, DATEADD(day, -165, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-049', 'Hilltop Grocer', DATEADD(day, -169, CURRENT_DATE()), 28.11, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -169, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-049', 'COLD BREW COFFEE', 'Cold brew coffee', 'Beverages', 4.97, TRUE, DATEADD(day, 2, DATEADD(day, -169, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-049', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.85, TRUE, DATEADD(day, 4, DATEADD(day, -169, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-049', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 3.47, TRUE, DATEADD(day, 5, DATEADD(day, -169, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-049', 'LEMONS', 'Lemons', 'Produce', 1.02, TRUE, DATEADD(day, 3, DATEADD(day, -169, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-049', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 3.96, TRUE, DATEADD(day, 3, DATEADD(day, -169, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-049', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 4.14, TRUE, DATEADD(day, 2, DATEADD(day, -169, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-049', 'FLOUR TORTILLAS', 'Tortillas', 'Grains', 2.84, TRUE, DATEADD(day, 2, DATEADD(day, -169, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-049', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 1.86, TRUE, DATEADD(day, 4, DATEADD(day, -169, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-050', 'Corner Fresh', DATEADD(day, -172, CURRENT_DATE()), 38.62, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -172, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-050', 'AVOCADO HASS', 'Avocados', 'Produce', 1.47, TRUE, DATEADD(day, 5, DATEADD(day, -172, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-050', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.75, TRUE, DATEADD(day, 3, DATEADD(day, -172, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-050', 'OLIVE OIL 500ML', 'Olive oil', 'Pantry staples', 7.84, TRUE, DATEADD(day, 4, DATEADD(day, -172, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-050', 'GRND BEEF 85/15', 'Ground beef', 'Protein', 6.93, TRUE, DATEADD(day, 4, DATEADD(day, -172, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-050', 'YELLOW ONION', 'Yellow onions', 'Produce', 1.88, TRUE, DATEADD(day, 5, DATEADD(day, -172, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-050', 'ORG BNLS CHKN BRST', 'Chicken breast', 'Protein', 7.15, TRUE, DATEADD(day, 4, DATEADD(day, -172, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-050', 'OLD FASH OATS', 'Rolled oats', 'Grains', 3.4, TRUE, DATEADD(day, 2, DATEADD(day, -172, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-050', 'PRETZELS', 'Pretzels', 'Snacks and sweets', 2.43, TRUE, DATEADD(day, 5, DATEADD(day, -172, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-050', 'TORTILLA CHIPS', 'Tortilla chips', 'Snacks and sweets', 3.77, TRUE, DATEADD(day, 2, DATEADD(day, -172, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-051', 'Sunrise Foods', DATEADD(day, -176, CURRENT_DATE()), 44.38, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -176, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-051', 'COLA 12PK', 'Cola 12-pack', 'Beverages', 5.98, TRUE, DATEADD(day, 6, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-051', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.49, TRUE, DATEADD(day, 4, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-051', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 5.88, TRUE, DATEADD(day, 3, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-051', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.5, TRUE, DATEADD(day, 5, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-051', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.0, TRUE, DATEADD(day, 6, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-051', 'OJ 52OZ', 'Orange juice', 'Beverages', 3.56, TRUE, DATEADD(day, 4, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-051', 'LEMONS', 'Lemons', 'Produce', 1.03, TRUE, DATEADD(day, 6, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-051', 'COLD BREW COFFEE', 'Cold brew coffee', 'Beverages', 5.04, TRUE, DATEADD(day, 4, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-051', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 4.41, TRUE, DATEADD(day, 6, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-051', 'POTATO CHIPS LG', 'Potato chips', 'Snacks and sweets', 3.49, TRUE, DATEADD(day, 6, DATEADD(day, -176, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-052', 'Green Basket Market', DATEADD(day, -179, CURRENT_DATE()), 37.61, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -179, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-052', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 6.05, TRUE, DATEADD(day, 3, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-052', 'COLD BREW COFFEE', 'Cold brew coffee', 'Beverages', 4.53, TRUE, DATEADD(day, 5, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-052', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 2.28, TRUE, DATEADD(day, 3, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-052', 'GUMMY BEARS', 'Gummy bears', 'Snacks and sweets', 2.58, TRUE, DATEADD(day, 5, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-052', 'FRZ DUMPLINGS', 'Frozen dumplings', 'Frozen and prepared', 4.96, TRUE, DATEADD(day, 6, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-052', 'GRANOLA BARS 6CT', 'Granola bars', 'Snacks and sweets', 3.94, TRUE, DATEADD(day, 6, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-052', 'FRZ MAC CHEESE', 'Frozen mac and cheese', 'Frozen and prepared', 2.72, TRUE, DATEADD(day, 5, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-052', 'MICROWAVE BURRITO', 'Microwave burritos', 'Frozen and prepared', 3.36, TRUE, DATEADD(day, 2, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-052', 'GRND TURKEY 1LB', 'Ground turkey', 'Protein', 4.88, TRUE, DATEADD(day, 3, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-052', 'FIRM TOFU', 'Tofu', 'Protein', 2.31, TRUE, DATEADD(day, 6, DATEADD(day, -179, CURRENT_DATE()))::TIMESTAMP_NTZ);

INSERT INTO RECEIPTS (RECEIPT_ID, STORE, PURCHASED_ON, FOOD_TOTAL, IMAGE_PATH, IS_SEED, CREATED_AT) VALUES ('seed-053', 'Hilltop Grocer', DATEADD(day, -183, CURRENT_DATE()), 29.37, NULL, TRUE, DATEADD(hour, 12, DATEADD(day, -183, CURRENT_DATE())::TIMESTAMP_NTZ));
INSERT INTO ITEMS (RECEIPT_ID, RAW_NAME, NAME, CATEGORY, PRICE, USED, USED_AT) VALUES
  ('seed-053', 'ENERGY DRINK', 'Energy drink', 'Beverages', 2.85, TRUE, DATEADD(day, 4, DATEADD(day, -183, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-053', 'HONEY 12OZ', 'Honey', 'Pantry staples', 5.74, TRUE, DATEADD(day, 4, DATEADD(day, -183, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-053', 'DELI SUSHI ROLL', 'Sushi roll', 'Frozen and prepared', 7.29, TRUE, DATEADD(day, 3, DATEADD(day, -183, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-053', 'FRZ MIXED VEG', 'Frozen mixed vegetables', 'Frozen and prepared', 1.76, TRUE, DATEADD(day, 5, DATEADD(day, -183, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-053', 'CHICKEN BROTH', 'Chicken broth', 'Pantry staples', 2.19, TRUE, DATEADD(day, 4, DATEADD(day, -183, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-053', 'FRZ CHKN NUGGETS', 'Frozen chicken nuggets', 'Frozen and prepared', 5.7, TRUE, DATEADD(day, 5, DATEADD(day, -183, CURRENT_DATE()))::TIMESTAMP_NTZ),
  ('seed-053', 'SPARKLING WATER 8PK', 'Sparkling water', 'Beverages', 3.84, TRUE, DATEADD(day, 4, DATEADD(day, -183, CURRENT_DATE()))::TIMESTAMP_NTZ);
