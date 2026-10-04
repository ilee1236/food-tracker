import math

import receipt


def test_keeps_complete_rows_and_normalises():
    rows = [
        {"name": "Chicken breast", "category": "protein", "price": 8.494, "raw_name": "ORG BNLS CHKN BRST"},
        {"name": "Milk", "category": "Dairy", "price": 3.5, "raw_name": None},  # row added by hand
    ]
    assert receipt.clean_review_rows(rows) == [
        {"raw_name": "ORG BNLS CHKN BRST", "name": "Chicken breast", "category": "Protein", "price": 8.49},
        {"raw_name": "Milk", "name": "Milk", "category": "Dairy", "price": 3.5},
    ]


def test_skips_incomplete_rows():
    rows = [
        {"name": "", "category": "Dairy", "price": 1.0},
        {"name": "Eggs", "category": None, "price": 2.0},
        {"name": "Rice", "category": "Grains", "price": math.nan},
        {"name": "Bread", "category": "Grains", "price": None},
        {"name": "Refund", "category": "Grains", "price": -1.0},
        {"name": "Oats", "category": "Grains", "price": 2.5, "raw_name": math.nan},
    ]
    assert [i["name"] for i in receipt.clean_review_rows(rows)] == ["Oats"]
    assert receipt.clean_review_rows(rows)[0]["raw_name"] == "Oats"
