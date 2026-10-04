"""Receipt image preparation and extraction-reply parsing."""

import io
import json
import re
from datetime import date

from PIL import Image, ImageOps, UnidentifiedImageError

import ai
from prompts import CATEGORIES, EXTRACTION_MODEL, EXTRACTION_PROMPT

MAX_SIDE = 1600
MAX_BYTES = int(3.5 * 1024 * 1024)

_CATEGORY_LOOKUP = {c.lower(): c for c in CATEGORIES}


class ReceiptError(Exception):
    """A user-facing problem with the receipt; the message is safe to show."""


def prepare_image(data):
    """Return JPEG bytes at most MAX_SIDE px on the long side and under MAX_BYTES."""
    try:
        img = Image.open(io.BytesIO(data))
        img = ImageOps.exif_transpose(img)
        img = img.convert("RGB")
    except (UnidentifiedImageError, OSError):
        raise ReceiptError("That file could not be read as an image. Try a JPEG or PNG photo.")

    img.thumbnail((MAX_SIDE, MAX_SIDE))
    for quality in (85, 70, 55, 40):
        out = io.BytesIO()
        img.save(out, format="JPEG", quality=quality)
        if out.tell() <= MAX_BYTES:
            return out.getvalue()
    raise ReceiptError("That image is too large even after resizing. Try a smaller photo.")


def parse_reply(text):
    """Parse the model's reply into a clean receipt dict, or raise ValueError."""
    text = re.sub(r"```(?:json)?", "", text)
    start = text.find("{")
    if start == -1:
        raise ValueError("no JSON object in reply")
    data, _ = json.JSONDecoder().raw_decode(text[start:])

    if not isinstance(data, dict) or not isinstance(data.get("items"), list):
        raise ValueError("reply is missing the items list")

    items = []
    for raw in data["items"]:
        if not isinstance(raw, dict):
            continue
        category = _CATEGORY_LOOKUP.get(str(raw.get("category", "")).strip().lower())
        name = str(raw.get("name") or "").strip()
        try:
            price = round(float(raw.get("price")), 2)
        except (TypeError, ValueError):
            continue
        if raw.get("is_food") is False or not category or not name or price <= 0:
            continue  # non-food, outside the eight categories, or a discount line
        items.append({
            "raw_name": str(raw.get("raw_name") or name).strip(),
            "name": name,
            "category": category,
            "price": price,
        })

    try:
        purchased_on = date.fromisoformat(str(data.get("purchased_on")))
    except ValueError:
        purchased_on = date.today()

    return {
        "is_receipt": bool(data.get("is_receipt", True)),
        "store": (data.get("store") or "").strip() or None,
        "purchased_on": purchased_on,
        "items": items,
    }


def extract(conn, stage_file):
    """Ask the model to read the staged receipt; retry once if the reply is not valid JSON."""
    for attempt in range(2):
        reply = ai.complete(conn, EXTRACTION_MODEL, EXTRACTION_PROMPT, stage_file=stage_file, temperature=0)
        try:
            return parse_reply(reply)
        except ValueError:
            if attempt == 1:
                raise ReceiptError("The receipt could not be read clearly. Try a sharper, flatter photo.")


def clean_review_rows(rows):
    """Keep only complete rows from the review table, in the shape save_receipt expects."""
    items = []
    for row in rows:
        name = str(row.get("name") or "").strip()
        category = _CATEGORY_LOOKUP.get(str(row.get("category") or "").strip().lower())
        try:
            price = round(float(row.get("price")), 2)
        except (TypeError, ValueError):
            continue
        if not name or not category or price != price or price < 0:  # price != price catches NaN
            continue
        raw_name = str(row.get("raw_name") or "").strip()
        items.append({"raw_name": raw_name if raw_name and raw_name != "nan" else name,
                      "name": name, "category": category, "price": price})
    return items
