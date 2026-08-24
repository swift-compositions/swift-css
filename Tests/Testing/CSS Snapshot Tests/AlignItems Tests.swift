import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `AlignItems Tests` {
        @Test
        func `HTML element renders with align-items properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.alignItems(.center)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .align-items-0{align-items:center}
                    </style>
                  </head>
                  <body>
                    <div class="align-items-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with align-items flex-start value`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.alignItems(.flexStart)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .align-items-0{align-items:flex-start}
                    </style>
                  </head>
                  <body>
                    <div class="align-items-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML align-items with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.alignItems(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .align-items-0{align-items:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="align-items-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML align-items with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.alignItems(.center) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .align-items-0{align-items:center}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="align-items-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML align-items with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.alignItems(.baseline) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .align-items-0:hover{align-items:baseline}
                    </style>
                  </head>
                  <body>
                    <div class="align-items-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML align-items with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.alignItems(.flexEnd) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .align-items-0{align-items:flex-end}
                    </style>
                  </head>
                  <body>
                    <div class="align-items-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML align-items with stretch value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.alignItems(.stretch)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .align-items-0{align-items:stretch}
                    </style>
                  </head>
                  <body>
                    <div class="align-items-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
