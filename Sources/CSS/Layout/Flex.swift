//
//  Flex.swift
//  swift-css
//
//  Flexbox convenience methods for CSS.
//

public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    /// Convenience method for flexbox container properties.
    ///
    /// Sets `display: flex` and configures flex container properties.
    ///
    /// ```swift
    /// div.css.flexContainer(
    ///     direction: .row,
    ///     wrap: .wrap,
    ///     justification: .spaceBetween,
    ///     itemAlignment: .center
    /// )
    /// ```
    @discardableResult
    @inlinable
    public func flexContainer(
        direction: FlexDirection? = nil,
        wrap: FlexWrap? = nil,
        justification: JustifyContent? = nil,
        itemAlignment: AlignItems? = nil,
        rowGap: RowGap? = nil,
        columnGap: ColumnGap? = nil
    )
        -> HTML.CSS<
            HTML.Styled<
                HTML.Styled<
                    HTML.Styled<
                        HTML.Styled<
                            HTML.Styled<
                                HTML.Styled<HTML.Styled<Base, Display>, FlexDirection>, FlexWrap
                            >, JustifyContent
                        >, AlignItems
                    >, RowGap
                >, ColumnGap
            >
        >
    {
        self
            .display(.flex)
            .flexDirection(direction)
            .flexWrap(wrap)
            .justifyContent(justification)
            .alignItems(itemAlignment)
            .rowGap(rowGap)
            .columnGap(columnGap)
    }

    /// Convenience method for flex item properties.
    ///
    /// ```swift
    /// div.css.flexItem(
    ///     grow: .number(1),
    ///     shrink: .number(0),
    ///     basis: .auto
    /// )
    /// ```
    @discardableResult
    @inlinable
    public func flexItem(
        grow: FlexGrow? = nil,
        shrink: FlexShrink? = nil,
        basis: FlexBasis? = nil
    ) -> HTML.CSS<HTML.Styled<HTML.Styled<HTML.Styled<Base, FlexGrow>, FlexShrink>, FlexBasis>> {
        self
            .flexGrow(grow)
            .flexShrink(shrink)
            .flexBasis(basis)
    }
}
