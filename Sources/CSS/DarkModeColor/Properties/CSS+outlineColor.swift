//
//  CSS+outlineColor.swift
//  swift-css
//
//  CSS outline-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the outline color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func outlineColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.outlineColor(CSS_Standard.OutlineColor.color(darkModeColor.light))
        } else {
            self.outlineColor(CSS_Standard.OutlineColor.color(darkModeColor.light))
                .dark { $0.outlineColor(CSS_Standard.OutlineColor.color(darkModeColor.dark)) }
        }
    }

    /// Sets the outline color using separate light and dark color values.
    @discardableResult
    public func outlineColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        outlineColor(DarkModeColor(light: light, dark: dark))
    }
}
