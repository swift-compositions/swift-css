public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @inlinable
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func text(
        align: TextAlign? = nil,
        decoration: TextDecoration? = nil,
        transform: TextTransform? = nil,
        overflow: TextOverflow? = nil
    ) -> HTML.CSS<some HTML.View> {
        base
            .inlineStyle(align)
            .inlineStyle(decoration)
            .inlineStyle(transform)
            .inlineStyle(overflow)
    }
}
