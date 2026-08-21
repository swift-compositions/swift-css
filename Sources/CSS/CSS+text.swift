//
//  CSS+text.swift
//  swift-css
//
//  Convenience method for common text styling properties.
//

public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Convenience method for common text styling properties.
    ///
    /// ```swift
    /// p.css.text(
    ///     align: .center,
    ///     decoration: .underline,
    ///     transform: .uppercase
    /// )
    /// ```
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
