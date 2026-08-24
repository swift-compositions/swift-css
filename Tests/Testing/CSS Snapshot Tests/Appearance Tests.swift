import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `Appearance Tests` {
        @Test
        func `HTML element renders with appearance properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.appearance(Appearance.none)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .appearance-0{appearance:none}
                    </style>
                  </head>
                  <body>
                    <div class="appearance-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with different appearance value properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.appearance(.auto)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .appearance-0{appearance:auto}
                    </style>
                  </head>
                  <body>
                    <div class="appearance-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML appearance with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.appearance(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .appearance-0{appearance:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="appearance-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML appearance with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.appearance(Appearance.none) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .appearance-0{appearance:none}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="appearance-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML appearance with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.appearance(Appearance.none) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .appearance-0:hover{appearance:none}
                    </style>
                  </head>
                  <body>
                    <div class="appearance-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML appearance with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.appearance(Appearance.none) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .appearance-0{appearance:none}
                    </style>
                  </head>
                  <body>
                    <div class="appearance-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
