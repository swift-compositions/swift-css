public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

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
