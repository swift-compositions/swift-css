//
//  CSS+borderLeftColor.swift
//  swift-css
//
//  CSS border-left-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border left color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderLeftColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderLeftColor(CSS_Standard.BorderLeftColor.color(darkModeColor.light))
        } else {
            self.borderLeftColor(CSS_Standard.BorderLeftColor.color(darkModeColor.light))
                .dark { $0.borderLeftColor(CSS_Standard.BorderLeftColor.color(darkModeColor.dark)) }
        }
    }

    /// Sets the border left color using separate light and dark color values.
    @discardableResult
    public func borderLeftColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderLeftColor(DarkModeColor(light: light, dark: dark))
    }
}
