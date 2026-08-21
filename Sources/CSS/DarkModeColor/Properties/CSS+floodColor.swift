public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func floodColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.floodColor(CSS_Standard.FloodColor.color(darkModeColor.light))
        } else {
            self.floodColor(CSS_Standard.FloodColor.color(darkModeColor.light))
                .dark { $0.floodColor(CSS_Standard.FloodColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func floodColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        floodColor(DarkModeColor(light: light, dark: dark))
    }
}
