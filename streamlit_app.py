"""Peck (Food Tracker): scan grocery receipts into a pantry, spending and monthly views."""

import uuid
from datetime import datetime, timedelta
from pathlib import Path

import pandas as pd
import streamlit as st
from dotenv import load_dotenv

APP_DIR = Path(__file__).resolve().parent
load_dotenv(APP_DIR / ".env", override=True)

import ai  # noqa: E402
import db  # noqa: E402
import receipt  # noqa: E402
import recipe  # noqa: E402
import spending  # noqa: E402
import ui  # noqa: E402
from prompts import CATEGORIES  # noqa: E402

st.set_page_config(page_title="Peck", page_icon=str(APP_DIR / "assets" / "peck.png"), layout="wide")
ui.inject_styles()
st.logo(str(APP_DIR / "assets" / "peck_wordmark.png"), size="large")


@st.cache_resource
def get_conn():
    return db.connect()


def time_ago(ts):
    seconds = (datetime.now() - ts).total_seconds()
    if seconds < 3600:
        return f"{max(1, int(seconds // 60))} min ago"
    if seconds < 86400:
        hours = int(seconds // 3600)
        return f"{hours} hour{'s' if hours > 1 else ''} ago"
    days = int(seconds // 86400)
    return f"{days} day{'s' if days > 1 else ''} ago"


# ---------- How it Works: upload, review and save ----------

def read_receipt(upload):
    st.session_state.pop("scan", None)
    try:
        with st.spinner("Reading the receipt..."):
            image = receipt.prepare_image(upload.getvalue())
            image_path = f"{uuid.uuid4().hex}.jpg"
            db.put_image(get_conn(), image_path, image)
            result = receipt.extract(get_conn(), image_path)
    except (receipt.ReceiptError, ai.AIError) as e:
        st.error(str(e))
        return
    except Exception:
        st.error("Something went wrong while reading the receipt. Please try again.")
        return

    if not result["is_receipt"]:
        st.warning("This doesn't look like a receipt. Try a photo of a grocery receipt.")
        return
    if not result["items"]:
        st.info("No food items found")
        return
    result["image_path"] = image_path
    result["image"] = image
    st.session_state.scan = result
    st.rerun()


def upload_box():
    with st.container(border=True):
        upload = st.file_uploader("Upload Receipt", type=["jpg", "jpeg", "png"],
                                  key=f"upload_{st.session_state.get('upload_key', 0)}",
                                  help="JPG or PNG photo of a grocery receipt")
        if upload is not None and st.button("Read receipt", type="primary", width="stretch"):
            read_receipt(upload)


def review(scan):
    left, right = st.columns([5, 9], gap="large")
    with left:
        upload_box()
        with st.container(border=True):
            st.markdown("**Receipt Preview**")
            st.image(scan["image"], width="stretch")

    with right, st.container(border=True):
        st.markdown('<p class="page-title" style="font-size:2.2rem">Review Extracted Items</p>'
                    '<p class="subtitle">We kept food items from your receipt. You can edit any mistakes '
                    'before saving them to your pantry.</p>', unsafe_allow_html=True)
        col1, col2 = st.columns(2)
        scan["store"] = col1.text_input("Store", value=scan["store"] or "")
        scan["purchased_on"] = col2.date_input("Date", value=scan["purchased_on"])

        edited = st.data_editor(
            pd.DataFrame(scan["items"], columns=["name", "category", "price", "raw_name"]),
            num_rows="dynamic", width="stretch", hide_index=True, key="review_table",
            column_config={
                "name": st.column_config.TextColumn("Item", required=True),
                "category": st.column_config.SelectboxColumn("Category", options=CATEGORIES, required=True),
                "price": st.column_config.NumberColumn("Price", min_value=0.0, format="$%.2f", required=True),
                "raw_name": st.column_config.TextColumn("As printed"),
            },
        )
        total_col, save_col = st.columns([3, 2])
        total_col.markdown(f'<p class="stat-big">Food total ${edited["price"].fillna(0).sum():.2f}</p>',
                           unsafe_allow_html=True)
        if save_col.button("🫙  Save to Pantry", type="primary", width="stretch"):
            save(scan, edited)


def save(scan, edited):
    items = receipt.clean_review_rows(edited.to_dict("records"))
    if not items:
        st.error("Add at least one item with a name, category and price before saving.")
        return
    try:
        db.save_receipt(get_conn(), scan["store"] or None, scan["purchased_on"], scan["image_path"], items)
    except Exception:
        st.error("The receipt could not be saved. Please try again.")
        return
    st.session_state.pop("scan", None)
    st.session_state.pop("review_table", None)
    st.session_state.upload_key = st.session_state.get("upload_key", 0) + 1
    st.session_state.saved_message = f"Saved {len(items)} items to your pantry."
    st.rerun()


def how_it_works_page():
    if "saved_message" in st.session_state:
        st.success(st.session_state.pop("saved_message"))

    scan = st.session_state.get("scan")
    if scan:
        review(scan)
        return

    left, right = st.columns([7, 5], gap="large")
    with left:
        st.markdown('<p class="hero">Turn your grocery receipts into <span class="pink">meals</span></p>'
                    '<p class="subtitle">Snap a picture of your receipt, and Peck extracts your groceries, '
                    'builds your pantry, and suggests delicious meal ideas automatically.</p>',
                    unsafe_allow_html=True)
    with right:
        upload_box()

    steps = [
        ("🧾", "Upload Receipts", "Snap a picture of your grocery receipt. Peck reads and extracts all your items automatically."),
        ("🥬🧀", "Build Your Pantry", "Peck organizes your items into your virtual pantry so you always know what you have on hand."),
        ("🥗", "Get Meal Ideas", "Peck suggests delicious recipes based on what's in your pantry, so you can cook more and waste less."),
    ]
    for col, (n, (icon, title, text)) in zip(st.columns(3), enumerate(steps, 1)):
        col.markdown(f'<div class="step-card"><span class="step-num">{n}</span>'
                     f'<div class="step-icon">{icon}</div><h4>{title}</h4><p>{text}</p></div>',
                     unsafe_allow_html=True)


# ---------- Fridge: pantry, spending, monthly ----------

def mark_used(item_id):
    db.set_used(get_conn(), item_id, True)
    st.session_state.last_used = item_id


def undo_last():
    item_id = st.session_state.pop("last_used", None)
    if item_id:
        db.set_used(get_conn(), item_id, False)
        st.session_state.pop(f"used_{item_id}", None)  # so the item comes back unticked


def pantry_grid(pantry):
    query = st.text_input("Search", placeholder="🔍  Search your pantry...", label_visibility="collapsed")
    present = [c for c in CATEGORIES if c in set(pantry["category"])]
    chosen = st.pills("Category", ["All"] + present, default="All", label_visibility="collapsed")

    shown = pantry
    if query:
        shown = shown[shown["name"].str.contains(query, case=False, regex=False)]
    if chosen and chosen != "All":
        shown = shown[shown["category"] == chosen]
    if shown.empty:
        st.info("Nothing matches. Try another search or category.")
        return

    today = datetime.now().date()
    rows = list(shown.itertuples())
    for start in range(0, len(rows), 4):
        for col, item in zip(st.columns(4), rows[start:start + 4]):
            added = "Added today" if item.created_at.date() == today else f"Bought {item.created_at:%b %d}"
            with col, st.container(border=True):
                st.markdown(f'<div class="food-emoji">{ui.food_emoji(item.name, item.category)}</div>'
                            f'<div class="food-name">{item.name}</div>'
                            f'<div class="muted">{item.category} · ${item.price:.2f}</div>'
                            f'<div class="muted">{added}</div>', unsafe_allow_html=True)
                st.checkbox("Mark used", key=f"used_{item.item_id}", on_change=mark_used, args=(item.item_id,))


def pantry_actions(pantry):
    with st.container(border=True):
        st.markdown("### Pantry Actions")
        st.markdown(f'<p class="stat-big">🧺 {len(pantry)} active items</p>'
                    '<p class="muted">Items from the last 21 days.</p>', unsafe_allow_html=True)
        st.divider()
        st.markdown("#### Recently used")
        try:
            recent = db.get_recently_used(get_conn())
        except Exception:
            recent = pd.DataFrame()
        if recent.empty:
            st.caption("Nothing used yet.")
        for item in recent.itertuples():
            st.markdown(f'✅ {ui.food_emoji(item.name, item.category)} **{item.name}**  \n'
                        f'<span class="muted">Marked as used · {time_ago(item.used_at)}</span>',
                        unsafe_allow_html=True)
        st.button("↺  Undo last action", on_click=undo_last, width="stretch",
                  disabled="last_used" not in st.session_state)
        st.divider()
        if st.button("🍲  Suggest a Recipe  ›", type="primary", width="stretch"):
            st.session_state.auto_suggest = True
            st.switch_page(recipes)


def fridge_page():
    st.markdown('<p class="page-title">Your Pantry</p>'
                '<p class="subtitle">Items bought and not yet used.</p>', unsafe_allow_html=True)
    try:
        pantry = db.get_pantry(get_conn())
    except Exception:
        st.error("The pantry could not be loaded. Please try again.")
        return
    main, side = st.columns([7, 3], gap="large")
    with main:
        if pantry.empty:
            st.info("Your pantry is empty. Scan a receipt to add food.")
        else:
            pantry_grid(pantry)
    with side:
        pantry_actions(pantry)


# ---------- Spending: weekly and monthly ----------

def money(x):
    return f"${x:,.2f}"


def stat_row(cards):
    for col, card in zip(st.columns(3), cards):
        col.markdown(ui.stat_card(*card), unsafe_allow_html=True)


def chart_card(title, subtitle, chart):
    with st.container(border=True):
        st.markdown(f"### {title}\n<span class='muted'>{subtitle}</span>", unsafe_allow_html=True)
        st.altair_chart(chart, use_container_width=True)


def category_chart(cats):
    shown = cats[cats["spend"] > 0]
    data = shown.assign(label=[f"{ui.CATEGORY_STYLE[c][1]} {ui.SHORT_NAME[c]}" for c in shown["category"]])
    return ui.bar_chart(data, "label", "spend", colors=[ui.category_color(c) for c in shown["category"]])


def weekly_view(conn, today):
    weeks = spending.fill_periods(db.get_period_totals(conn, "week", 16),
                                  spending.period_starts("week", today, 16))
    this, last = weeks.iloc[-1], weeks.iloc[-2]
    recent, earlier = weeks.tail(8), weeks.iloc[:-8]
    stat_row([
        ("👛", "This week", money(this.spend), ui.delta_html(spending.pct_change(this.spend, last.spend), "vs. last week")),
        ("📊", "Average per week", money(recent.spend.mean()),
         ui.delta_html(spending.pct_change(recent.spend.mean(), earlier.spend.mean()), "vs. previous 8 weeks")),
        ("🧾", "Receipts scanned", f"{int(this.receipts)}",
         ui.delta_html(spending.pct_change(this.receipts, last.receipts), "vs. last week", good_when_down=False)),
    ])
    week_end = this.period_start + timedelta(days=6)
    cats = spending.category_table(db.get_category_spend(conn, this.period_start, week_end + timedelta(days=1)))
    left, right = st.columns([11, 9], gap="medium")
    with left:
        data = recent.assign(week=[f"{d:%b} {d.day}" for d in recent.period_start])
        chart_card("Weekly Food Spending", "Last 8 weeks", ui.bar_chart(data, "week", "spend"))
    with right:
        sub = f"Total spend for {this.period_start:%b} {this.period_start.day} – {week_end:%b} {week_end.day}"
        if cats.spend.sum() > 0:
            chart_card("Spend by Category This Week", sub, category_chart(cats))
        else:
            with st.container(border=True):
                st.markdown(f"### Spend by Category This Week\n<span class='muted'>{sub}</span>",
                            unsafe_allow_html=True)
                st.info("No groceries scanned this week yet.")


def monthly_view(conn, today):
    months = spending.fill_periods(db.get_period_totals(conn, "month", 12),
                                   spending.period_starts("month", today, 12))
    with_data = [d for d, s in zip(months.period_start, months.spend) if s > 0]
    if not with_data:
        st.info("No spending yet. Scan a receipt to get started.")
        return
    options = list(reversed(with_data))
    current = spending.month_start(today)
    default = next((d for d in options if d < current), options[0])  # last complete month
    chosen = st.columns([1, 3])[0].selectbox("Month", options, index=options.index(default),
                                            format_func=lambda d: f"{d:%B %Y}")

    i = list(months.period_start).index(chosen)
    month, prev = months.iloc[i], (months.iloc[i - 1] if i > 0 else None)
    prev_spend = prev.spend if prev is not None else 0
    prev3 = months.iloc[max(0, i - 3):i]
    weeks_in_month = (spending.add_months(chosen, 1) - chosen).days / 7
    stat_row([
        ("👛", f"{chosen:%B}", money(month.spend), ui.delta_html(spending.pct_change(month.spend, prev_spend), "vs. last month")),
        ("📊", "Average per week", money(month.spend / weeks_in_month),
         ui.delta_html(spending.pct_change(month.spend, prev3.spend.mean() if len(prev3) else 0),
                       "vs. previous 3 months")),
        ("🧾", "Receipts scanned", f"{int(month.receipts)}",
         ui.delta_html(spending.pct_change(month.receipts, prev.receipts if prev is not None else 0),
                       "vs. last month", good_when_down=False)),
    ])

    cats = spending.category_table(db.get_category_spend(conn, chosen, spending.add_months(chosen, 1)))
    left, right = st.columns([11, 9], gap="medium")
    with left:
        chart_card("Spending by Category", f"Total spent for {chosen:%B %Y}", category_chart(cats))
    with right:
        trend = months.iloc[max(0, i - 5):i + 1]
        data = trend.assign(month=[f"{d:%b}" for d in trend.period_start])
        chart_card("Monthly Spend Trend", "Last 6 months", ui.bar_chart(data, "month", "spend"))

    if prev is not None:
        prev_cats = spending.category_table(db.get_category_spend(conn, prev.period_start, chosen))
        changes = spending.category_changes(cats, prev_cats)
        with st.container(border=True):
            st.markdown(f"### vs Last Month <span class='muted' style='font-size:1rem;font-weight:400'>"
                        f"Category changes from {prev.period_start:%B} to {chosen:%B %Y}</span>",
                        unsafe_allow_html=True)
            for col, row in zip(st.columns(len(changes)), changes.itertuples()):
                pct = "new" if row.pct is None else f"{row.pct:+.0f}%"
                color = ui.category_color(row.category)
                verb = "more" if row.change >= 0 else "less"
                col.markdown(f'<div class="change-card"><div class="muted">{ui.CATEGORY_STYLE[row.category][1]} '
                             f'{row.category}</div><div class="change-pct" style="color:{color}">{pct}</div>'
                             f'<div class="muted">You spent {money(abs(row.change))} {verb}.</div></div>',
                             unsafe_allow_html=True)


def spending_page():
    title_col, tab_col = st.columns([3, 2], vertical_alignment="center")
    title_col.markdown('<p class="page-title">Food <span class="pink">Spending</span></p>'
                       '<p class="subtitle">Track your grocery spending over time.</p>', unsafe_allow_html=True)
    view = tab_col.segmented_control("View", ["Weekly", "Monthly"], default="Weekly", key="spending_view",
                                     label_visibility="collapsed") or "Weekly"
    try:
        conn = get_conn()
        today = db.get_today(conn)
        if view == "Weekly":
            weekly_view(conn, today)
        else:
            monthly_view(conn, today)
    except Exception:
        st.error("Spending could not be loaded. Please try again.")


# ---------- Recipes ----------

def make_recipe():
    try:
        pantry = db.get_pantry(get_conn())
        seen = st.session_state.setdefault("recipe_titles", [])
        with st.spinner("Peck is thinking up a recipe..."):
            st.session_state.recipe = recipe.suggest(get_conn(), list(pantry["name"]), avoid_titles=seen[-5:])
        st.session_state.recipe["pantry"] = list(pantry["name"])
        seen.append(st.session_state.recipe["title"])
    except (recipe.RecipeError, ai.AIError) as e:
        st.session_state.pop("recipe", None)
        st.error(str(e))
    except Exception:
        st.session_state.pop("recipe", None)
        st.error("Something went wrong while making a recipe. Please try again.")


def show_recipe(r):
    owned, staples, missing = recipe.check_uses(r["uses"], r["pantry"])
    time_text = f"{r['time']} min" if (r["time"] or "").isdigit() else (r["time"] or "—")

    main, side = st.columns([7, 3], gap="large")
    with main, st.container(border=True):
        pic, body = st.columns([2, 3], gap="large")
        pic.markdown(f'<div style="font-size:9rem;text-align:center;padding:2rem 0">'
                     f'{ui.dish_emoji(r["title"])}</div>',
                     unsafe_allow_html=True)
        with body:
            servings = f" &nbsp;·&nbsp; 🍽 Serves <b>{r['servings']}</b>" if r.get("servings") else ""
            st.markdown(f'<p class="page-title" style="font-size:2rem">{r["title"]}</p>'
                        f'<p class="subtitle">⏱ Time: <b>{time_text}</b>{servings}</p>', unsafe_allow_html=True)
            st.markdown(f"**Uses:** {', '.join(r['uses']) or '—'}")
            st.divider()
            st.markdown("#### Steps")
            st.markdown("\n".join(f"{i}. {step}" for i, step in enumerate(r["steps"], 1)))

        nutrition = r.get("nutrition") or {}
        if nutrition:
            st.divider()
            st.markdown("#### Nutrition per serving "
                        "<span class='muted'>· estimated from typical portions, not medical advice</span>",
                        unsafe_allow_html=True)
            tiles = "".join(
                f'<div class="nutri-tile"><div class="nutri-value">{value:g}<span>{unit}</span></div>'
                f'<div class="muted">{name}</div></div>'
                for name, (value, unit) in nutrition.items())
            st.markdown(f'<div class="nutri-row">{tiles}</div>', unsafe_allow_html=True)

    with side, st.container(border=True):
        st.markdown("### Ingredients")
        if not missing:
            st.markdown('<span class="pill-badge">All from your pantry or basic staples ✨</span>',
                        unsafe_allow_html=True)
        for name in owned + staples:
            st.markdown(f"{ui.ingredient_emoji(name)} {name} <span class='pink' style='float:right'>✔</span>",
                        unsafe_allow_html=True)
        for name in missing:
            st.markdown(f"⚠️ {name} <span class='muted' style='float:right'>not in pantry</span>",
                        unsafe_allow_html=True)
        st.divider()
        st.markdown('<div class="fake-button">🔖 Save Recipe</div>', unsafe_allow_html=True)


def recipes_page():
    title_col, button_col = st.columns([3, 1], vertical_alignment="center")
    title_col.markdown('<p class="page-title">Recipe <span class="pink">Suggestion</span></p>'
                       '<p class="subtitle">This recipe uses only your unused pantry items, plus basic staples like '
                       'salt, pepper, oil, and water.</p>', unsafe_allow_html=True)
    clicked = button_col.button("✨  Suggest a Recipe", type="primary", width="stretch")
    if clicked or st.session_state.pop("auto_suggest", False):
        make_recipe()

    if "recipe" in st.session_state:
        show_recipe(st.session_state.recipe)
    elif not clicked:
        st.info("Press **Suggest a Recipe** to cook something from what's in your pantry.")


how_it_works = st.Page(how_it_works_page, title="How it Works", url_path="how-it-works", default=True)
fridge = st.Page(fridge_page, title="Fridge", url_path="fridge")
spending_tab = st.Page(spending_page, title="Spending", url_path="spending")
recipes = st.Page(recipes_page, title="Recipes", url_path="recipes")
st.navigation([how_it_works, fridge, spending_tab, recipes], position="top").run()
