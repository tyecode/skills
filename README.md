# Tyecode's Agent Skills

Personal skills for AI coding agents. Based on Karpathy-style guidelines.

## Quickstart

```bash
npx skills add tyecode/skills -g -y
```

## Skills Structure

### Base (Works on any project)
- **karpathy-guidelines** - Core coding behavior: think before coding, simplicity, surgical changes
- **grill-me** - Clarify requirements by interviewing the user
- **handoff** - Create handoff documents for another agent
- **diagnose** - Debugging loop for hard bugs: reproduce → hypothesise → instrument → fix
- **zoom-out** - Get broader context when exploring unfamiliar code
- **caveman** - Ultra-compressed communication mode (~75% less tokens)

### Frameworks
- **react** - React and Next.js best practices

### Languages
- **typescript** - TypeScript conventions and best practices

### Tools
- **tdd** - Test-driven development guidelines
- **deployment** - Deployment workflow guidelines
- **setup-pre-commit** - Set up Husky + lint-staged + Prettier hooks

## Installation

### All Skills (Global)
```bash
npx skills add tyecode/skills -g -y
```

### Per Project - Choose What You Need

**Base (works on any project):**
```bash
npx skills add tyecode/skills@karpathy-guidelines
npx skills add tyecode/skills@grill-me
npx skills add tyecode/skills@handoff
npx skills add tyecode/skills@diagnose
npx skills add tyecode/skills@zoom-out
npx skills add tyecode/skills@caveman
```

**Framework-specific:**
```bash
npx skills add tyecode/skills@react
```

**Language-specific:**
```bash
npx skills add tyecode/skills@typescript
```

**Tools:**
```bash
npx skills add tyecode/skills@tdd
npx skills add tyecode/skills@deployment
npx skills add tyecode/skills@setup-pre-commit
```

## Also Supports

- **CLAUDE.md** - Copy to your project for Claude Code
- **Cursor** - Copy `.cursor/rules/karpathy-guidelines.mdc` to your project