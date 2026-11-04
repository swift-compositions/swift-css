# swift-css

Use this package when you style HTML views in Swift with typed CSS and want colors that switch with dark mode, grouped layout helpers, and a color and font theme you can swap. Start from `DarkModeColor` for a light and dark color pair. For named palettes and font defaults, start from `DarkModeColor.Theme` and `Font.Defaults` in the `CSS Theming` product. If you only need the typed `.css` property methods on HTML views, use swift-css-html-render. If you only need CSS values without rendering, use swift-css-standard.

## Laws

- `DarkModeColor.init(light:dark:)` without a dark value uses the light value darkened by 20%. `DarkModeColor.init(_:)` uses one value for both.
- A `DarkModeColor` whose light and dark values are equal renders as one declaration. Otherwise the light value is the declaration and the dark value is added under `@media (prefers-color-scheme: dark)`. For `HTML.CSS.border(_:)`, that dark rule is combined with any media query already in effect.
- `DarkModeColor.flatMap(_:)` takes the light value from the transform of the light value and the dark value from the transform of the dark value.
- `DarkModeColor.darker(by:)` and `DarkModeColor.lighter(by:)` default to 20%, as do the same methods on `CSS_Standard.Color.Value`. Darker scales each RGB channel toward 0, lighter moves it toward 255 by that fraction, and HSL colors change lightness the same way. Hex and named colors come back as `rgb()`. A fraction outside -1 to 1 leaves the color unchanged.
- `DarkModeColor.opacity(_:)` clamps alpha to 0 through 1. Hex and named colors become `rgba()`, HSL becomes `hsla()`.
- Only the 16 basic CSS named colors, such as red, navy and teal, can be lightened, darkened or made translucent. Any other named color, and any other color form, is returned unchanged.
- `DarkModeColor.Theme.current` is the theme set by the innermost `withDependencies(_:operation:)` from `CSS Theming`, else the one set by `prepareDependencies(_:)`, else `DarkModeColor.Theme.default`. `Font.Defaults.current` works the same way. Both functions start from the current theme and fonts, so you change only what you set. They are this package's own and don't read or change swift-dependencies values.
- Scoped themes and fonts are task-local. Prepared ones are process-wide, and a reader never sees half of one prepared value and half of another.
- Theme colors such as `DarkModeColor.red` and fonts such as `Font.body` read the current theme on every access. Fixed shades such as `DarkModeColor.red500` don't depend on the theme.
- A theme role left out falls back to a related one. Button hover falls back to the button color, muted error, success and warning to their full colors, info to the highlighted color (the link color for text), border hover to highlighted, and neutral to secondary.
- `DarkModeColor.Theme.stylesheet` puts each light value in a `:root` variable and the dark value in the same variable under `@media (prefers-color-scheme: dark)`. Each base color also gets a translucent variant at 20% opacity.
- `DarkModeColor.Theme.StyleSheet.write(to:name:)` creates the directory if needed and writes to the directory string followed directly by the name and `.css`, so the directory must end with a slash.
- `HTML.CSS.margin(top:right:bottom:left:)` and `HTML.CSS.padding(top:right:bottom:left:)` write one shorthand when all four sides are given, using the shortest form. Otherwise each given side is written on its own. A margin with only left and right, and both equal, is written as a shorthand with 0px top and bottom, which overrides any vertical margin set elsewhere.
- `HTML.CSS.listStyle(_:)` with reset removes list markers and sets left padding to 0.
