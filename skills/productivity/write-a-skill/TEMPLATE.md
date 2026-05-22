# SKILL.md Template

Use this template as the starting point for every new skill.

```md
---
name: skill-name
description: [Third-person active verb] what this skill does. Use when [specific keywords, user phrases, or scenarios].
---

# Skill: skill-name

## When to Use This Skill

Use this skill when:
- [Specific scenario 1]
- [Specific scenario 2]

## [Core Section]

[Main instructions, rules, or process]

## [Optional: Advanced / Reference]

See [REFERENCE.md](REFERENCE.md) for [detail].
```

## Description Rules

The description is **the only thing your agent sees** when deciding which skill to load.

**Format:**
- Max 1024 chars
- Third-person active verb first sentence: *"Enforces..."*, *"Runs..."*, *"Interviews..."*
- Second sentence: `"Use when [specific triggers]"`

**Good:**
```
Enforces Netflix Chaos Engineering principles for distributed systems. Use when building distributed systems or writing code that relies on external dependencies.
```

**Bad:**
```
Netflix Chaos Engineering principles.
```

The bad example is a noun phrase — your agent cannot tell what the skill *does* or when to trigger it.

## Review Checklist

After drafting, verify:

- [ ] Description starts with third-person active verb
- [ ] Description includes `"Use when..."` triggers
- [ ] SKILL.md under 100 lines
- [ ] No time-sensitive info
- [ ] Consistent terminology
- [ ] Concrete examples included
- [ ] References one level deep
