public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func textEmphasisColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.textEmphasisColor(CSS_Standard.TextEmphasisColor.color(darkModeColor.light))
        } else {
            self.textEmphasisColor(CSS_Standard.TextEmphasisColor.color(darkModeColor.light))
                .dark {
                    $0.textEmphasisColor(CSS_Standard.TextEmphasisColor.color(darkModeColor.dark))
                }
        }
    }

    @discardableResult
    public func textEmphasisColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        textEmphasisColor(DarkModeColor(light: light, dark: dark))
    }
}
