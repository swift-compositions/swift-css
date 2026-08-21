public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension Margin {
    public typealias Variant = Side
}

extension HTML.CSS {

    @discardableResult
    @inlinable
    @CSS_HTML_Rendering.CSS.Builder
    public func margin(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil
    ) -> HTML.CSS<some HTML.View> {

        if let top, let right, let bottom, let left {

            if top == right && right == bottom && bottom == left {
                base.inlineStyle(
                    Margin.all(top)
                )
            }

            else if top == bottom && right == left {
                base.inlineStyle(
                    Margin.verticalHorizontal(top, right)
                )
            }

            else {
                base.inlineStyle(
                    Margin.sides(
                        .lengthPercentage(top),
                        .lengthPercentage(right),
                        .lengthPercentage(bottom),
                        .lengthPercentage(left)
                    )
                )
            }
        }

        else if top == nil && bottom == nil, let right, let left, right == left {
            base.inlineStyle(
                Margin.verticalHorizontal(.px(0), right)
            )
        }

        else {
            base
                .inlineStyle(top.map { MarginTop.lengthPercentage($0) })
                .inlineStyle(right.map { MarginRight.lengthPercentage($0) })
                .inlineStyle(bottom.map { MarginBottom.lengthPercentage($0) })
                .inlineStyle(left.map { MarginLeft.lengthPercentage($0) })
        }
    }

    @discardableResult
    @inlinable
    @CSS_HTML_Rendering.CSS.Builder
    public func margin(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil
    ) -> HTML.CSS<some HTML.View> {

        if let vertical, let horizontal {
            base.inlineStyle(
                Margin.verticalHorizontal(vertical, horizontal)
            )
        } else if let vertical {

            base
                .inlineStyle(MarginTop.lengthPercentage(vertical))
                .inlineStyle(MarginBottom.lengthPercentage(vertical))
        } else if let horizontal {

            base
                .inlineStyle(MarginRight.lengthPercentage(horizontal))
                .inlineStyle(MarginLeft.lengthPercentage(horizontal))
        } else {
            base
        }
    }

    @discardableResult
    @inlinable
    @CSS_HTML_Rendering.CSS.Builder
    public func margin(
        top: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil
    ) -> HTML.CSS<some HTML.View> {

        if let top, let horizontal, let bottom {
            base.inlineStyle(
                Margin.topHorizontalBottom(
                    .lengthPercentage(top),
                    horizontal,
                    .lengthPercentage(bottom)
                )
            )
        } else {

            base
                .inlineStyle(top.map { MarginTop.lengthPercentage($0) })
                .inlineStyle(horizontal.map { MarginRight.lengthPercentage($0) })
                .inlineStyle(bottom.map { MarginBottom.lengthPercentage($0) })
                .inlineStyle(horizontal.map { MarginLeft.lengthPercentage($0) })
        }
    }
}
