import CSS
import CSS_Theming
import Testing

@Suite
struct `DarkModeColor Palette Tests` {

    @Test(
        arguments: [
            ("gray100", DarkModeColor.gray100),
            ("gray500", DarkModeColor.gray500),
            ("gray900", DarkModeColor.gray900),
        ]
    )
    func `Gray shades have distinct dark mode variants`(name: String, color: DarkModeColor) {
        #expect(
            color.light != color.dark,
            "Gray shade \(name) should have different light and dark values"
        )
    }

    @Test(
        arguments: [
            ("blue100", DarkModeColor.blue100),
            ("blue500", DarkModeColor.blue500),
            ("blue900", DarkModeColor.blue900),
        ]
    )
    func `Blue shades have distinct dark mode variants`(name: String, color: DarkModeColor) {
        #expect(
            color.light != color.dark,
            "Blue shade \(name) should have different light and dark values"
        )
    }

    @Test(
        arguments: [
            ("red100", DarkModeColor.red100),
            ("red500", DarkModeColor.red500),
            ("red900", DarkModeColor.red900),
        ]
    )
    func `Red shades have distinct dark mode variants`(name: String, color: DarkModeColor) {
        #expect(
            color.light != color.dark,
            "Red shade \(name) should have different light and dark values"
        )
    }

    @Test(
        arguments: [
            ("green100", DarkModeColor.green100),
            ("green500", DarkModeColor.green500),
            ("green900", DarkModeColor.green900),
        ]
    )
    func `Green shades have distinct dark mode variants`(name: String, color: DarkModeColor) {
        #expect(
            color.light != color.dark,
            "Green shade \(name) should have different light and dark values"
        )
    }

    @Test
    func `reverse swaps light and dark values`() {
        let original = DarkModeColor.red500
        let reversed = original.reverse()
        #expect(reversed.light == original.dark)
        #expect(reversed.dark == original.light)
    }

    @Test
    func `reverse is self-inverse`() {
        let original = DarkModeColor.blue500
        let doubleReversed = original.reverse().reverse()
        #expect(doubleReversed.light == original.light)
        #expect(doubleReversed.dark == original.dark)
    }

    @Test
    func `Cyan aliases to Teal`() {
        #expect(DarkModeColor.cyan100.light == DarkModeColor.teal100.light)
        #expect(DarkModeColor.cyan100.dark == DarkModeColor.teal100.dark)
        #expect(DarkModeColor.cyan500.light == DarkModeColor.teal500.light)
        #expect(DarkModeColor.cyan500.dark == DarkModeColor.teal500.dark)
        #expect(DarkModeColor.cyan900.light == DarkModeColor.teal900.light)
        #expect(DarkModeColor.cyan900.dark == DarkModeColor.teal900.dark)
    }

    @Test
    func `Transparent has same light and dark values`() {
        #expect(DarkModeColor.transparent.light == DarkModeColor.transparent.dark)
        #expect(DarkModeColor.transparent.isSingleColor == true)
    }

    @Test
    func `Card background has distinct dark mode variant`() {
        #expect(DarkModeColor.cardBackground.light != DarkModeColor.cardBackground.dark)
    }
}
