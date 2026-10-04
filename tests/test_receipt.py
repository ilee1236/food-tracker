import io
import json
from datetime import date

import pytest
from PIL import Image

import receipt


def reply(**overrides):
    data = {
        "is_receipt": True,
        "store": "Green Basket",
        "purchased_on": "2026-10-01",
        "items": [
            {"raw_name": "ORG BNLS CHKN BRST", "name": "Chicken breast", "category": "Protein", "price": 8.49},
            {"raw_name": "BANANAS", "name": "Bananas", "category": "produce", "price": "1.29"},
        ],
    }
    data.update(overrides)
    return json.dumps(data)


def test_parses_plain_json():
    r = receipt.parse_reply(reply())
    assert r["store"] == "Green Basket"
    assert r["purchased_on"] == date(2026, 10, 1)
    assert [i["name"] for i in r["items"]] == ["Chicken breast", "Bananas"]
    assert r["items"][1]["category"] == "Produce"  # case normalised
    assert r["items"][1]["price"] == 1.29  # string price coerced


def test_strips_code_fences_and_extra_text():
    r = receipt.parse_reply("Here you go:\n```json\n" + reply() + "\n```\nThanks!")
    assert len(r["items"]) == 2


def test_drops_items_outside_food_categories():
    items = [
        {"raw_name": "BAG FEE", "name": "Bag fee", "category": "Fees", "price": 0.10},
        {"raw_name": "MILK", "name": "Milk", "category": "Dairy", "price": 3.50},
        {"raw_name": "???", "name": "", "category": "Dairy", "price": 1.00},
        {"raw_name": "EGGS", "name": "Eggs", "category": "Protein", "price": None},
    ]
    r = receipt.parse_reply(reply(items=items))
    assert [i["name"] for i in r["items"]] == ["Milk"]


def test_missing_date_defaults_to_today():
    assert receipt.parse_reply(reply(purchased_on=None))["purchased_on"] == date.today()


def test_not_a_receipt():
    r = receipt.parse_reply(reply(is_receipt=False, items=[]))
    assert r["is_receipt"] is False and r["items"] == []


@pytest.mark.parametrize("bad", ["no json here", '{"store": "x"}', "{broken"])
def test_invalid_replies_raise(bad):
    with pytest.raises(ValueError):
        receipt.parse_reply(bad)


def test_extract_retries_once_then_errors(monkeypatch):
    calls = []
    monkeypatch.setattr(receipt.ai, "complete", lambda *a, **k: calls.append(1) or "not json")
    with pytest.raises(receipt.ReceiptError):
        receipt.extract(None, "x.jpg")
    assert len(calls) == 2


def test_extract_recovers_on_second_try(monkeypatch):
    replies = iter(["garbage", reply()])
    monkeypatch.setattr(receipt.ai, "complete", lambda *a, **k: next(replies))
    assert len(receipt.extract(None, "x.jpg")["items"]) == 2


def test_prepare_image_resizes_large_png():
    buf = io.BytesIO()
    Image.new("RGB", (4000, 3000), "white").save(buf, format="PNG")
    out = receipt.prepare_image(buf.getvalue())
    img = Image.open(io.BytesIO(out))
    assert img.format == "JPEG"
    assert max(img.size) == 1600
    assert len(out) <= receipt.MAX_BYTES


def test_prepare_image_rejects_non_image():
    with pytest.raises(receipt.ReceiptError):
        receipt.prepare_image(b"definitely not an image")


def test_drops_items_marked_not_food():
    items = [
        {"raw_name": "DAWN ORIG", "name": "Dawn dish soap", "category": "Pantry staples", "price": 1.12, "is_food": False},
        {"raw_name": "BANANAS", "name": "Bananas", "category": "Produce", "price": 0.95, "is_food": True},
        {"raw_name": "EGGS", "name": "Eggs", "category": "Protein", "price": 2.48},  # flag missing: category check decides
    ]
    r = receipt.parse_reply(reply(items=items))
    assert [i["name"] for i in r["items"]] == ["Bananas", "Eggs"]


def test_drops_discount_lines_with_zero_or_negative_price():
    items = [
        {"raw_name": "$2 off (1) UC Fill", "name": "Discount", "category": "Pantry staples", "price": -2.00},
        {"raw_name": "FREE SAMPLE", "name": "Sample", "category": "Snacks and sweets", "price": 0},
        {"raw_name": "PLUMS", "name": "Plums", "category": "Produce", "price": 2.15},
    ]
    assert [i["name"] for i in receipt.parse_reply(reply(items=items))["items"]] == ["Plums"]
