import CSS
import Testing

enum `Color.Value Tests` {}

extension `Color.Value Tests` {
    @Suite
    struct `Manipulation Of Forms Without Known Channels` {

        @Test
        func `opacity of a lab color becomes a mix with transparent`() {
            let color = CSS_Standard::Color.Value.lab(50, 20, 30)
            #expect(color.opacity(0.25) == .mix(.rectangular(.srgb), color, .transparent, 75))
        }

        @Test
        func `lighter of a lab color becomes a mix with white`() {
            let color = CSS_Standard::Color.Value.lab(50, 20, 30)
            #expect(color.lighter(by: 0.25) == .mix(.rectangular(.srgb), color, .named(.white), 25))
        }

        @Test
        func `darker of a lab color becomes a mix with black`() {
            let color = CSS_Standard::Color.Value.lab(50, 20, 30)
            #expect(color.darker(by: 0.5) == .mix(.rectangular(.srgb), color, .named(.black), 50))
        }
    }

    @Suite
    struct `Out Of Range Fractions` {

        @Test
        func `a brightness fraction above one clamps to white`() {
            #expect(CSS_Standard::Color.Value.rgb(100, 100, 100).lighter(by: 2) == .rgb(255, 255, 255))
        }

        @Test
        func `a brightness fraction below minus one clamps to black`() {
            #expect(CSS_Standard::Color.Value.rgb(100, 100, 100).darker(by: 2) == .rgb(0, 0, 0))
        }
    }
}
