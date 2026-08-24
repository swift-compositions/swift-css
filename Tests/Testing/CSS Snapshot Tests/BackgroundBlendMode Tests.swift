import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `BackgroundBlendMode Tests` {
        @Test
        func `HTML element renders with background-blend-mode normal properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundBlendMode(.normal)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-blend-mode-0{background-blend-mode:normal}
                    </style>
                  </head>
                  <body>
                    <div class="background-blend-mode-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-blend-mode multiply properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundBlendMode(.multiply)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-blend-mode-0{background-blend-mode:multiply}
                    </style>
                  </head>
                  <body>
                    <div class="background-blend-mode-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-blend-mode screen properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundBlendMode(.screen)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-blend-mode-0{background-blend-mode:screen}
                    </style>
                  </head>
                  <body>
                    <div class="background-blend-mode-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-blend-mode overlay properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundBlendMode(.overlay)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-blend-mode-0{background-blend-mode:overlay}
                    </style>
                  </head>
                  <body>
                    <div class="background-blend-mode-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-blend-mode with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundBlendMode(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-blend-mode-0{background-blend-mode:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="background-blend-mode-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-blend-mode with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.backgroundBlendMode(.multiply) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .background-blend-mode-0{background-blend-mode:multiply}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-blend-mode-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-blend-mode with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.backgroundBlendMode(.multiply) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-blend-mode-0:hover{background-blend-mode:multiply}
                    </style>
                  </head>
                  <body>
                    <div class="background-blend-mode-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-blend-mode with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.backgroundBlendMode(.multiply) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .background-blend-mode-0{background-blend-mode:multiply}
                    </style>
                  </head>
                  <body>
                    <div class="background-blend-mode-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
