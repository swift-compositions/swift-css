public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @inlinable
    @discardableResult
    public func gridContainer(
        columns: GridTemplateColumns? = nil,
        rows: GridTemplateRows? = nil,
        gap: Gap? = nil,
        rowGap: RowGap? = nil,
        columnGap: ColumnGap? = nil,
        justifyItems: JustifyItems? = nil,
        alignItems: AlignItems? = nil
    ) -> HTML.CSS<some HTML.View> {
        var result = HTML.AnyView(base.inlineStyle(Display.grid))

        if let columns {
            result = HTML.AnyView(result.inlineStyle(columns))
        }
        if let rows {
            result = HTML.AnyView(result.inlineStyle(rows))
        }
        if let gap {
            result = HTML.AnyView(result.inlineStyle(gap))
        }
        if let rowGap {
            result = HTML.AnyView(result.inlineStyle(rowGap))
        }
        if let columnGap {
            result = HTML.AnyView(result.inlineStyle(columnGap))
        }
        if let justifyItems {
            result = HTML.AnyView(result.inlineStyle(justifyItems))
        }
        if let alignItems {
            result = HTML.AnyView(result.inlineStyle(alignItems))
        }

        return HTML.CSS<HTML.AnyView>(base: result)
    }
}
