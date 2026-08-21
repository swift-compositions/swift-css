//
//  CSS+floodColor.swift
//  swift-css
//
//  CSS flood-color property (SVG) with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the SVG flood color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func floodColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.floodColor(CSS_Standard.FloodColor.color(darkModeColor.light))
        } else {
            self.floodColor(CSS_Standard.FloodColor.color(darkModeColor.light))
                .dark { $0.floodColor(CSS_Standard.FloodColor.color(darkModeColor.dark)) }
        }
    }

    /// Sets the SVG flood color using separate light and dark color values.
    @discardableResult
    public func floodColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        floodColor(DarkModeColor(light: light, dark: dark))
    }
}
