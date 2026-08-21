public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func stroke(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.stroke(CSS_Standard.Stroke.color(darkModeColor.light))
        } else {
            self.stroke(CSS_Standard.Stroke.color(darkModeColor.light))
                .dark { $0.stroke(CSS_Standard.Stroke.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func stroke(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        stroke(DarkModeColor(light: light, dark: dark))
    }
}
