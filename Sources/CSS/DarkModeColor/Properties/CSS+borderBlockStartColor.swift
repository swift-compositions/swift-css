public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderBlockStartColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBlockStartColor(
                CSS_Standard.BorderBlockStartColor.color(darkModeColor.light)
            )
        } else {
            self.borderBlockStartColor(
                CSS_Standard.BorderBlockStartColor.color(darkModeColor.light)
            )
            .dark {
                $0.borderBlockStartColor(
                    CSS_Standard.BorderBlockStartColor.color(darkModeColor.dark)
                )
            }
        }
    }

    @discardableResult
    public func borderBlockStartColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBlockStartColor(DarkModeColor(light: light, dark: dark))
    }
}
