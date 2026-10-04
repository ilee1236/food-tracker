"""Spending calculations: fill gaps in period totals and compare periods."""

from datetime import date, timedelta

import pandas as pd

from prompts import CATEGORIES


def week_start(d):
    return d - timedelta(days=d.weekday())


def month_start(d):
    return d.replace(day=1)


def add_months(d, n):
    m = d.month - 1 + n
    return date(d.year + m // 12, m % 12 + 1, 1)


def period_starts(period, today, count):
    """The last `count` week or month start dates, oldest first, ending with the current one."""
    if period == "week":
        last = week_start(today)
        return [last - timedelta(weeks=i) for i in range(count - 1, -1, -1)]
    last = month_start(today)
    return [add_months(last, -i) for i in range(count - 1, -1, -1)]


def fill_periods(totals, starts):
    """One row per period start, with zero spend and receipts where nothing was bought."""
    by_start = {pd.Timestamp(r.period_start).date(): r for r in totals.itertuples()}
    rows = [{"period_start": s, "spend": float(by_start[s].spend) if s in by_start else 0.0,
             "receipts": int(by_start[s].receipts) if s in by_start else 0} for s in starts]
    return pd.DataFrame(rows, columns=["period_start", "spend", "receipts"])


def pct_change(current, previous):
    """Percent change, or None when there is nothing to compare against."""
    if not previous:
        return None
    return (current - previous) / previous * 100


def category_table(spend):
    """All eight categories in fixed order, with zero where nothing was bought."""
    values = {r.category: float(r.spend) for r in spend.itertuples()} if not spend.empty else {}
    return pd.DataFrame({"category": CATEGORIES, "spend": [values.get(c, 0.0) for c in CATEGORIES]})


def category_changes(current, previous, top=5):
    """Biggest category changes between two category tables, largest dollar change first."""
    merged = current.merge(previous, on="category", suffixes=("", "_prev"))
    merged["change"] = merged["spend"] - merged["spend_prev"]
    merged["pct"] = [pct_change(c, p) for c, p in zip(merged["spend"], merged["spend_prev"])]
    merged = merged[(merged["spend"] > 0) | (merged["spend_prev"] > 0)]
    return merged.reindex(merged["change"].abs().sort_values(ascending=False).index).head(top)
