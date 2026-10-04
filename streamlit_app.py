"""Food Tracker: scan grocery receipts into a pantry, spending and monthly views."""

import uuid
from pathlib import Path

import pandas as pd
import streamlit as st
from dotenv import load_dotenv

load_dotenv(Path(__file__).resolve().parent / ".env", override=True)

import ai  # noqa: E402
import db  # noqa: E402
import receipt  # noqa: E402
from prompts import CATEGORIES  # noqa: E402

st.set_page_config(page_title="Food Tracker", page_icon="🛒")


@st.cache_resource
def get_conn():
    return db.connect()


def scan_page():
    st.title("Scan a receipt")
    st.caption("Upload a photo of a grocery receipt. Only food items are kept.")

    if "saved_message" in st.session_state:
        st.success(st.session_state.pop("saved_message"))

    upload = st.file_uploader("Receipt photo", type=["jpg", "jpeg", "png"],
                              key=f"upload_{st.session_state.get('upload_key', 0)}")
    if upload is not None and st.button("Read receipt", type="primary"):
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
        st.session_state.scan = result

    scan = st.session_state.get("scan")
    if not scan:
        return

    st.subheader("Review")
    col1, col2 = st.columns(2)
    scan["store"] = col1.text_input("Store", value=scan["store"] or "")
    scan["purchased_on"] = col2.date_input("Date", value=scan["purchased_on"])

    edited = st.data_editor(
        pd.DataFrame(scan["items"], columns=["name", "category", "price", "raw_name"]),
        num_rows="dynamic",
        width="stretch",
        hide_index=True,
        column_config={
            "name": st.column_config.TextColumn("Item", required=True),
            "category": st.column_config.SelectboxColumn("Category", options=CATEGORIES, required=True),
            "price": st.column_config.NumberColumn("Price", min_value=0.0, format="$%.2f", required=True),
            "raw_name": st.column_config.TextColumn("As printed"),
        },
        key="review_table",
    )
    st.metric("Food total", f"${edited['price'].fillna(0).sum():.2f}")

    if st.button("Save to pantry", type="primary"):
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


def mark_used(item_id):
    db.set_used(get_conn(), item_id, True)
    st.session_state.last_used = item_id


def pantry_page():
    st.title("Pantry")
    st.caption("Food you bought in the last 21 days and haven't used yet. Tick items as you use them.")

    if st.session_state.get("last_used") and st.button("Undo last tick"):
        item_id = st.session_state.pop("last_used")
        db.set_used(get_conn(), item_id, False)
        st.session_state.pop(f"used_{item_id}", None)  # so the item comes back unticked
        st.rerun()

    try:
        pantry = db.get_pantry(get_conn())
    except Exception:
        st.error("The pantry could not be loaded. Please try again.")
        return
    if pantry.empty:
        st.info("Your pantry is empty. Scan a receipt to add food.")
        return

    st.write(f"**{len(pantry)} items** on hand")
    for (store, scanned), group in pantry.groupby(["store", "created_at"], sort=False):
        st.subheader(f"{store or 'Receipt'} · {scanned:%b %d}")
        for item in group.itertuples():
            st.checkbox(f"{item.name}  ·  {item.category}  ·  ${item.price:.2f}",
                        key=f"used_{item.item_id}", on_change=mark_used, args=(item.item_id,))


def placeholder_page(title):
    def page():
        st.title(title)
        st.info("Coming soon.")
    return page


pages = {
    "Scan": scan_page,
    "Pantry": pantry_page,
    "Spending": placeholder_page("Spending"),
    "Monthly": placeholder_page("Monthly"),
}
choice = st.sidebar.radio("Pages", list(pages))
pages[choice]()
