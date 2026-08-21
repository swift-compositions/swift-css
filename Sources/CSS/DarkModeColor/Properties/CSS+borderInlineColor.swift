public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func borderInlineColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderInlineColor(CSS_Standard.BorderInlineColor.color(darkModeColor.light))
        } else {
            self.borderInlineColor(CSS_Standard.BorderInlineColor.color(darkModeColor.light))
                .dark {
                    $0.borderInlineColor(CSS_Standard.BorderInlineColor.color(darkModeColor.dark))
                }
        }
    }

    @discardableResult
    public func borderInlineColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderInlineColor(DarkModeColor(light: light, dark: dark))
    }
}
