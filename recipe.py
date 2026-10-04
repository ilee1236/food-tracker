"""Recipe suggestion from pantry items."""

import re

import ai
from prompts import RECIPE_AVOID, RECIPE_MODEL, RECIPE_PROMPT

MIN_ITEMS = 3
STAPLES = ("salt", "pepper", "oil", "water")

# Nutrition label -> (display name, unit). Values are the model's per-serving estimates.
NUTRIENTS = {
    "calories": ("Calories", "kcal"), "protein": ("Protein", "g"), "carbs": ("Carbs", "g"),
    "carbohydrates": ("Carbs", "g"), "fat": ("Fat", "g"), "fiber": ("Fiber", "g"),
    "sugar": ("Sugar", "g"), "sodium": ("Sodium", "mg"),
}


class RecipeError(Exception):
    """A user-facing problem with the recipe; the message is safe to show."""


def _clean(line):
    return re.sub(r"^[#>\-\s]+", "", line.replace("**", "").replace("__", "")).strip()


def parse_recipe(text):
    """Turn the model's Title / Uses / Time / Steps reply into a dict, or raise ValueError."""
    title, uses, time, servings, steps, in_steps = None, [], None, None, [], False
    nutrition = {}
    for raw in text.splitlines():
        line = _clean(raw)
        if not line:
            continue
        label, _, rest = line.partition(":")
        key = label.strip().lower()
        if key in NUTRIENTS and rest.strip():
            number = re.search(r"\d+(?:\.\d+)?", rest)
            if number:
                nutrition[NUTRIENTS[key][0]] = (float(number.group()), NUTRIENTS[key][1])
        elif key == "servings" and rest.strip():
            number = re.search(r"\d+", rest)
            servings = int(number.group()) if number else None
        elif key == "title" and rest.strip():
            title = rest.strip()
        elif key in ("uses", "ingredients") and not in_steps:
            uses = [u.strip(" .") for u in rest.split(",") if u.strip(" .")]
        elif key == "time" and not in_steps:
            time = rest.strip()
        elif key == "steps":
            in_steps = True
            if rest.strip():
                steps.append(re.sub(r"^\d+[.)]\s*", "", rest.strip()))
        elif in_steps or re.match(r"^\d+[.)]\s", line):
            in_steps = True
            steps.append(re.sub(r"^\d+[.)]\s*", "", line))
        elif title is None:
            title = line
    if not title or not steps:
        raise ValueError("reply is missing a title or steps")
    return {"title": title, "uses": uses, "time": time, "servings": servings,
            "nutrition": nutrition, "steps": steps[:8]}


def is_staple(name):
    words = re.findall(r"[a-z]+", name.lower())
    return bool(words) and all(w in STAPLES or w in ("and", "black", "olive", "vegetable", "cooking", "sea") for w in words)


def check_uses(uses, pantry_names):
    """Split the recipe's ingredients into (from pantry, staples, not in pantry)."""
    pantry = [p.lower() for p in pantry_names]
    owned, staples, missing = [], [], []
    for use in uses:
        u = use.lower()
        if any(u in p or p in u for p in pantry):
            owned.append(use)
        elif is_staple(use):
            staples.append(use)
        else:
            missing.append(use)
    return owned, staples, missing


def suggest(conn, pantry_names, avoid_titles=()):
    names = sorted(set(pantry_names))
    if len(names) < MIN_ITEMS:
        raise RecipeError(f"You need at least {MIN_ITEMS} items in your pantry for a recipe. Scan a receipt to add more.")
    avoid = RECIPE_AVOID.format(titles="; ".join(avoid_titles)) if avoid_titles else ""
    prompt = RECIPE_PROMPT.format(items=", ".join(names), avoid=avoid)
    for attempt in range(2):
        reply = ai.complete(conn, RECIPE_MODEL, prompt, temperature=0.9)
        try:
            return parse_recipe(reply)
        except ValueError:
            if attempt == 1:
                raise RecipeError("The recipe came back garbled. Please try again.")
