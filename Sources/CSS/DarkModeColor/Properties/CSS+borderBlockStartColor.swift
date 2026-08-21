//
//  CSS+borderBlockStartColor.swift
//  swift-css
//
//  CSS border-block-start-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border block start color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderBlockStartColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBlockStartColor(
                CSS_Standard.BorderBlockStartColor.color(darkModeColor.light)
            )
        } else {
            self.borderBlockStartColor(
                CSS_Standard.BorderBlockStartColor.color(darkModeColor.light)
            )
            .dark {
                $0.borderBlockStartColor(
                    CSS_Standard.BorderBlockStartColor.color(darkModeColor.dark)
                )
            }
        }
    }

    /// Sets the border block start color using separate light and dark color values.
    @discardableResult
    public func borderBlockStartColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBlockStartColor(DarkModeColor(light: light, dark: dark))
    }
}
