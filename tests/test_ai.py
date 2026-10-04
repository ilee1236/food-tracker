import pytest
import snowflake.connector

import ai


class FakeCursor:
    def __init__(self, result=None, error=None):
        self.result, self.error, self.calls = result, error, []

    def execute(self, sql, params, timeout=None):
        self.calls.append((sql, params, timeout))
        if self.error:
            raise self.error
        return self

    def fetchone(self):
        return (self.result,)


class FakeConn:
    def __init__(self, cursor):
        self._cursor = cursor

    def cursor(self):
        return self._cursor


def test_unwrap_json_string_literal():
    assert ai.unwrap(r'"```json\n{\"a\": 1}\n```"') == '```json\n{"a": 1}\n```'


def test_unwrap_leaves_plain_text_alone():
    assert ai.unwrap("hello") == "hello"
    assert ai.unwrap(None) == ""


def test_complete_with_image_uses_stage_file():
    cur = FakeCursor('"hi"')
    assert ai.complete(FakeConn(cur), "claude-haiku-4-5", "read", stage_file="r.jpg") == "hi"
    sql, params, timeout = cur.calls[0]
    assert "TO_FILE('@RECEIPT_IMAGES', %s)" in sql
    assert params == ("claude-haiku-4-5", "read", "r.jpg")
    assert timeout == ai.TIMEOUT_SECONDS


def test_complete_text_only():
    cur = FakeCursor('"ok"')
    assert ai.complete(FakeConn(cur), "m", "p") == "ok"
    assert "TO_FILE" not in cur.calls[0][0]


def test_timeout_becomes_friendly_error():
    err = snowflake.connector.errors.ProgrammingError(msg="cancelled", errno=604)
    with pytest.raises(ai.AIError, match="too long"):
        ai.complete(FakeConn(FakeCursor(error=err)), "m", "p")


def test_other_snowflake_error_becomes_friendly_error():
    err = snowflake.connector.errors.ProgrammingError(msg="boom", errno=1234)
    with pytest.raises(ai.AIError):
        ai.complete(FakeConn(FakeCursor(error=err)), "m", "p")


def test_temperature_is_passed_as_model_parameter():
    cur = FakeCursor('"ok"')
    ai.complete(FakeConn(cur), "m", "p", stage_file="r.jpg", temperature=0)
    assert "TO_FILE('@RECEIPT_IMAGES', %s), {'temperature': 0.0})" in cur.calls[0][0]
