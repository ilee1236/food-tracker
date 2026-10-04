"""Peck (Food Tracker): scan grocery receipts into a pantry, spending and monthly views."""

import uuid
from datetime import datetime
from pathlib import Path

import pandas as pd
import streamlit as st
from dotenv import load_dotenv

APP_DIR = Path(__file__).resolve().parent
load_dotenv(APP_DIR / ".env", override=True)

import ai  # noqa: E402
import db  # noqa: E402
import receipt  # noqa: E402
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
            st.switch_page(recipes)


def fridge_page():
    title_col, tab_col = st.columns([3, 2], vertical_alignment="center")
    tab = tab_col.segmented_control("Fridge view", ["Pantry", "Spending", "Monthly"], default="Pantry",
                                    key="fridge_tab", label_visibility="collapsed") or "Pantry"

    if tab == "Pantry":
        title_col.markdown('<p class="page-title">Your Pantry</p>'
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
    else:
        title_col.markdown(f'<p class="page-title">Food <span class="pink">{tab}</span></p>'
                           '<p class="subtitle">Coming soon.</p>', unsafe_allow_html=True)


# ---------- Recipes ----------

def recipes_page():
    st.markdown('<p class="page-title">Recipe <span class="pink">Suggestion</span></p>'
                '<p class="subtitle">This recipe uses only your unused pantry items, plus basic staples like '
                'salt, pepper, oil, and water.</p>', unsafe_allow_html=True)
    st.info("Coming soon.")


how_it_works = st.Page(how_it_works_page, title="How it Works", url_path="how-it-works", default=True)
fridge = st.Page(fridge_page, title="Fridge", url_path="fridge")
recipes = st.Page(recipes_page, title="Recipes", url_path="recipes")
st.navigation([how_it_works, fridge, recipes], position="top").run()
