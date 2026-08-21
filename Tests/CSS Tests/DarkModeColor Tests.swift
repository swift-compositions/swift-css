import CSS
import CSS_Theming
import Testing

@Suite
struct `DarkModeColor Tests` {

    @Test
    func `Color initializes with standard color using diagonal embedding`() {
        let color = DarkModeColor(.hex("FF0000"))
        #expect(color.light.description == "#FF0000")
        #expect(color.dark.description == "#FF0000")
        #expect(color.isSingleColor == true)
    }

    @Test
    func `Color initializes with explicit light and dark colors`() {
        let color = DarkModeColor(
            light: .hex("FF0000"),
            dark: .hex("00FF00")
        )
        #expect(color.light.description == "#FF0000")
        #expect(color.dark.description == "#00FF00")
        #expect(color.isSingleColor == false)
    }

    @Test
    func `Color auto-darkens when dark is omitted`() {
        let color = DarkModeColor(light: .hex("FF0000"))
        #expect(color.dark != color.light)
        #expect(color.isSingleColor == false)
    }

    @Test
    func `isSingleColor is true when light equals dark`() {
        let color = DarkModeColor(light: .hex("FF0000"), dark: .hex("FF0000"))
        #expect(color.isSingleColor == true)
    }

    @Test
    func `Single color description shows just the color`() {
        let color = DarkModeColor(.hex("FF0000"))
        #expect(color.description == "#FF0000")
    }

    @Test
    func `Color description includes media queries for different light and dark`() {
        let color = DarkModeColor(
            light: .hex("FF0000"),
            dark: .hex("00FF00")
        )
        let description = color.description
        #expect(description.contains("@media (prefers-color-scheme: light)"))
        #expect(description.contains("#FF0000"))
        #expect(description.contains("@media (prefers-color-scheme: dark)"))
        #expect(description.contains("#00FF00"))
    }

    @Test
    func `map transforms both light and dark colors`() {
        let color = DarkModeColor(
            light: .hex("FF0000"),
            dark: .hex("00FF00")
        )
        let transformed = color.map { _ in .hex("0000FF") }
        #expect(transformed.light.description == "#0000FF")
        #expect(transformed.dark.description == "#0000FF")
    }

    @Test
    func `map preserves isSingleColor when both transform to same value`() {
        let color = DarkModeColor(
            light: .hex("FF0000"),
            dark: .hex("00FF00")
        )
        let transformed = color.map { _ in .hex("0000FF") }
        #expect(transformed.isSingleColor == true)
    }

    @Test
    func `flatMap extracts light from light transform, dark from dark transform`() {
        let color = DarkModeColor(
            light: .hex("FF0000"),
            dark: .hex("00FF00")
        )
        let transformed = color.flatMap { _ in
            DarkModeColor(
                light: .hex("0000FF"),
                dark: .hex("FF00FF")
            )
        }
        #expect(transformed.light.description == "#0000FF")
        #expect(transformed.dark.description == "#FF00FF")
    }

    @Test
    func `adjustBrightness changes color brightness`() {
        let color = DarkModeColor(
            light: .hex("FF0000"),
            dark: .hex("00FF00")
        )
        let brightened = color.adjustBrightness(by: 0.2)
        #expect(brightened.light != color.light)
        #expect(brightened.dark != color.dark)
    }

    @Test
    func `darker makes colors darker`() {
        let color = DarkModeColor(
            light: .hex("FF0000"),
            dark: .hex("00FF00")
        )
        let darkened = color.darker(by: 0.3)
        #expect(darkened.light != color.light)
        #expect(darkened.dark != color.dark)
    }

    @Test
    func `lighter makes colors lighter`() {
        let color = DarkModeColor(
            light: .hex("FF0000"),
            dark: .hex("00FF00")
        )
        let lightened = color.lighter(by: 0.3)
        #expect(lightened.light != color.light)
        #expect(lightened.dark != color.dark)
    }

    @Test
    func `opacity applies to both colors`() {
        let color = DarkModeColor(
            light: .hex("FF0000"),
            dark: .hex("00FF00")
        )
        let faded = color.opacity(0.5)
        #expect(faded.light != color.light)
        #expect(faded.dark != color.dark)
    }

    @Test
    func `withDarkColor creates new DarkModeColor with specified dark`() {
        let original = DarkModeColor(.hex("FF0000"))
        let modified = original.withDarkColor(.hex("00FF00"))
        #expect(modified.light.description == "#FF0000")
        #expect(modified.dark.description == "#00FF00")
    }

    @Test
    func `Color Value withDarkColor creates DarkModeColor`() {
        let darkMode = CSS_Standard.Color.Value.hex("FF0000").withDarkColor(.hex("00FF00"))
        #expect(darkMode.light.description == "#FF0000")
        #expect(darkMode.dark.description == "#00FF00")
    }
}
