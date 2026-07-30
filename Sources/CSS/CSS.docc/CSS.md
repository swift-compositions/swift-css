# ``CSS``

@Metadata {
    @DisplayName("CSS")
    @TitleHeading("Swift Foundations")
}

Typed CSS for Swift HTML rendering: grouped inline-style methods —
`.css.frame(...)`, `.css.spacing(...)`, `.css.text(...)`,
`.css.flexContainer(...)`, `.css.gridContainer(...)` — that set related CSS
properties in one call against `swift-html-render`'s builder syntax, plus
``DarkModeColor``, a normalized light/dark color pair that auto-derives its
dark variant from a single value and eliminates the light-only-vs-explicit-
pair duplicate representation.

## When to use this

Reach for `CSS` when a view built with `swift-html` needs typed, composable
inline styling instead of hand-written style strings or loose color pairs —
the grouped property methods and ``DarkModeColor``'s normalized
representation catch mismatched or duplicate values at compile time. Reach
for the sibling `CSS Theming` product instead when styling needs named,
swappable palettes rendered as a stylesheet of CSS custom properties (a
`@media (prefers-color-scheme: dark)` block included), rather than one-off
inline values.

## Topics

### Related packages

- [swift-css-standard](https://github.com/swift-standards/swift-css-standard) —
  the CSS value and property vocabulary this package builds on.
- [swift-html-render](https://github.com/swift-foundations/swift-html-render) —
  the HTML builder these inline-style methods attach to.
