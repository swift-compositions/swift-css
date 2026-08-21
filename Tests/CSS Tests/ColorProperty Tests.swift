import CSS
import CSS_Theming
import Testing

@Suite
struct `ColorProperty Tests` {

    @Test
    func `single creates normalized diagonal color`() {
        let prop = ColorProperty.single(.hex("FF0000"))
        if case .value(let darkMode) = prop {
            #expect(darkMode.isSingleColor == true)
            #expect(darkMode.light.description == "#FF0000")
            #expect(darkMode.dark.description == "#FF0000")
        } else {
            Issue.record("Expected .value case")
        }
    }

    @Test
    func `adaptive creates explicit light and dark pair`() {
        let prop = ColorProperty.adaptive(
            light: .hex("FFFFFF"),
            dark: .hex("000000")
        )
        if case .value(let darkMode) = prop {
            #expect(darkMode.isSingleColor == false)
            #expect(darkMode.light.description == "#FFFFFF")
            #expect(darkMode.dark.description == "#000000")
        } else {
            Issue.record("Expected .value case")
        }
    }

    @Test
    func `autoAdaptive derives dark variant when nil`() {
        let prop = ColorProperty.autoAdaptive(light: .hex("FFFFFF"))
        if case .value(let darkMode) = prop {
            #expect(darkMode.isSingleColor == false)
            #expect(darkMode.light.description == "#FFFFFF")
            #expect(darkMode.dark != darkMode.light)
        } else {
            Issue.record("Expected .value case")
        }
    }

    @Test
    func `autoAdaptive uses explicit dark when provided`() {
        let prop = ColorProperty.autoAdaptive(
            light: .hex("FFFFFF"),
            dark: .hex("111111")
        )
        if case .value(let darkMode) = prop {
            #expect(darkMode.dark.description == "#111111")
        } else {
            Issue.record("Expected .value case")
        }
    }

    @Test
    func `inherit creates global case`() {
        let prop = ColorProperty.inherit
        if case .global(let g) = prop {
            #expect(g.description == "inherit")
        } else {
            Issue.record("Expected .global case")
        }
    }

    @Test
    func `initial creates global case`() {
        let prop = ColorProperty.initial
        if case .global(let g) = prop {
            #expect(g.description == "initial")
        } else {
            Issue.record("Expected .global case")
        }
    }

    @Test
    func `unset creates global case`() {
        let prop = ColorProperty.unset
        if case .global(let g) = prop {
            #expect(g.description == "unset")
        } else {
            Issue.record("Expected .global case")
        }
    }
}
