//
//  CSS+borderInlineEndColor.swift
//  swift-css
//
//  CSS border-inline-end-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border inline end color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderInlineEndColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderInlineEndColor(CSS_Standard.BorderInlineEndColor.color(darkModeColor.light))
        } else {
            self.borderInlineEndColor(CSS_Standard.BorderInlineEndColor.color(darkModeColor.light))
                .dark {
                    $0.borderInlineEndColor(
                        CSS_Standard.BorderInlineEndColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    /// Sets the border inline end color using separate light and dark color values.
    @discardableResult
    public func borderInlineEndColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderInlineEndColor(DarkModeColor(light: light, dark: dark))
    }
}
