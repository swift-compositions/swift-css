//
//  DarkModeColor.Theme.StyleSheet Tests.swift
//  swift-css
//
//  Regression coverage for F-001: translucent stylesheet variables must be computed
//  through typed opacity arithmetic, not by concatenating a literal hex suffix onto
//  an arbitrary color description.
//

import CSS
import CSS_Theming
import Testing

extension DarkModeColor.Theme.StyleSheet {
    @Suite
    struct `Translucent Variables Stay Valid CSS` {

        @Test
        func `the default theme's 3-digit hex shorthand white`() {
            let theme = DarkModeColor.Theme.default
            let css = theme.stylesheet.description

            // Historically: "#fff" + "33" = "#fff33" — a 5-digit hex value, invalid CSS.
            #expect(!css.contains("#fff33"))

            let expected = theme.white.light.opacity(0.2).description
            #expect(css.contains("--color-white-translucent: \(expected);"))
        }

        @Test
        func `rgba base colors`() {
            var theme = DarkModeColor.Theme.default
            theme.gray = DarkModeColor(
                light: .rgba(10, 20, 30, 0.5),
                dark: .rgba(40, 50, 60, 0.5)
            )
            let css = theme.stylesheet.description

            let expectedLight = theme.gray.light.opacity(0.2).description
            let expectedDark = theme.gray.dark.opacity(0.2).description
            #expect(css.contains("--color-gray-translucent: \(expectedLight);"))
            #expect(css.contains("--color-gray-translucent: \(expectedDark);"))
        }

        @Test
        func `named base colors`() {
            var theme = DarkModeColor.Theme.default
            theme.blue = DarkModeColor(light: .named(.blue), dark: .named(.navy))
            let css = theme.stylesheet.description

            let expectedLight = theme.blue.light.opacity(0.2).description
            let expectedDark = theme.blue.dark.opacity(0.2).description
            #expect(css.contains("--color-blue-translucent: \(expectedLight);"))
            #expect(css.contains("--color-blue-translucent: \(expectedDark);"))
        }
    }
}
