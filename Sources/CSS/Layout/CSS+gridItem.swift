public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering

extension HTML.CSS {

    @inlinable
    @discardableResult
    public func gridItem(
        column: GridColumn? = nil,
        row: GridRow? = nil,
        columnStart: GridColumnStart? = nil,
        columnEnd: GridColumnEnd? = nil,
        rowStart: GridRowStart? = nil,
        rowEnd: GridRowEnd? = nil,
        justifySelf: JustifySelf? = nil,
        alignSelf: AlignSelf? = nil
    ) -> HTML.CSS<some HTML.View> {
        var result = HTML.AnyView(base)

        if let column {
            result = HTML.AnyView(result.inlineStyle(column))
        }
        if let row {
            result = HTML.AnyView(result.inlineStyle(row))
        }
        if let columnStart {
            result = HTML.AnyView(result.inlineStyle(columnStart))
        }
        if let columnEnd {
            result = HTML.AnyView(result.inlineStyle(columnEnd))
        }
        if let rowStart {
            result = HTML.AnyView(result.inlineStyle(rowStart))
        }
        if let rowEnd {
            result = HTML.AnyView(result.inlineStyle(rowEnd))
        }
        if let justifySelf {
            result = HTML.AnyView(result.inlineStyle(justifySelf))
        }
        if let alignSelf {
            result = HTML.AnyView(result.inlineStyle(alignSelf))
        }

        return HTML.CSS<HTML.AnyView>(base: result)
    }
}
