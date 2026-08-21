import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `BackfaceVisibility Tests` {
        @Test
        func `HTML element renders with backface-visibility hidden properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backfaceVisibility(.hidden)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .backface-visibility-0{backface-visibility:hidden}
                    </style>
                  </head>
                  <body>
                    <div class="backface-visibility-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with backface-visibility visible properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backfaceVisibility(.visible)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .backface-visibility-0{backface-visibility:visible}
                    </style>
                  </head>
                  <body>
                    <div class="backface-visibility-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML backface-visibility with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backfaceVisibility(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .backface-visibility-0{backface-visibility:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="backface-visibility-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML backface-visibility with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.backfaceVisibility(.hidden) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .backface-visibility-0{backface-visibility:hidden}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="backface-visibility-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML backface-visibility with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.backfaceVisibility(.hidden) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .backface-visibility-0:hover{backface-visibility:hidden}
                    </style>
                  </head>
                  <body>
                    <div class="backface-visibility-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML backface-visibility with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.backfaceVisibility(.hidden) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .backface-visibility-0{backface-visibility:hidden}
                    </style>
                  </head>
                  <body>
                    <div class="backface-visibility-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
