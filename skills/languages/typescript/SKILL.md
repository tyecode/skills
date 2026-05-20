---
name: typescript
description: TypeScript conventions and best practices. Use when writing TypeScript code.
---

# Skill: typescript

## When to Use This Skill

Use this skill when:
- Writing or reviewing TypeScript code
- Fixing type errors
- Designing types for a new feature

## Non-Negotiables

- `strict: true` in tsconfig — always. Add `noUncheckedIndexedAccess` and `noImplicitReturns` too.
- Never use `any`. Use `unknown` at system boundaries (user input, API responses, JSON.parse), then narrow it.
- Never cast with `as` inside business logic. If you need `as`, the types are wrong — fix the types.

## Type Narrowing Over Casting

```typescript
// Bad — hiding a problem
const user = data as User;

// Good — proving the shape
function isUser(x: unknown): x is User {
  return typeof x === 'object' && x !== null && 'id' in x;
}
```

## Discriminated Unions for Variants

When a type can be one of several shapes, use a discriminant:

```typescript
type Result<T> =
  | { status: 'ok'; data: T }
  | { status: 'error'; error: string };
```

This lets TypeScript enforce exhaustive handling in switch/if chains.

## Interface vs Type

- `interface` for object shapes that might be extended or implemented by a class
- `type` for unions, intersections, mapped types, and aliases

When in doubt, `type` — it's more flexible.

## Naming

- No `I` prefix on interfaces (`User` not `IUser`)
- No `T` prefix on generics unless it aids clarity in complex signatures
- Types and interfaces: PascalCase
- Functions and variables: camelCase
