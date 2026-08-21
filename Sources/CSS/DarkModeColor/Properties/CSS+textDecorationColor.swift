//
//  CSS+textDecorationColor.swift
//  swift-css
//
//  CSS text-decoration-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the text decoration color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func textDecorationColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.textDecorationColor(CSS_Standard.TextDecorationColor.color(darkModeColor.light))
        } else {
            self.textDecorationColor(CSS_Standard.TextDecorationColor.color(darkModeColor.light))
                .dark {
                    $0.textDecorationColor(
                        CSS_Standard.TextDecorationColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    /// Sets the text decoration color using separate light and dark color values.
    @discardableResult
    public func textDecorationColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        textDecorationColor(DarkModeColor(light: light, dark: dark))
    }
}
