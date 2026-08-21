import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `AspectRatio Tests` {
        @Test
        func `HTML element renders with aspect-ratio properly`() throws {
            let ratio = try AspectRatio.ratio(16, 9)
            snapshot(as: .html) {
                HTML.Document {
                    div.css.aspectRatio(ratio)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .aspect-ratio-0{aspect-ratio:16 / 9}
                    </style>
                  </head>
                  <body>
                    <div class="aspect-ratio-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with different aspect-ratio value properly`() throws {
            let ratio = try AspectRatio.ratio(4, 3)
            snapshot(as: .html) {
                HTML.Document {
                    div.css.aspectRatio(ratio)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .aspect-ratio-0{aspect-ratio:4 / 3}
                    </style>
                  </head>
                  <body>
                    <div class="aspect-ratio-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with auto aspect-ratio properly`() throws {
            let ratio = try AspectRatio.auto
            snapshot(as: .html) {
                HTML.Document {
                    div.css.aspectRatio(ratio)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .aspect-ratio-0{aspect-ratio:auto}
                    </style>
                  </head>
                  <body>
                    <div class="aspect-ratio-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML aspect-ratio with global value renders properly`() throws {
            let ratio = try AspectRatio.inherit
            snapshot(as: .html) {
                HTML.Document {
                    div.css.aspectRatio(ratio)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .aspect-ratio-0{aspect-ratio:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="aspect-ratio-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML aspect-ratio with media query renders properly`() throws {
            let ratio = try AspectRatio.ratio(16, 9)
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.aspectRatio(ratio) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .aspect-ratio-0{aspect-ratio:16 / 9}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="aspect-ratio-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML aspect-ratio with pseudo-class renders properly`() throws {
            let ratio = try AspectRatio.ratio(16, 9)
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.aspectRatio(ratio) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .aspect-ratio-0:hover{aspect-ratio:16 / 9}
                    </style>
                  </head>
                  <body>
                    <div class="aspect-ratio-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML aspect-ratio with prefix renders properly`() throws {
            let ratio = try AspectRatio.ratio(16, 9)
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.aspectRatio(ratio) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .aspect-ratio-0{aspect-ratio:16 / 9}
                    </style>
                  </head>
                  <body>
                    <div class="aspect-ratio-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
