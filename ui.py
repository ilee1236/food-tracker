"""Look and feel: global styles, category colours and food emoji."""

import streamlit as st

PINK = "#FF7AC6"

CATEGORY_STYLE = {
    "Produce": ("#5BE36B", "🥬"),
    "Protein": ("#FF7AC6", "🍗"),
    "Dairy": ("#7CB8FF", "🥛"),
    "Grains": ("#FFD449", "🌾"),
    "Snacks and sweets": ("#B07CFF", "🍪"),
    "Beverages": ("#FF9F43", "🥤"),
    "Frozen and prepared": ("#3ED6C8", "❄️"),
    "Pantry staples": ("#C9C9D6", "🫙"),
}

# Checked in order, so more specific words come first.
FOOD_EMOJI = [
    ("pizza", "🍕"), ("burrito", "🌯"), ("dumpling", "🥟"), ("sushi", "🍣"), ("nugget", "🍗"),
    ("mac and cheese", "🧀"), ("ice cream", "🍨"), ("tortilla chip", "🌮"), ("potato chip", "🥔"),
    ("peanut butter", "🥜"), ("tomato", "🍅"), ("banana", "🍌"), ("apple", "🍎"), ("strawberr", "🍓"), ("grape", "🍇"), ("cherr", "🍒"),
    ("lemon", "🍋"), ("orange juice", "🧃"), ("orange", "🍊"), ("mango", "🥭"), ("pineapple", "🍍"),
    ("peach", "🍑"), ("plum", "🍑"), ("avocado", "🥑"), ("tomato", "🍅"), ("spinach", "🥬"),
    ("lettuce", "🥬"), ("kale", "🥬"), ("broccoli", "🥦"), ("carrot", "🥕"), ("sweet potato", "🍠"),
    ("potato", "🥔"), ("onion", "🧅"), ("garlic", "🧄"), ("pepper", "🫑"), ("cucumber", "🥒"),
    ("zucchini", "🥒"), ("corn", "🌽"), ("mushroom", "🍄"), ("egg", "🥚"), ("chicken", "🍗"),
    ("turkey", "🦃"), ("beef", "🥩"), ("steak", "🥩"), ("pork", "🥓"), ("bacon", "🥓"), ("ham", "🍖"),
    ("salmon", "🐟"), ("fish", "🐟"), ("mahi", "🐟"), ("shrimp", "🦐"), ("tofu", "🧈"), ("bean", "🫘"),
    ("milk", "🥛"), ("yogurt", "🥛"), ("cheese", "🧀"), ("cheddar", "🧀"), ("parmesan", "🧀"),
    ("butter", "🧈"), ("ice cream", "🍨"), ("bread", "🍞"), ("bagel", "🥯"), ("tortilla chip", "🌮"),
    ("tortilla", "🌯"), ("rice", "🍚"), ("pasta", "🍝"), ("penne", "🍝"), ("noodle", "🍜"), ("oat", "🥣"),
    ("quinoa", "🥣"), ("cookie", "🍪"), ("chocolate", "🍫"), ("chip", "🥔"), ("pretzel", "🥨"),
    ("gummy", "🍬"), ("candy", "🍬"), ("granola", "🥜"), ("peanut", "🥜"), ("honey", "🍯"),
    ("coffee", "☕"), ("tea", "🍵"), ("water", "💧"), ("cola", "🥤"), ("soda", "🥤"), ("juice", "🧃"),
    ("energy", "⚡"), ("pizza", "🍕"), ("burrito", "🌯"), ("dumpling", "🥟"), ("sushi", "🍣"),
    ("nugget", "🍗"), ("mac", "🧀"), ("oil", "🫒"), ("sauce", "🥫"), ("broth", "🥫"), ("soy", "🥢"),
    ("salt", "🧂"),
]


def food_emoji(name, category=None):
    lowered = (name or "").lower()
    for word, emoji in FOOD_EMOJI:
        if word in lowered:
            return emoji
    return CATEGORY_STYLE.get(category, ("", "🛒"))[1]


def category_color(category):
    return CATEGORY_STYLE.get(category, ("#C9C9D6", ""))[0]


def inject_styles():
    st.html(f"""
<style>
@import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&display=swap');
.block-container {{ padding-top: 5.5rem; max-width: 1240px; }}
h1, h2, h3 {{ font-weight: 900 !important; letter-spacing: -0.02em; }}
.pink {{ color: {PINK}; }}
.hero {{ font-size: 3.6rem !important; line-height: 1.05 !important; font-weight: 900; margin: 1.2rem 0 1rem !important; }}
.page-title {{ font-size: 3rem !important; line-height: 1.05 !important; font-weight: 900; margin: 0 !important; }}
.subtitle {{ color: #B9B9C2; font-size: 1.2rem !important; margin: 0.3rem 0 1.2rem !important; }}
.muted {{ color: #9A9AA5; font-size: 0.9rem; }}
.step-card {{ background: #121216; border: 1px solid #2A2A31; border-radius: 18px; padding: 1.4rem; height: 100%; }}
.step-num {{ display: inline-flex; width: 2rem; height: 2rem; border-radius: 50%; background: #23232A;
             align-items: center; justify-content: center; font-weight: 800; }}
.step-icon {{ font-size: 3rem; text-align: center; margin: 0.2rem 0 0.6rem; }}
.step-card h4 {{ margin: 0 0 0.3rem; font-weight: 800; }}
.step-card p {{ color: #B9B9C2; margin: 0; }}
.food-emoji {{ font-size: 3.2rem; text-align: center; line-height: 1.2; }}
.food-name {{ font-weight: 800; font-size: 1.05rem; margin-top: 0.3rem; }}
.stat-big {{ font-size: 1.6rem !important; font-weight: 900; margin: 0 !important; }}
div[data-testid="stVerticalBlockBorderWrapper"] {{ background: #121216; border-radius: 18px !important; }}
div[data-testid="stFileUploaderDropzone"] button {{ background: {PINK}; color: #111; font-weight: 800; border: none; }}
div[data-testid="stFileUploaderDropzone"] {{ border: 2px dashed #3A3A44; border-radius: 18px; background: #121216;
                                             padding: 2rem 1rem; }}
.stButton > button[kind="primary"], .stFormSubmitButton > button[kind="primary"] {{
    color: #111 !important; font-weight: 800; border-radius: 14px; padding: 0.55rem 1.4rem; }}
div[data-testid="stSegmentedControl"] button, div[data-testid="stPills"] button {{ border-radius: 999px !important; }}
</style>
""")
