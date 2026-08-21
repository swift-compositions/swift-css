import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `Background Tests` {
        @Test
        func `HTML element renders with background color properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.background(.red)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-0{background:red}
                    </style>
                  </head>
                  <body>
                    <div class="background-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background image properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.background(.image(.init("https://example.com/bg.png")))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-0{background:url("https://example.com/bg.png")}
                    </style>
                  </head>
                  <body>
                    <div class="background-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background with none value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.background(Background.none)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-0{background:none}
                    </style>
                  </head>
                  <body>
                    <div class="background-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.background(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-0{background:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="background-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.background(.red) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .background-0{background:red}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.background(.red) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-0:hover{background:red}
                    </style>
                  </head>
                  <body>
                    <div class="background-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.background(.red) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .background-0{background:red}
                    </style>
                  </head>
                  <body>
                    <div class="background-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
