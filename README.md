# Tyecode's Agent Skills

Personal skills for AI coding agents. Based on Karpathy-style guidelines.

## Quickstart (Recommended)

Install base skills for any project:

```bash
# Install all base skills (works on ANY project)
npx skills add tyecode/skills@karpathy-guidelines
npx skills add tyecode/skills@grill-me
npx skills add tyecode/skills@handoff
npx skills add tyecode/skills@diagnose
npx skills add tyecode/skills@zoom-out
npx skills add tyecode/skills@caveman
```

Or install all globally (includes project-specific skills):
```bash
npx skills add tyecode/skills -g -y
```

---

## Base Skills (Core - Works on ANY Project)

These 6 skills work regardless of language/framework. **Always install these:**

| Skill | Command | Purpose |
|-------|---------|---------|
| **karpathy-guidelines** | `@karpathy-guidelines` | Core coding behavior: think before coding, simplicity, surgical changes |
| **grill-me** | `@grill-me` | Clarify requirements by interviewing the user |
| **handoff** | `@handoff` | Transfer work to another agent |
| **diagnose** | `@diagnose` | Debug hard bugs: reproduce → hypothesise → instrument → fix |
| **zoom-out** | `@zoom-out` | Get context when exploring unfamiliar code |
| **caveman** | `@caveman` | Ultra-compressed mode (~75% less tokens) |

---

## Project-Specific Skills (Optional)

Install based on your tech stack:

### Frameworks
| Skill | Command | When to Use |
|-------|---------|-------------|
| **react** | `@react` | React or Next.js projects |

### Languages
| Skill | Command | When to Use |
|-------|---------|-------------|
| **typescript** | `@typescript` | TypeScript projects |

### Tools
| Skill | Command | When to Use |
|-------|---------|-------------|
| **git-workflow** | `@git-workflow` | Commit conventions, branch naming, code review |
| **tdd** | `@tdd` | Writing tests |
| **deployment** | `@deployment` | Deploying applications |
| **setup-pre-commit** | `@setup-pre-commit` | Node.js projects (Husky + lint-staged) |

---

## Also Supports

- **CLAUDE.md** - Copy to your project for Claude Code
- **Cursor** - Copy `.cursor/rules/karpathy-guidelines.mdc` to your project