//
//  CSS+positioned.swift
//  swift-css
//
//  Convenience methods for positioning properties.
//

public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Convenience method for positioning properties.
    ///
    /// ```swift
    /// div.css.positioned(
    ///     .absolute,
    ///     top: .px(0),
    ///     left: .px(0),
    ///     right: .px(0)
    /// )
    /// ```
    @inlinable
    @discardableResult
    public func positioned(
        _ position: W3C_CSS_Positioning.Position,
        top: Top? = nil,
        right: Right? = nil,
        bottom: Bottom? = nil,
        left: Left? = nil,
        zIndex: ZIndex? = nil
    ) -> HTML.CSS<some HTML.View> {
        var result = HTML.AnyView(base.inlineStyle(position))

        if let top {
            result = HTML.AnyView(result.inlineStyle(top))
        }
        if let right {
            result = HTML.AnyView(result.inlineStyle(right))
        }
        if let bottom {
            result = HTML.AnyView(result.inlineStyle(bottom))
        }
        if let left {
            result = HTML.AnyView(result.inlineStyle(left))
        }
        if let zIndex {
            result = HTML.AnyView(result.inlineStyle(zIndex))
        }

        return HTML.CSS<HTML.AnyView>(base: result)
    }

    /// Convenience for absolutely positioned element that fills its container.
    ///
    /// ```swift
    /// div.css.absoluteFill()
    /// // Equivalent to: position(.absolute), top(0), right(0), bottom(0), left(0)
    /// ```
    @inlinable
    @discardableResult
    public func absoluteFill() -> HTML.CSS<some HTML.View> {
        self.positioned(
            .absolute,
            top: .px(0),
            right: .px(0),
            bottom: .px(0),
            left: .px(0)
        )
    }
}
