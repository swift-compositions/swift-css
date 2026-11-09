import CSS
import Testing

enum `Margin Tests` {}

extension `Margin Tests` {
    @Suite
    struct `Rendering` {

        @Test
        func `equal left and right margins leave top and bottom untouched`() throws {
            let html = try String(
                HTML.Document {
                    tag("div").css.margin(right: .px(8), left: .px(8))
                }
            )
            #expect(html.contains("margin-right:8px"))
            #expect(html.contains("margin-left:8px"))
            #expect(!html.contains("margin:0px"))
        }
    }
}
