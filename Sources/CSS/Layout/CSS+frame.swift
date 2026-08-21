public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @inlinable
    @discardableResult
    public func frame(
        width: CSS_Standard.Width? = nil,
        height: CSS_Standard.Height? = nil,
        minWidth: MinWidth? = nil,
        minHeight: MinHeight? = nil,
        maxWidth: MaxWidth? = nil,
        maxHeight: MaxHeight? = nil
    ) -> HTML.CSS<some HTML.View> {
        var result = HTML.AnyView(base)

        if let width {
            result = HTML.AnyView(result.inlineStyle(width))
        }
        if let height {
            result = HTML.AnyView(result.inlineStyle(height))
        }
        if let minWidth {
            result = HTML.AnyView(result.inlineStyle(minWidth))
        }
        if let minHeight {
            result = HTML.AnyView(result.inlineStyle(minHeight))
        }
        if let maxWidth {
            result = HTML.AnyView(result.inlineStyle(maxWidth))
        }
        if let maxHeight {
            result = HTML.AnyView(result.inlineStyle(maxHeight))
        }

        return HTML.CSS<HTML.AnyView>(base: result)
    }
}
