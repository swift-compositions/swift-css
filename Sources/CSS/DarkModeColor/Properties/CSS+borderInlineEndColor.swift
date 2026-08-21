public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderInlineEndColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderInlineEndColor(CSS_Standard.BorderInlineEndColor.color(darkModeColor.light))
        } else {
            self.borderInlineEndColor(CSS_Standard.BorderInlineEndColor.color(darkModeColor.light))
                .dark {
                    $0.borderInlineEndColor(
                        CSS_Standard.BorderInlineEndColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    @discardableResult
    public func borderInlineEndColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderInlineEndColor(DarkModeColor(light: light, dark: dark))
    }
}
