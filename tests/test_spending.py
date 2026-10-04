from datetime import date

import pandas as pd

import spending


def test_week_and_month_starts():
    assert spending.week_start(date(2026, 10, 4)) == date(2026, 9, 28)  # Sunday -> Monday before
    assert spending.period_starts("week", date(2026, 10, 4), 3) == [date(2026, 9, 14), date(2026, 9, 21), date(2026, 9, 28)]
    assert spending.period_starts("month", date(2026, 2, 15), 3) == [date(2025, 12, 1), date(2026, 1, 1), date(2026, 2, 1)]
    assert spending.add_months(date(2026, 12, 1), 1) == date(2027, 1, 1)


def test_fill_periods_adds_zero_weeks():
    totals = pd.DataFrame({"period_start": [date(2026, 9, 14), date(2026, 9, 28)], "spend": [40.0, 60.5], "receipts": [1, 2]})
    filled = spending.fill_periods(totals, spending.period_starts("week", date(2026, 10, 4), 3))
    assert list(filled["spend"]) == [40.0, 0.0, 60.5]
    assert list(filled["receipts"]) == [1, 0, 2]


def test_pct_change():
    assert spending.pct_change(90, 100) == -10
    assert spending.pct_change(150, 100) == 50
    assert spending.pct_change(10, 0) is None


def test_category_table_has_all_eight_in_order():
    t = spending.category_table(pd.DataFrame({"category": ["Dairy", "Produce"], "spend": [5.0, 7.5]}))
    assert len(t) == 8 and t.iloc[0].category == "Produce" and t.iloc[0].spend == 7.5
    assert t.set_index("category").loc["Grains", "spend"] == 0.0


def test_category_changes_biggest_first():
    now = spending.category_table(pd.DataFrame({"category": ["Produce", "Protein", "Frozen and prepared"], "spend": [50.0, 100.0, 5.0]}))
    before = spending.category_table(pd.DataFrame({"category": ["Produce", "Protein", "Frozen and prepared"], "spend": [10.0, 90.0, 125.0]}))
    changes = spending.category_changes(now, before, top=2)
    assert list(changes["category"]) == ["Frozen and prepared", "Produce"]
    assert round(changes.iloc[0].pct) == -96 and changes.iloc[1]["change"] == 40.0
