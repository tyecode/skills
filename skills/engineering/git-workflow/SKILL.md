---
name: git-workflow
description: Enforces Git workflow guidelines including commit conventions, branch naming, and code review. Use when working with Git branches, writing commits, or merging code.
---

# Skill: git-workflow

## When to Use This Skill

Use this skill when:

- Writing a commit message
- Creating a branch
- Preparing a PR

## Commits

**Format:** `<type>(<scope>): <description>`

- Description is lowercase, present tense, no period
- Scope is optional but useful for large repos
- Keep it under 72 characters

**Types:**

- `feat` — new capability the user can see
- `fix` — bug fix
- `refactor` — restructure without behavior change
- `test` — adding or fixing tests
- `docs` — documentation only
- `chore` — tooling, deps, config

**Rules:**

- **CRITICAL: Granular Multi-Commits.** Do NOT use `git add .` to bulk-commit an entire workspace if multiple distinct tasks were accomplished. You MUST group changed files logically (e.g., `git add src/components` → commit, `git add src/utils` → commit).
- One logical change per commit. If you find yourself writing "and" in the message, split the commit into two separate commits.
- Never commit directly to `main` or `master`.
- Never commit with `--no-verify` unless you have an explicit reason and the user approves.

## Branches

`<type>/<short-description>` — kebab-case, no ticket numbers unless the project uses them.

```
feat/user-auth
fix/null-pointer-login
refactor/extract-payment-service
```

## Pull Requests

- Title follows the same format as a commit message
- Keep PRs focused — one concern per PR
- If a PR is getting large, split it before opening
- Add a short description of _why_, not _what_ — the diff shows what

## Before Merging

- All CI checks pass
- At least one review (if team project)
- No unresolved comments
- Branch is up to date with base
