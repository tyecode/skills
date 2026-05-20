---
name: go
description: Go best practices and conventions. Use when working with Go code.
---

# Skill: go

## When to Use This Skill

Use this skill when:
- Writing or reviewing Go code
- Designing interfaces or error handling
- Structuring a Go project

## Non-Negotiables

- Always wrap errors with context using `%w`. Never return bare errors — the caller needs to know where it came from.
- Never ignore errors with `_`. If you're discarding an error, add a comment explaining why.
- Always pass `context.Context` as the first argument to functions that do I/O. This enables cancellation and timeouts.

## Error Handling

```go
// Bad — caller has no context
return nil, err

// Good — wrapped with where it happened
return nil, fmt.Errorf("fetching user %d: %w", id, err)
```

Check errors at every step. Don't batch them. Don't pyramid them with nested ifs — return early.

## Interfaces

- Accept interfaces, return structs. Functions should take the smallest interface they need.
- Define interfaces at the point of use (consumer package), not at the point of implementation.
- Keep interfaces small. A one-method interface is ideal.

```go
// Good — defined where it's used, minimal surface
type UserStore interface {
    GetUser(ctx context.Context, id int) (*User, error)
}
```

## Goroutines

Never start a goroutine without a way to stop it. Every goroutine must:
1. Accept a `context.Context` and stop when it's cancelled
2. Or have a done channel
3. Or have a clearly bounded lifetime

Goroutine leaks are silent and accumulate. When in doubt, don't goroutine.

## Testing

Use table-driven tests for any function with multiple input cases:

```go
tests := []struct {
    name  string
    input int
    want  int
}{
    {"positive", 5, 25},
    {"zero", 0, 0},
    {"negative", -3, 9},
}
for _, tt := range tests {
    t.Run(tt.name, func(t *testing.T) {
        got := square(tt.input)
        if got != tt.want {
            t.Errorf("got %d, want %d", got, tt.want)
        }
    })
}
```
