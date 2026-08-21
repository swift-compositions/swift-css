//
//  CSS+stroke.swift
//  swift-css
//
//  CSS stroke property (SVG) with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the SVG stroke color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func stroke(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.stroke(CSS_Standard.Stroke.color(darkModeColor.light))
        } else {
            self.stroke(CSS_Standard.Stroke.color(darkModeColor.light))
                .dark { $0.stroke(CSS_Standard.Stroke.color(darkModeColor.dark)) }
        }
    }

    /// Sets the SVG stroke color using separate light and dark color values.
    @discardableResult
    public func stroke(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        stroke(DarkModeColor(light: light, dark: dark))
    }
}
