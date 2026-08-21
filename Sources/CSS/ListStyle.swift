public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

public enum ListStyle: Sendable {
    case reset
    case cssPropertyTypesListStyle(CSS_Standard.ListStyle)
}

extension HTML.CSS {
    @discardableResult
    @inlinable
    public func listStyle(
        _ listStyle: ListStyle
    ) -> HTML.CSS<HTML.Styled<HTML.Styled<Base, CSS_Standard.ListStyle>, PaddingLeft>> {
        switch listStyle {
        case .reset:
            self
                .listStyle(CSS_Standard.ListStyle.none)
                .paddingLeft(.zero)

        case .cssPropertyTypesListStyle(let cssListStyle):
            self
                .listStyle(cssListStyle)
                .paddingLeft(nil)
        }
    }
}
