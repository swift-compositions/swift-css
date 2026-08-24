import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `AlignmentBaseline Tests` {
        @Test
        func `HTML element renders with alignment-baseline properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.alignmentBaseline(.baseline)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .alignment-baseline-0{alignment-baseline:baseline}
                    </style>
                  </head>
                  <body>
                    <div class="alignment-baseline-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with alignment-baseline text-bottom value`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.alignmentBaseline(.textBottom)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .alignment-baseline-0{alignment-baseline:text-bottom}
                    </style>
                  </head>
                  <body>
                    <div class="alignment-baseline-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML alignment-baseline with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.alignmentBaseline(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .alignment-baseline-0{alignment-baseline:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="alignment-baseline-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML alignment-baseline with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.alignmentBaseline(.middle) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .alignment-baseline-0{alignment-baseline:middle}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="alignment-baseline-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML alignment-baseline with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.alignmentBaseline(.central) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .alignment-baseline-0:hover{alignment-baseline:central}
                    </style>
                  </head>
                  <body>
                    <div class="alignment-baseline-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML alignment-baseline with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.alignmentBaseline(.textTop) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .alignment-baseline-0{alignment-baseline:text-top}
                    </style>
                  </head>
                  <body>
                    <div class="alignment-baseline-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML alignment-baseline with after-edge value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.alignmentBaseline(.afterEdge)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .alignment-baseline-0{alignment-baseline:after-edge}
                    </style>
                  </head>
                  <body>
                    <div class="alignment-baseline-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
