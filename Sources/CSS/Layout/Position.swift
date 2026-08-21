//
//  Position.swift
//  swift-css
//
//  Convenience method for positioning properties.
//

public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Convenience method for positioning with offset values.
    ///
    /// ```swift
    /// div.css.position(
    ///     .absolute,
    ///     top: .px(0),
    ///     left: .px(0),
    ///     right: .px(0)
    /// )
    /// ```
    @discardableResult
    @inlinable
    public func position(
        _ value: W3C_CSS_Positioning.Position?,
        top: Top? = nil,
        right: Right? = nil,
        bottom: Bottom? = nil,
        left: Left? = nil
    )
        -> HTML.CSS<
            HTML.Styled<
                HTML.Styled<
                    HTML.Styled<
                        HTML.Styled<HTML.Styled<Base, W3C_CSS_Positioning.Position>, Top>, Left
                    >, Right
                >, Bottom
            >
        >
    {
        self
            .position(value)
            .top(top)
            .left(left)
            .right(right)
            .bottom(bottom)
    }
}
