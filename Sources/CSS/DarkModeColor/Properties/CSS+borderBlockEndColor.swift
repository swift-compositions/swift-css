//
//  CSS+borderBlockEndColor.swift
//  swift-css
//
//  CSS border-block-end-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border block end color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderBlockEndColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBlockEndColor(CSS_Standard.BorderBlockEndColor.color(darkModeColor.light))
        } else {
            self.borderBlockEndColor(CSS_Standard.BorderBlockEndColor.color(darkModeColor.light))
                .dark {
                    $0.borderBlockEndColor(
                        CSS_Standard.BorderBlockEndColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    /// Sets the border block end color using separate light and dark color values.
    @discardableResult
    public func borderBlockEndColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBlockEndColor(DarkModeColor(light: light, dark: dark))
    }
}
