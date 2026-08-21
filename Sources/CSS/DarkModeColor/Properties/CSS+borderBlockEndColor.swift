public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderBlockEndColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBlockEndColor(CSS_Standard.BorderBlockEndColor.color(darkModeColor.light))
        } else {
            self.borderBlockEndColor(CSS_Standard.BorderBlockEndColor.color(darkModeColor.light))
                .dark {
                    $0.borderBlockEndColor(
                        CSS_Standard.BorderBlockEndColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    @discardableResult
    public func borderBlockEndColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBlockEndColor(DarkModeColor(light: light, dark: dark))
    }
}
