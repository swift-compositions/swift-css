//
//  CSS+borderInlineStartColor.swift
//  swift-css
//
//  CSS border-inline-start-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border inline start color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderInlineStartColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderInlineStartColor(
                CSS_Standard.BorderInlineStartColor.color(darkModeColor.light)
            )
        } else {
            self.borderInlineStartColor(
                CSS_Standard.BorderInlineStartColor.color(darkModeColor.light)
            )
            .dark {
                $0.borderInlineStartColor(
                    CSS_Standard.BorderInlineStartColor.color(darkModeColor.dark)
                )
            }
        }
    }

    /// Sets the border inline start color using separate light and dark color values.
    @discardableResult
    public func borderInlineStartColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderInlineStartColor(DarkModeColor(light: light, dark: dark))
    }
}
