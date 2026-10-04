import pytest

import recipe

REPLY = """# Garlic Brown Rice Bowl

**Uses:** Brown rice, Black beans, Garlic, Lemon, olive oil

Time: 35

Steps:
1. Cook the rice.
2) Fry the garlic.
3. Add the beans.
"""


def test_parses_title_uses_time_steps():
    r = recipe.parse_recipe(REPLY)
    assert r["title"] == "Garlic Brown Rice Bowl"
    assert r["uses"] == ["Brown rice", "Black beans", "Garlic", "Lemon", "olive oil"]
    assert r["time"] == "35"
    assert r["steps"] == ["Cook the rice.", "Fry the garlic.", "Add the beans."]


def test_title_label_and_inline_first_step():
    r = recipe.parse_recipe("Title: Toast\nUses: Bread\nTime: 5 minutes\nSteps: 1. Toast the bread.")
    assert r["title"] == "Toast" and r["time"] == "5 minutes" and r["steps"] == ["Toast the bread."]


def test_caps_steps_at_eight():
    text = "Soup\nUses: Onion\nTime: 20\nSteps:\n" + "\n".join(f"{i}. step {i}" for i in range(1, 12))
    assert len(recipe.parse_recipe(text)["steps"]) == 8


@pytest.mark.parametrize("bad", ["", "Just a title", "Uses: eggs\nTime: 5"])
def test_rejects_replies_without_title_or_steps(bad):
    with pytest.raises(ValueError):
        recipe.parse_recipe(bad)


def test_check_uses_splits_pantry_staples_and_missing():
    owned, staples, missing = recipe.check_uses(
        ["Lemon", "Brown rice", "Salt and pepper", "Olive oil", "Water", "Saffron"],
        ["Lemons", "Brown rice", "Eggs"])
    assert owned == ["Lemon", "Brown rice"]
    assert staples == ["Salt and pepper", "Olive oil", "Water"]
    assert missing == ["Saffron"]


def test_fewer_than_three_items_does_not_call_the_model(monkeypatch):
    calls = []
    monkeypatch.setattr(recipe.ai, "complete", lambda *a, **k: calls.append(1))
    with pytest.raises(recipe.RecipeError, match="at least 3"):
        recipe.suggest(None, ["Eggs", "Eggs", "Milk"])  # duplicates count once
    assert calls == []


def test_suggest_sends_pantry_names_and_retries_once(monkeypatch):
    prompts, replies = [], iter(["garbled", REPLY])
    monkeypatch.setattr(recipe.ai, "complete", lambda conn, model, prompt, **k: prompts.append(prompt) or next(replies))
    r = recipe.suggest(None, ["Garlic", "Brown rice", "Black beans"])
    assert r["title"] == "Garlic Brown Rice Bowl" and len(prompts) == 2
    assert "Black beans, Brown rice, Garlic" in prompts[0]


def test_parses_servings_and_nutrition_estimates():
    text = """Tofu Bowl
Uses: Tofu, Rice
Time: 30
Servings: 2
Calories: ~520 kcal
- Protein: 24g
**Carbs:** 61 g
Fat: 18.5 g
Fiber: 7g
Sugar: 5 g
Sodium: 640 mg
Steps:
1. Cook."""
    r = recipe.parse_recipe(text)
    assert r["servings"] == 2
    assert r["nutrition"] == {"Calories": (520.0, "kcal"), "Protein": (24.0, "g"), "Carbs": (61.0, "g"),
                              "Fat": (18.5, "g"), "Fiber": (7.0, "g"), "Sugar": (5.0, "g"), "Sodium": (640.0, "mg")}
    assert r["steps"] == ["Cook."]


def test_nutrition_is_optional():
    r = recipe.parse_recipe(REPLY)
    assert r["nutrition"] == {} and r["servings"] is None


def test_earlier_titles_are_sent_to_avoid_repeats(monkeypatch):
    prompts = []
    monkeypatch.setattr(recipe.ai, "complete", lambda conn, model, prompt, **k: prompts.append(prompt) or REPLY)
    recipe.suggest(None, ["Garlic", "Brown rice", "Black beans"], avoid_titles=["Tofu Bowl", "Bean Soup"])
    assert "different from these earlier ideas: Tofu Bowl; Bean Soup" in prompts[0]
    recipe.suggest(None, ["Garlic", "Brown rice", "Black beans"])
    assert "earlier ideas" not in prompts[1]
