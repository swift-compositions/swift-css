public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension Padding {
    public typealias Variant = Side
}

extension HTML.CSS {

    @discardableResult
    @inlinable
    @CSS_HTML_Rendering.CSS.Builder
    public func padding(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil
    ) -> HTML.CSS<some HTML.View> {

        if let top, let right, let bottom, let left {

            if top == right && right == bottom && bottom == left {
                base.inlineStyle(
                    Padding.all(top)
                )
            }

            else if top == bottom && right == left {
                base.inlineStyle(
                    Padding.verticalHorizontal(top, right)
                )
            }

            else {
                base.inlineStyle(
                    Padding.sides(top, right, bottom, left)
                )
            }
        }

        else {
            base
                .inlineStyle(top.map { PaddingTop.lengthPercentage($0) })
                .inlineStyle(right.map { PaddingRight.lengthPercentage($0) })
                .inlineStyle(bottom.map { PaddingBottom.lengthPercentage($0) })
                .inlineStyle(left.map { PaddingLeft.lengthPercentage($0) })
        }
    }

    @discardableResult
    @inlinable
    @CSS_HTML_Rendering.CSS.Builder
    public func padding(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil
    ) -> HTML.CSS<some HTML.View> {

        if let vertical, let horizontal {
            base.inlineStyle(
                Padding.verticalHorizontal(vertical, horizontal)
            )
        } else if let vertical {

            base
                .inlineStyle(PaddingTop.lengthPercentage(vertical))
                .inlineStyle(PaddingBottom.lengthPercentage(vertical))
        } else if let horizontal {

            base
                .inlineStyle(PaddingRight.lengthPercentage(horizontal))
                .inlineStyle(PaddingLeft.lengthPercentage(horizontal))
        } else {
            base
        }
    }

    @discardableResult
    @inlinable
    @CSS_HTML_Rendering.CSS.Builder
    public func padding(
        top: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil
    ) -> HTML.CSS<some HTML.View> {

        if let top, let horizontal, let bottom {
            base.inlineStyle(
                Padding.topHorizontalBottom(top, horizontal, bottom)
            )
        } else {

            base
                .inlineStyle(top.map { PaddingTop.lengthPercentage($0) })
                .inlineStyle(horizontal.map { PaddingRight.lengthPercentage($0) })
                .inlineStyle(bottom.map { PaddingBottom.lengthPercentage($0) })
                .inlineStyle(horizontal.map { PaddingLeft.lengthPercentage($0) })
        }
    }
}
