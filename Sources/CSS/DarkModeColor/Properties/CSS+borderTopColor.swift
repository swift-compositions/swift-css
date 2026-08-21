public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderTopColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderTopColor(CSS_Standard.BorderTopColor.color(darkModeColor.light))
        } else {
            self.borderTopColor(CSS_Standard.BorderTopColor.color(darkModeColor.light))
                .dark { $0.borderTopColor(CSS_Standard.BorderTopColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func borderTopColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderTopColor(DarkModeColor(light: light, dark: dark))
    }
}
