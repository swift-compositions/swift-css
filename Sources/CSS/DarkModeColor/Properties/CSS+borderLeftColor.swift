public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderLeftColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderLeftColor(CSS_Standard.BorderLeftColor.color(darkModeColor.light))
        } else {
            self.borderLeftColor(CSS_Standard.BorderLeftColor.color(darkModeColor.light))
                .dark { $0.borderLeftColor(CSS_Standard.BorderLeftColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func borderLeftColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderLeftColor(DarkModeColor(light: light, dark: dark))
    }
}
