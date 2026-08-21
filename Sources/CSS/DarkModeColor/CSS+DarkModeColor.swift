public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering
public import W3C_CSS_Values

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func color(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {

        if darkModeColor.isSingleColor {
            self.color(W3C_CSS_Color.Color.color(darkModeColor.light))
        } else {
            self.color(W3C_CSS_Color.Color.color(darkModeColor.light))
                .dark(W3C_CSS_Color.Color.color(darkModeColor.dark))
        }
    }

    @discardableResult
    public func color(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        color(DarkModeColor(light: light, dark: dark))
    }

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func backgroundColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.backgroundColor(W3C_CSS_Backgrounds.BackgroundColor.color(darkModeColor.light))
        } else {
            self.backgroundColor(W3C_CSS_Backgrounds.BackgroundColor.color(darkModeColor.light))
                .dark {
                    $0.backgroundColor(
                        W3C_CSS_Backgrounds.BackgroundColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    @discardableResult
    public func backgroundColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> HTML.CSS<some HTML.View> {
        backgroundColor(DarkModeColor(light: light, dark: dark))
    }

    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func border(
        width: W3C_CSS_Backgrounds.BorderWidth,
        style: W3C_CSS_Values.LineStyle,
        color: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if color.isSingleColor {
            self.border(W3C_CSS_Backgrounds.Border(width: width, style: style, color: color.light))
        } else {
            self.border(W3C_CSS_Backgrounds.Border(width: width, style: style, color: color.light))
                .dark {
                    $0.border(
                        W3C_CSS_Backgrounds.Border(width: width, style: style, color: color.dark)
                    )
                }
        }
    }
}
