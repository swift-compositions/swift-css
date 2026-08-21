//
//  CSS+borderColor.swift
//  swift-css
//
//  CSS border-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderColor(CSS_Standard.BorderColor.color(darkModeColor.light))
        } else {
            self.borderColor(CSS_Standard.BorderColor.color(darkModeColor.light))
                .dark { $0.borderColor(CSS_Standard.BorderColor.color(darkModeColor.dark)) }
        }
    }

    /// Sets the border color using separate light and dark color values.
    @discardableResult
    public func borderColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderColor(DarkModeColor(light: light, dark: dark))
    }
}
