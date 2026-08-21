//
//  CSS+borderBottomColor.swift
//  swift-css
//
//  CSS border-bottom-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the border bottom color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderBottomColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBottomColor(CSS_Standard.BorderBottomColor.color(darkModeColor.light))
        } else {
            self.borderBottomColor(CSS_Standard.BorderBottomColor.color(darkModeColor.light))
                .dark {
                    $0.borderBottomColor(CSS_Standard.BorderBottomColor.color(darkModeColor.dark))
                }
        }
    }

    /// Sets the border bottom color using separate light and dark color values.
    @discardableResult
    public func borderBottomColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBottomColor(DarkModeColor(light: light, dark: dark))
    }
}
