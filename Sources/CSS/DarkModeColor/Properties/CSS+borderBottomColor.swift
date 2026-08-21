public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

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

    @discardableResult
    public func borderBottomColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBottomColor(DarkModeColor(light: light, dark: dark))
    }
}
