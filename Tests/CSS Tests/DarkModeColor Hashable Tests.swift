import CSS
import CSS_Theming
import Testing

@Suite
struct `DarkModeColor Hashable Tests` {

    @Test
    func `equal colors with same light and dark are equal`() {
        let a = DarkModeColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        let b = DarkModeColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        #expect(a == b)
    }

    @Test
    func `colors with different light values are not equal`() {
        let a = DarkModeColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        let b = DarkModeColor(light: .hex("0000FF"), dark: .hex("00FF00"))
        #expect(a != b)
    }

    @Test
    func `colors with different dark values are not equal`() {
        let a = DarkModeColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        let b = DarkModeColor(light: .hex("FF0000"), dark: .hex("0000FF"))
        #expect(a != b)
    }

    @Test
    func `diagonal embedding equals explicit matching pair`() {
        let diagonal = DarkModeColor(.hex("FF0000"))
        let explicit = DarkModeColor(light: .hex("FF0000"), dark: .hex("FF0000"))
        #expect(diagonal == explicit)
    }

    @Test
    func `equal colors produce same hash`() {
        let a = DarkModeColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        let b = DarkModeColor(light: .hex("FF0000"), dark: .hex("00FF00"))
        #expect(a.hashValue == b.hashValue)
    }

    @Test
    func `colors can be used as Set elements`() {
        let red = DarkModeColor(.hex("FF0000"))
        let green = DarkModeColor(.hex("00FF00"))
        let redDuplicate = DarkModeColor(.hex("FF0000"))

        let set: Set<DarkModeColor> = [red, green, redDuplicate]
        #expect(set.count == 2)
    }

    @Test
    func `colors can be used as Dictionary keys`() {
        let red = DarkModeColor(.hex("FF0000"))
        let green = DarkModeColor(.hex("00FF00"))

        var dict: [DarkModeColor: String] = [:]
        dict[red] = "red"
        dict[green] = "green"

        #expect(dict[red] == "red")
        #expect(dict[green] == "green")
    }
}
