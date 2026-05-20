---
name: python
description: Python best practices and conventions. Use when working with Python code.
---

# Skill: python

## When to Use This Skill

Use this skill when:
- Writing or reviewing Python code
- Setting up a Python project
- Designing data structures or error handling

## Non-Negotiables

- Always add type hints to function signatures. Code without type hints is harder to read, harder to refactor, and harder to catch bugs in.
- Always use a virtual environment. Never install packages globally.
- Use `pyproject.toml` for project config. Not `setup.py`, not `requirements.txt` alone.

## Type Hints

```python
def process(items: list[str]) -> dict[str, int]:
    return {item: len(item) for item in items}
```

For complex types, use `TypedDict` for dicts and `dataclass` for objects:

```python
from dataclasses import dataclass

@dataclass
class User:
    id: int
    email: str
    active: bool = True
```

Use `dataclass` when you own the data shape. Use `TypedDict` for external/JSON data you're describing.

## Error Handling

Raise specific exceptions, never generic `Exception`:

```python
class UserNotFoundError(Exception):
    pass

def get_user(user_id: int) -> User:
    user = db.find(user_id)
    if user is None:
        raise UserNotFoundError(f"User {user_id} not found")
    return user
```

Never use bare `except:` — it catches `KeyboardInterrupt` and `SystemExit`. Always use `except SomeSpecificError:`.

## Tooling

| Tool | Purpose |
|------|---------|
| `ruff` | Linting + formatting (replaces flake8 + black) |
| `mypy` | Static type checking |
| `pytest` | Testing |
| `uv` | Fast package + venv management (prefer over pip) |

## Testing

Use pytest. Place tests in `tests/`. Use fixtures for shared setup. Name tests as sentences: `test_returns_none_when_user_not_found`.
