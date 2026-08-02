//
//  Color Theme Tests.swift
//  swift-css
//
//  Tests for DarkModeColor theme palettes and themed color statics.
//

import CSS_Test_Support
import Testing

@Suite
struct `Color Theme Tests` {

    // MARK: - Palette Dark Mode Variants

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

    // MARK: - Reverse Method

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

    // MARK: - Cyan and Teal Aliases

    @Test
    func `Cyan aliases to Teal`() {
        #expect(DarkModeColor.cyan100.light == DarkModeColor.teal100.light)
        #expect(DarkModeColor.cyan100.dark == DarkModeColor.teal100.dark)
        #expect(DarkModeColor.cyan500.light == DarkModeColor.teal500.light)
        #expect(DarkModeColor.cyan500.dark == DarkModeColor.teal500.dark)
        #expect(DarkModeColor.cyan900.light == DarkModeColor.teal900.light)
        #expect(DarkModeColor.cyan900.dark == DarkModeColor.teal900.dark)
    }

    // MARK: - Special Colors

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

// MARK: - Snapshot Tests

extension `Snapshot Tests` {
    @Suite
    struct `Color Theme Snapshot Tests` {
        @Test
        func `Gray500 renders with dark mode`() {
            snapshot(as: .html) {
                HTML.Document {
                    div { "Gray" }
                        .css.backgroundColor(.gray500)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-1{background-color:#888888}
                      @media (prefers-color-scheme: dark){
                        .background-color-0{background-color:#707070}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0 background-color-1">Gray
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `Blue500 renders with dark mode`() {
            snapshot(as: .html) {
                HTML.Document {
                    div { "Blue" }
                        .css.color(.blue500)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:#3399ff}
                      @media (prefers-color-scheme: dark){
                        .color-0{color:#004477}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Blue
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `Red500 renders with dark mode`() {
            snapshot(as: .html) {
                HTML.Document {
                    div { "Red" }
                        .css.borderColor(.red500)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .border-color-1{border-color:#cc3333}
                      @media (prefers-color-scheme: dark){
                        .border-color-0{border-color:#ff1a1a}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="border-color-0 border-color-1">Red
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `Themed red uses theme color with dark mode`() {
            snapshot(as: .html) {
                HTML.Document {
                    div { "Themed Red" }
                        .css.color(.red)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:#cc3333}
                      @media (prefers-color-scheme: dark){
                        .color-0{color:#ff1a1a}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">Themed Red
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `Single color DarkModeColor does not generate dark mode CSS`() {
            snapshot(as: .html) {
                HTML.Document {
                    div { "Single" }
                        .css.color(DarkModeColor(.hex("FF0000")))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0{color:#FF0000}
                    </style>
                  </head>
                  <body>
                    <div class="color-0">Single
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `Transparent does not generate dark mode CSS`() {
            snapshot(as: .html) {
                HTML.Document {
                    div { "Transparent" }
                        .css.backgroundColor(.transparent)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0{background-color:transparent}
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0">Transparent
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
