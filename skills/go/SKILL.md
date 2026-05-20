---
name: go
description: Go best practices and conventions. Use when working with Go code.
---

# Skill: go

## When to Use This Skill

Use this skill when:
- Working with Go projects
- Writing Go code
- Setting up Go projects

## Naming Conventions

- Use PascalCase for types and interfaces
- Use snake_case for file names
- Use camelCase for variables and functions
- Use UPPER_SNAKE_CASE for constants

## Project Structure

```
myproject/
├── cmd/
│   └── myapp/
│       └── main.go
├── pkg/
│   └── utils/
├── internal/
├── go.mod
└── go.sum
```

## Best Practices

- Use `go fmt` for formatting
- Use `go vet` for static analysis
- Run `golangci-lint` for comprehensive linting
- Use interfaces for abstraction
- Return errors, not nil/empty values
- Handle errors explicitly

## Error Handling

```go
func readFile(path string) ([]byte, error) {
    data, err := os.ReadFile(path)
    if err != nil {
        return nil, fmt.Errorf("reading %s: %w", path, err)
    }
    return data, nil
}
```

## Testing

- Use `testing` package
- Table-driven tests are preferred
- Test files: `*_test.go`
- Run with `go test ./...`

## Common Patterns

**Context usage:**
```go
func doWork(ctx context.Context) error {
    // use ctx for cancellation
}
```

**Defer for cleanup:**
```go
func readFile(path string) {
    file, err := os.Open(path)
    if err != nil {
        return
    }
    defer file.Close()
}
```