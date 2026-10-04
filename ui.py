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

SHORT_NAME = {"Produce": "Produce", "Protein": "Protein", "Dairy": "Dairy", "Grains": "Grains",
              "Snacks and sweets": "Snacks", "Beverages": "Drinks", "Frozen and prepared": "Frozen",
              "Pantry staples": "Pantry"}

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
.pill-badge {{ display: inline-block; border: 1px solid {PINK}; color: {PINK}; border-radius: 12px;
               padding: 0.3rem 0.7rem; font-size: 0.85rem; font-weight: 700; margin-bottom: 0.6rem; }}
.nutri-row {{ display: flex; flex-wrap: wrap; gap: 0.6rem; margin-top: 0.4rem; }}
.nutri-tile {{ flex: 1 1 90px; background: #1B1B21; border: 1px solid #2A2A31; border-radius: 14px;
               padding: 0.7rem 0.5rem; text-align: center; }}
.nutri-value {{ font-size: 1.35rem; font-weight: 900; }}
.nutri-value span {{ font-size: 0.8rem; font-weight: 700; color: #FF7AC6; margin-left: 2px; }}
.stat-card {{ display: flex; gap: 1rem; align-items: center; background: #121216; border: 1px solid #2A2A31;
               border-radius: 18px; padding: 1.2rem 1.4rem; height: 100%; }}
.stat-icon {{ font-size: 1.8rem; width: 3.6rem; height: 3.6rem; border-radius: 50%; background: #1E1E25;
              display: flex; align-items: center; justify-content: center; flex-shrink: 0; }}
.stat-value {{ font-size: 2rem; font-weight: 900; line-height: 1.2; }}
.change-card {{ background: #121216; border: 1px solid #2A2A31; border-radius: 16px; padding: 1rem; height: 100%; }}
.change-pct {{ font-size: 1.6rem; font-weight: 900; }}
.fake-button {{ border: 1px solid #F4F4F6; border-radius: 14px; padding: 0.6rem; text-align: center;
                font-weight: 800; cursor: default; }}
</style>
""")


DISH_EMOJI = [
    ("soup", "🍲"), ("stew", "🍲"), ("chili", "🌶️"), ("curry", "🍛"), ("salad", "🥗"), ("bowl", "🥣"),
    ("stir", "🥘"), ("fried rice", "🍚"), ("pasta", "🍝"), ("spaghetti", "🍝"), ("noodle", "🍜"),
    ("taco", "🌮"), ("burrito", "🌯"), ("quesadilla", "🫓"), ("wrap", "🌯"), ("sandwich", "🥪"),
    ("toast", "🍞"), ("omelet", "🍳"), ("scramble", "🍳"), ("frittata", "🍳"), ("pancake", "🥞"),
    ("smoothie", "🥤"), ("pizza", "🍕"), ("burger", "🍔"), ("skillet", "🍳"), ("roast", "🍗"),
]
STAPLE_EMOJI = {"salt": "🧂", "pepper": "🧂", "black pepper": "🧂", "salt and pepper": "🧂", "salt & pepper": "🧂",
                "oil": "🫒", "olive oil": "🫒", "vegetable oil": "🫒", "cooking oil": "🫒", "water": "💧"}


def dish_emoji(title):
    lowered = (title or "").lower()
    for word, emoji in DISH_EMOJI:
        if word in lowered:
            return emoji
    return "🍲"


def ingredient_emoji(name):
    return STAPLE_EMOJI.get((name or "").strip().lower()) or food_emoji(name)


def bar_chart(data, x, y, colors=None, height=300, x_sort=None):
    """Rounded bar chart with $ labels on top, styled for the dark theme."""
    import altair as alt

    color = (alt.Color(f"{x}:N", scale=alt.Scale(domain=list(data[x]), range=colors), legend=None)
             if colors else alt.value(PINK))
    base = alt.Chart(data).encode(
        x=alt.X(f"{x}:N", sort=x_sort or list(data[x]), title=None,
                axis=alt.Axis(labelAngle=0, labelColor="#B9B9C2", labelFontSize=12, labelLimit=110, labelOverlap=False, ticks=False,
                              domainColor="#3A3A44")),
        y=alt.Y(f"{y}:Q", title=None,
                axis=alt.Axis(format="$,.0f", labelColor="#9A9AA5", gridColor="#24242B", domain=False, ticks=False,
                              tickCount=5)),
    )
    bars = base.mark_bar(cornerRadiusTopLeft=8, cornerRadiusTopRight=8, size=34).encode(color=color)
    labels = base.mark_text(dy=-9, color="#F4F4F6", fontWeight="bold", fontSize=12).encode(
        text=alt.Text(f"{y}:Q", format="$,.2f"))
    return (bars + labels).properties(height=height, background="transparent").configure_view(stroke=None)


def delta_html(pct, label, good_when_down=True):
    """Arrow + percent change, green when the change is good."""
    if pct is None:
        return f'<span class="muted">— {label}</span>'
    if abs(pct) < 0.5:
        return f'<span class="muted">— same {label.replace("vs. ", "as ")}</span>'
    down = pct < 0
    good = down if good_when_down else not down
    color = "#4ADE80" if good else "#FF6B8B"
    arrow = "↓" if down else "↑"
    return f'<span style="color:{color};font-weight:800">{arrow} {abs(pct):.0f}%</span> <span class="muted">{label}</span>'


def stat_card(icon, label, value, delta):
    return (f'<div class="stat-card"><div class="stat-icon">{icon}</div><div>'
            f'<div class="muted" style="font-size:1rem">{label}</div>'
            f'<div class="stat-value">{value}</div><div>{delta}</div></div></div>')
