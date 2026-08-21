public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func fill(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.fill(CSS_Standard.Fill.color(darkModeColor.light))
        } else {
            self.fill(CSS_Standard.Fill.color(darkModeColor.light))
                .dark { $0.fill(CSS_Standard.Fill.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func fill(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        fill(DarkModeColor(light: light, dark: dark))
    }
}
