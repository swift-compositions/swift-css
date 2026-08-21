//
//  CSS+borderInlineColor.swift
//  swift-css
//
//  CSS border-inline-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border inline color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderInlineColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderInlineColor(CSS_Standard.BorderInlineColor.color(darkModeColor.light))
        } else {
            self.borderInlineColor(CSS_Standard.BorderInlineColor.color(darkModeColor.light))
                .dark {
                    $0.borderInlineColor(CSS_Standard.BorderInlineColor.color(darkModeColor.dark))
                }
        }
    }

    /// Sets the border inline color using separate light and dark color values.
    @discardableResult
    public func borderInlineColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderInlineColor(DarkModeColor(light: light, dark: dark))
    }
}
