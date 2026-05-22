---
name: write-a-skill
description: Creates new agent skills with proper structure, progressive disclosure, and bundled resources. Use when user wants to create, write, or build a new skill.
---

# Skill: write-a-skill

## When to Use This Skill

Use this skill when:
- User wants to create a new reusable skill
- User says "write a skill", "build a skill", or "create a skill"

## Process

1. **Gather requirements** - ask user about:
   - What task/domain does the skill cover?
   - What specific use cases should it handle?
   - Does it need executable scripts or just instructions?
   - Any reference materials to include?

2. **Draft the skill** - create:
   - `SKILL.md` with concise instructions (under 100 lines)
   - Additional reference files if content is large or has distinct domains
   - Utility scripts if deterministic operations are needed

3. **Review with user** - present draft and ask:
   - Does this cover your use cases?
   - Anything missing or unclear?
   - Should any section be more/less detailed?

## Skill Structure

```
skill-name/
├── SKILL.md           # Main instructions (required)
├── TEMPLATE.md        # Reusable templates (if needed)
├── REFERENCE.md       # Detailed docs (if needed)
└── scripts/           # Utility scripts (if needed)
    └── helper.js
```

See [TEMPLATE.md](TEMPLATE.md) for the standard `SKILL.md` template, description rules, and review checklist.

## When to Add Scripts

Add utility scripts when:
- Operation is deterministic (validation, formatting)
- Same code would be generated repeatedly
- Errors need explicit handling

Scripts save tokens and improve reliability vs generated code.

## When to Split Files

Split into separate files when:
- `SKILL.md` exceeds 100 lines
- Content has distinct domains (e.g., finance vs. sales schemas)
- Advanced features are rarely needed
