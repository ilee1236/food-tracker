"""Prompts and model names. Swap the model here."""

EXTRACTION_MODEL = "claude-haiku-4-5"

CATEGORIES = [
    "Produce",
    "Protein",
    "Dairy",
    "Grains",
    "Snacks and sweets",
    "Beverages",
    "Frozen and prepared",
    "Pantry staples",
]

EXTRACTION_PROMPT = """You read grocery receipts. Return only a JSON object, no other text:
{
  "is_receipt": boolean,
  "store": string or null,
  "purchased_on": "YYYY-MM-DD" or null,
  "items": [
    { "raw_name": string, "name": string, "category": string,
      "price": number, "is_food": boolean }
  ]
}

Rules:
- Include food and drink items only. Leave out bags, household and
  personal-care products, tax, deposits, discounts and totals.
- is_food is true only for things people eat or drink. Set it false for
  cleaning and laundry products, paper and plastic goods, kitchenware,
  batteries, toys, clothing, medicine, vitamins and supplements,
  personal care, and gift cards.
- Discount, coupon and savings lines are never items, even if printed
  with a positive amount.
- raw_name is the text as printed. name is a plain readable name,
  for example "ORG BNLS CHKN BRST" becomes "Chicken breast".
- category is exactly one of: Produce, Protein, Dairy, Grains,
  Snacks and sweets, Beverages, Frozen and prepared, Pantry staples.
- price is the line price as a number, without a currency symbol.
- Do not invent items. If the image is not a receipt, return
  is_receipt false and an empty items list."""
