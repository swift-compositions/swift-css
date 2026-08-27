# swift-css

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Typed CSS for Swift HTML rendering — inline style methods, dark-mode color pairs, and named themes that emit light and dark CSS custom properties.

---

## Key Features

- **Grouped property methods** — `.css.frame(...)`, `.css.spacing(...)`, `.css.text(...)`, and `.css.flexContainer(...)` set related CSS properties in a single call and render as HTML inline styles.
- **Dark-mode colors** — `DarkModeColor` stores light and dark values as one normalized pair, auto-deriving the dark variant when only a light color is supplied.
- **Named themes** — `DarkModeColor.Theme` ships palettes mirroring familiar systems (`.github`, `.apple`, `.vapor`, `.slate`, and more), each exposing semantic `text`, `background`, `border`, and `branding` color roles.
- **Stylesheet generation** — `theme.stylesheet` emits CSS custom properties for every role, paired with a `@media (prefers-color-scheme: dark)` override block and matching utility classes.
- **Scoped theming** — `prepareDependencies` sets process-wide theme and font defaults; `withDependencies` overrides them for a single synchronous or asynchronous operation.

---

## Quick Start

A single named theme value expands into a complete stylesheet — every semantic color as a CSS custom property, plus a `@media (prefers-color-scheme: dark)` block carrying the dark variants:

```swift
import CSS_Theming

let stylesheet = DarkModeColor.Theme.github.stylesheet

print(stylesheet)
// /* Generated Theme Stylesheet */
// :root {
//     --color-blue: ...;
//     --text-primary: ...;
// }
// @media (prefers-color-scheme: dark) {
//     :root { --color-blue: ...; }
// }
```

`DarkModeColor.Theme.StyleSheet` conforms to `CustomStringConvertible`, so it interpolates into any output directly.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-compositions/swift-css.git", branch: "main")
]
```

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "CSS", package: "swift-css")
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26.

---

## Architecture

Three library products. `CSS Theming` and `CSS Test Support` re-export `CSS`.

| Product | Import | When to import |
|---------|--------|----------------|
| `CSS` | `import CSS` | Inline CSS property methods and the dark-mode color types. |
| `CSS Theming` | `import CSS_Theming` | Named themes, stylesheet generation, and scoped theming defaults; re-exports `CSS`. |
| `CSS Test Support` | `import CSS_Test_Support` | Test targets that snapshot rendered CSS; re-exports both library targets. |

---

## Community

<!-- BEGIN: discussion -->
*Discussion thread will be created at first public release.*
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE](LICENSE.md).
