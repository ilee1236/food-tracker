"""The single place the app talks to the model: Snowflake Cortex AI_COMPLETE."""

import json

import snowflake.connector

TIMEOUT_SECONDS = 20


class AIError(Exception):
    """A model call failed; the message is safe to show to the user."""


def complete(conn, model, prompt, stage_file=None, temperature=None):
    """Run AI_COMPLETE, optionally on one image in the RECEIPT_IMAGES stage, and return the reply text."""
    options = "" if temperature is None else f", {{'temperature': {float(temperature)}}}"
    if stage_file is None:
        sql, params = f"SELECT AI_COMPLETE(%s, %s{options})", (model, prompt)
    else:
        sql = f"SELECT AI_COMPLETE(%s, %s, TO_FILE('@RECEIPT_IMAGES', %s){options})"
        params = (model, prompt, stage_file)

    try:
        row = conn.cursor().execute(sql, params, timeout=TIMEOUT_SECONDS).fetchone()
    except snowflake.connector.errors.ProgrammingError as e:
        if e.errno == 604:  # statement cancelled by the timeout
            raise AIError("The AI took too long to answer. Please try again.")
        raise AIError("The AI could not process this request. Please try again.")
    except snowflake.connector.errors.Error:
        raise AIError("Could not reach Snowflake. Check the internet connection.")

    return unwrap(row[0] if row else "")


def unwrap(value):
    """AI_COMPLETE returns its text as a JSON string literal; turn it back into plain text."""
    if isinstance(value, str) and value.startswith('"'):
        try:
            return json.loads(value)
        except ValueError:
            pass
    return value or ""
