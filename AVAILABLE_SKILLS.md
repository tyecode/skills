# Full Catalog of Skills

This repository contains two main categories of skills: Engineering skills (for code processes) and Productivity skills (for domain-agnostic agent workflows).

## `engineering/` — Code Process Skills

Works on any codebase. Install these on every project:

| Skill | When to Invoke | What It Does |
|-------|---------------|--------------|
| **karpathy-guidelines** | When writing or reviewing code | Think before coding, simplicity first, surgical changes |
| **diagnose** | When debugging a hard bug | 6-phase diagnosis loop: reproduce → hypothesise → instrument → fix |
| **zoom-out** | When exploring unfamiliar code | Maps call chain and boundaries before making changes |
| **tdd** | When adding features or fixing bugs | Enforces failing test before any implementation |
| **git-workflow** | When committing or opening a PR | Conventional commits, branch rules, PR guidelines |
| **security** | Before marking any feature complete | Checklist: input validation, auth, rate limiting, secrets, PII |
| **incident-commander** | When debugging a live production outage | Prioritizes mitigation over root cause, generates postmortem |
| **resilience** | When building distributed systems | Enforces circuit breakers, fallbacks, and chaos hypotheses |
| **api-design** | When designing REST/GraphQL APIs | Enforces Stripe API pillars: consistency, idempotency, backwards compatibility |

## `productivity/` — Meta Skills

Domain-agnostic — useful for any knowledge work, not just coding:

| Skill | When to Invoke | What It Does |
|-------|---------------|--------------|
| **grill-me** | Before starting something new | Interviews you until requirements are fully resolved |
| **handoff** | When passing work to another agent | Compacts conversation into a handoff doc |
| **caveman** | When you want compressed responses | ~75% token reduction, no loss of technical accuracy |
| **working-backwards** | When proposing a new feature/product | Forces writing an Amazon PR/FAQ before coding |
| **write-a-skill** | When creating a new reusable skill | Teaches the agent the `skills.sh` file structure and constraints |
