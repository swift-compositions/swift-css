//
//  CSS+borderRightColor.swift
//  swift-css
//
//  CSS border-right-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border right color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderRightColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderRightColor(CSS_Standard.BorderRightColor.color(darkModeColor.light))
        } else {
            self.borderRightColor(CSS_Standard.BorderRightColor.color(darkModeColor.light))
                .dark {
                    $0.borderRightColor(CSS_Standard.BorderRightColor.color(darkModeColor.dark))
                }
        }
    }

    /// Sets the border right color using separate light and dark color values.
    @discardableResult
    public func borderRightColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderRightColor(DarkModeColor(light: light, dark: dark))
    }
}
