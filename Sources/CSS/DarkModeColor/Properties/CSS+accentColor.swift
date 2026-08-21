public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func accentColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.accentColor(CSS_Standard.AccentColor.color(darkModeColor.light))
        } else {
            self.accentColor(CSS_Standard.AccentColor.color(darkModeColor.light))
                .dark { $0.accentColor(CSS_Standard.AccentColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func accentColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        accentColor(DarkModeColor(light: light, dark: dark))
    }
}
