public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func stopColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.stopColor(CSS_Standard.StopColor.color(darkModeColor.light))
        } else {
            self.stopColor(CSS_Standard.StopColor.color(darkModeColor.light))
                .dark { $0.stopColor(CSS_Standard.StopColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func stopColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        stopColor(DarkModeColor(light: light, dark: dark))
    }
}
