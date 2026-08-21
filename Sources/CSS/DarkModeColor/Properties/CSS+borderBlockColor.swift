//
//  CSS+borderBlockColor.swift
//  swift-css
//
//  CSS border-block-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border block color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderBlockColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBlockColor(CSS_Standard.BorderBlockColor.color(darkModeColor.light))
        } else {
            self.borderBlockColor(CSS_Standard.BorderBlockColor.color(darkModeColor.light))
                .dark {
                    $0.borderBlockColor(CSS_Standard.BorderBlockColor.color(darkModeColor.dark))
                }
        }
    }

    /// Sets the border block color using separate light and dark color values.
    @discardableResult
    public func borderBlockColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBlockColor(DarkModeColor(light: light, dark: dark))
    }
}
