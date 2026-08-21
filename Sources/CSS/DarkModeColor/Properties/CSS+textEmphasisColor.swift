//
//  CSS+textEmphasisColor.swift
//  swift-css
//
//  CSS text-emphasis-color property with dark mode support.
//

public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Sets the text emphasis color using a DarkModeColor value.
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func textEmphasisColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.textEmphasisColor(CSS_Standard.TextEmphasisColor.color(darkModeColor.light))
        } else {
            self.textEmphasisColor(CSS_Standard.TextEmphasisColor.color(darkModeColor.light))
                .dark {
                    $0.textEmphasisColor(CSS_Standard.TextEmphasisColor.color(darkModeColor.dark))
                }
        }
    }

    /// Sets the text emphasis color using separate light and dark color values.
    @discardableResult
    public func textEmphasisColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        textEmphasisColor(DarkModeColor(light: light, dark: dark))
    }
}
