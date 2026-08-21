import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `BackgroundImage Tests` {
        @Test
        func `HTML element renders with background-image url properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundImage(.url(.init("https://example.com/image.png")))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-image-0{background-image:url("https://example.com/image.png")}
                    </style>
                  </head>
                  <body>
                    <div class="background-image-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-image with none value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundImage(BackgroundImage.none)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-image-0{background-image:none}
                    </style>
                  </head>
                  <body>
                    <div class="background-image-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-image with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundImage(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-image-0{background-image:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="background-image-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-image with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print {
                        $0.backgroundImage(.url(.init("https://example.com/image.png")))
                    }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .background-image-0{background-image:url("https://example.com/image.png")}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-image-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-image with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover {
                        $0.backgroundImage(.url(.init("https://example.com/image.png")))
                    }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-image-0:hover{background-image:url("https://example.com/image.png")}
                    </style>
                  </head>
                  <body>
                    <div class="background-image-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-image with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") {
                        $0.backgroundImage(.url(.init("https://example.com/image.png")))
                    }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .background-image-0{background-image:url("https://example.com/image.png")}
                    </style>
                  </head>
                  <body>
                    <div class="background-image-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
