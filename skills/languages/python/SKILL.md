---
name: python
description: Python best practices and conventions. Use when working with Python code.
---

# Skill: python

## When to Use This Skill

Use this skill when:
- Working with Python projects
- Writing Python code
- Setting up Python projects

## PEP 8 Guidelines

- Use 4 spaces for indentation
- Maximum line length: 88 characters (Black default)
- Use snake_case for functions/variables
- Use PascalCase for classes
- Use CAPS for constants

## Type Hints

```python
def greet(name: str) -> str:
    return f"Hello, {name}"

def process_items(items: list[int]) -> dict[str, int]:
    return {"count": len(items)}
```

## Best Practices

- Use virtual environments (`venv` or `conda`)
- Use `pyproject.toml` or `setup.py` for package management
- Add type hints for better IDE support
- Use `ruff` or `black` for formatting
- Use `mypy` for type checking

## Common Patterns

**List comprehension:**
```python
squares = [x**2 for x in range(10)]
```

**Dict comprehension:**
```python
word_lengths = {word: len(word) for word in words}
```

**Context manager:**
```python
with open("file.txt") as f:
    content = f.read()
```

## Testing

- Use `pytest` for testing
- Place tests in `tests/` directory
- Use descriptive test names