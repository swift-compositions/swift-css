public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func caretColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.caretColor(CSS_Standard.CaretColor.color(darkModeColor.light))
        } else {
            self.caretColor(CSS_Standard.CaretColor.color(darkModeColor.light))
                .dark { $0.caretColor(CSS_Standard.CaretColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func caretColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        caretColor(DarkModeColor(light: light, dark: dark))
    }
}
