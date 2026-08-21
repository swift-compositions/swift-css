import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `BackgroundColor Tests` {
        @Test
        func `HTML element renders with background-color named color properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundColor(.color(.named(.red)))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0{background-color:red}
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-color hex color properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundColor(.color(.hex("FF0000")))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0{background-color:#FF0000}
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-color rgb color properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundColor(.color(.rgb(255, 0, 0)))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0{background-color:rgb(255, 0, 0)}
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-color rgba color properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundColor(.color(.rgba(255, 0, 0, 0.5)))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0{background-color:rgba(255, 0, 0, 0.5)}
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-color transparent properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundColor(.transparent)
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
                    <div class="background-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-color with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundColor(BackgroundColor.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0{background-color:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-color with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.backgroundColor(.color(.named(.red))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .background-color-0{background-color:red}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-color with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.backgroundColor(.color(.named(.red))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0:hover{background-color:red}
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-color with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.backgroundColor(.color(.named(.red))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .background-color-0{background-color:red}
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
