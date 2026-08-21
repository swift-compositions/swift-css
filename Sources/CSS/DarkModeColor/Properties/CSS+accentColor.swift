//
//  CSS+accentColor.swift
//  swift-css
//
//  CSS accent-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the accent color using a DarkModeColor value.
    ///
    /// This method applies the light color by default and adds a dark mode
    /// media query for the dark color variant.
    ///
    /// ```swift
    /// input.css.accentColor(DarkModeColor(light: .blue, dark: .cyan))
    /// ```
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func accentColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.accentColor(CSS_Standard.AccentColor.color(darkModeColor.light))
        } else {
            self.accentColor(CSS_Standard.AccentColor.color(darkModeColor.light))
                .dark { $0.accentColor(CSS_Standard.AccentColor.color(darkModeColor.dark)) }
        }
    }

    /// Sets the accent color using separate light and dark color values.
    ///
    /// ```swift
    /// input.css.accentColor(light: .blue, dark: .cyan)
    /// ```
    @discardableResult
    public func accentColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        accentColor(DarkModeColor(light: light, dark: dark))
    }
}
