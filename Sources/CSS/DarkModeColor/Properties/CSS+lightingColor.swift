public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func lightingColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.lightingColor(CSS_Standard.LightingColor.color(darkModeColor.light))
        } else {
            self.lightingColor(CSS_Standard.LightingColor.color(darkModeColor.light))
                .dark { $0.lightingColor(CSS_Standard.LightingColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func lightingColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        lightingColor(DarkModeColor(light: light, dark: dark))
    }
}
