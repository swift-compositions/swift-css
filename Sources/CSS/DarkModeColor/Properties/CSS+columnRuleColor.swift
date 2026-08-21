public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func columnRuleColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.columnRuleColor(CSS_Standard.ColumnRuleColor.color(darkModeColor.light))
        } else {
            self.columnRuleColor(CSS_Standard.ColumnRuleColor.color(darkModeColor.light))
                .dark { $0.columnRuleColor(CSS_Standard.ColumnRuleColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func columnRuleColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        columnRuleColor(DarkModeColor(light: light, dark: dark))
    }
}
