# Copilot Instructions

These instructions describe the coding conventions for this repository. Follow them whenever generating, editing, or reviewing code. They are derived from the project's `.editorconfig` and apply to any .NET-based codebase.

## General formatting

- Use **UTF-8** encoding for all source files.
- Use **CRLF** line endings, except for shell scripts (`*.sh`) which use **LF**.
- Always **insert a final newline** and **trim trailing whitespace**.
- Default indentation is **4 spaces** (no tabs), with these exceptions:
  - **Tabs** for Visual Studio solution files (`*.sln`).
  - **2 spaces** for project files (`*.csproj`, `*.vbproj`, `*.vcxproj`, `*.proj`, `*.projitems`, `*.shproj`, `*.slnx`, `*.vcxproj.filters`).
  - **2 spaces** for XML configuration files (`*.xml`, `*.config`, `*.props`, `*.targets`, `*.nuspec`, `*.resx`, `*.ruleset`, `*.vsixmanifest`, `*.vsct`).
  - **2 spaces** for `*.json`, `*.json5`, `*.yml`, `*.yaml`.
  - **2 spaces** for web assets (`*.html`, `*.htm`, `*.js`, `*.ts`, `*.tsx`, `*.css`, `*.sass`, `*.scss`, `*.less`, `*.svg`, `*.vue`).
  - **4 spaces** for F# files (`*.fs`, `*.fsx`, `*.fsi`).

## C# language style

### Namespaces and usings

- Use **file-scoped namespace declarations** (`namespace Foo;`). This is enforced as a warning.
- Place **`using` directives outside the namespace**. Enforced as a warning.
- **Sort `System.*` using directives first**, then other namespaces.
- Prefer **simple `using` statements** (`using var x = ...;`) over block form when practical.

### Types and variables

- Prefer **`var`** when the type is apparent on the right-hand side, or in scenarios where it improves readability ("var elsewhere").
- Use **explicit types for built-in types** (`int`, `string`, `bool`, etc.) rather than `var`.
- Use **predefined type aliases** (`int`, `string`) instead of framework names (`Int32`, `String`) for both declarations and member access.
- Prefer **implicit object creation** when the target type is apparent (`Foo x = new();`).
- Prefer **`readonly struct`** when a struct is immutable.

### Members and expressions

- Prefer **expression-bodied members** for methods, properties, indexers, operators, accessors, and lambdas.
- Do **not** use expression-bodied members for constructors or local functions; use block bodies for those.
- Prefer **auto-properties** over manually backed properties when no extra logic is needed.
- Prefer **pattern matching** over `is` with cast checks and over `as` with null checks.
- Prefer **`switch` expressions** over `switch` statements when reasonable.
- Prefer **`not` patterns** and **extended property patterns**.
- Prefer **null-coalescing** (`??`, `??=`) and **null-propagation** (`?.`) over explicit null checks.
- Prefer **`is null`** over `ReferenceEquals(x, null)`.
- Prefer **null-check pattern** (`x is null`) over type checks for null comparisons.
- Prefer **simplified boolean expressions**.
- Prefer **simplified string interpolation** over `string.Format` or concatenation.
- Prefer **compound assignment** (`+=`, `-=`, etc.) when applicable.
- Prefer **inlined variable declarations** in `out` parameters.
- Prefer **throw expressions** over throw statements when concise.
- Prefer the **`?.Invoke(...)`** form for conditional delegate invocation.
- Prefer **collection expressions** (`[...]`) **only when types match exactly**.
- Prefer **object and collection initializers** over imperative population.
- Prefer **deconstructed variable declarations** when working with tuples.
- Prefer **explicit tuple names** and **inferred tuple/anonymous member names** where appropriate.
- Prefer **tuple swap** (`(a, b) = (b, a)`) over a temporary variable.
- Prefer **index** (`^`) and **range** (`..`) operators where applicable.
- Prefer **UTF-8 string literals** (`"..."u8`) when working with byte-level UTF-8 data.
- Prefer **unbound generic types in `nameof`** (`nameof(List<>)`).
- Prefer **`System.Threading.Lock`** over the `lock` statement on `object` when targeting .NET 9+.
- Prefer **`default`** (without an explicit type) when the type is apparent.
- Prefer **local functions over anonymous methods**, and prefer **static local functions** when no captures are needed.
- Prefer **implicitly-typed lambda expressions** when the parameter type is clear.
- Prefer **method group conversions** when assigning a method to a delegate.
- Use **`_`** (discard) for unused values and unused expression-statement results.
- **Top-level statements** are allowed but optional.
- **Primary constructors are not preferred** for classes/structs; use traditional constructors.

### Indentation and braces

- Indent block contents and case contents; indent switch labels.
- Do **not** indent braces themselves.
- Place labels **one level less** than the surrounding code.
- **Always use braces** for control-flow blocks (silent suggestion, but follow it).
- Preserve single-line blocks and single-line statements when the author wrote them that way.

### New lines

- Place opening braces on a **new line** (Allman style) for all constructs.
- Place `else`, `catch`, and `finally` on a **new line**.
- Place members of anonymous types and object initializers on **new lines**.
- Place query expression clauses on **new lines**.

### Spacing

- Space **after** keywords in control-flow statements (`if (`, `for (`, `while (`).
- Space **after** a cast (`(int) value`).
- Space **around** binary operators (`a + b`).
- Space **after** commas and **after** semicolons in `for` statements; no space before them.
- Space **before and after** the colon in inheritance clauses (`class Foo : IBar`).
- **No space** between method name and opening parenthesis, or inside parameter list parentheses.
- **No space** before `[`, between `[]`, or inside `[]`.
- **No space** around `.`.
- When wrapping, place operators at the **beginning of the next line**.

## .NET naming conventions

| Symbol | Style |
|---|---|
| `const` fields | **PascalCase** |
| `static readonly` fields | **PascalCase** |
| Public, internal, or protected `readonly` fields | **PascalCase** (non-private readonly) |
| Public or internal fields | **PascalCase** |
| Private `readonly` fields | **camelCase** |
| Private or protected fields | **camelCase** |
| Public/internal/protected methods, properties, events, delegates | **PascalCase** (first word upper) |
| Parameters | **camelCase** |
| Classes, structs, enums, delegates | **PascalCase** |
| Interfaces | **PascalCase prefixed with `I`** (e.g. `IService`) |

All naming rules above are enforced at **warning** severity.

## Code complexity and maintainability

These are guidance thresholds, not hard failures. When generating, editing, or reviewing code, **call out explicitly when code exceeds a threshold** and suggest a refactor (extract method, introduce a parameter object/record, split the type).

| Metric | Recommended | Hard limit | Notes |
|---|---|---|---|
| Function arguments | ≤ 4 | 6 | Beyond ~4, prefer a parameter object or `record`. Excludes dependency-injection and primary constructors. |
| Function length | ≤ 30 lines | 60 | Keep methods single-purpose; extract helpers when longer. |
| File length | ≤ 400 lines | 750 | One type per file; split helpers or use `partial` when larger. |
| Cyclomatic complexity | ≤ 10 | 15 | Aligns with analyzer defaults; simplify branching or extract methods. |

These thresholds are already enforced by the global `.editorconfig` via the following analyzers: `CA1501` (inheritance depth), `CA1502` (cyclomatic complexity), `CA1505` (maintainability index), `CA1506` (class coupling). Respect them proactively so generated code does not trigger these analyzers; the table above is the source of truth for the expected limits.

## Diagnostics

- `IDE0052` (remove unread private member) is disabled.
- `RCS1090` (call `ConfigureAwait`) is disabled.

Do not reintroduce these diagnostics in new code unless explicitly requested.

## Generation guidance

- When adding new files, match the indentation, line ending, and final-newline rules for that file's extension.
- When adding C# code, default to **file-scoped namespaces**, **`var` where appropriate**, **expression-bodied members**, and **pattern matching**, in line with the rules above.
- When adding new project, configuration, JSON, YAML, or web files, use **2-space indentation**.
- Do not introduce style choices that conflict with `.editorconfig`. If `.editorconfig` is updated, prefer it over these instructions.
