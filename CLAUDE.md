# Tyecode's Coding Guidelines

Follow these principles for better code quality.

---

## Core Principles

### 1. Think Before Coding

- Don't assume. Don't hide confusion.
- State assumptions explicitly. If uncertain, ask.
- If something is unclear, stop and ask.
- Present multiple interpretations if ambiguity exists.

### 2. Simplicity First

- Minimum code that solves the problem.
- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" that wasn't requested.
- If 200 lines could be 50, rewrite it.

### 3. Surgical Changes

- Touch only what you must.
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- Remove imports YOUR changes made unused.

### 4. Goal-Driven Execution

- Define success criteria
- "Add validation" → "Write tests, then make them pass"
- "Fix the bug" → "Write test that reproduces it, then fix"
- For multi-step tasks: state a plan with verification steps

---

## Code Style

### TypeScript / JavaScript

- Use strict mode always
- Prefer `const` over `let`, avoid `var`
- Use meaningful variable names
- Use interfaces for object shapes, types for unions
- Avoid `any`, use `unknown` instead

### React

- Use functional components with hooks
- Keep components small and focused
- Use composition over inheritance
- Extract reusable logic into custom hooks

### Git

- Use conventional commits: `feat:`, `fix:`, `docs:`
- Write descriptive commit messages
- Branch naming: `feature/description` or `fix/description`
- Rebase over merge for cleaner history

---

## Error Handling

- Handle errors explicitly, don't silently catch
- Return errors, don't throw unless truly exceptional
- Use proper error types
- Log errors with context

---

## Testing

- Write tests before fixing bugs
- Test behavior, not implementation
- Keep tests fast and isolated
- Use descriptive test names

---

## Communication

- Be concise but complete
- Ask questions when unclear
- Surface tradeoffs when decisions matter
- Use caveman mode when asked (drop filler, keep substance)

---

## When to Use Skills

Use these skills as needed:

- `/grill-me` - When starting something new
- `/diagnose` - When debugging hard bugs
- `/zoom-out` - When exploring unfamiliar code
- `/tdd` - When writing tests
- `/handoff` - When passing work to another agent
- `/caveman` - When user wants ultra-compressed responses