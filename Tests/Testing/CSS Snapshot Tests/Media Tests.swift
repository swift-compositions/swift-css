import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `Media Tests` {
        @Test
        func `htmlElementRenderingWithBasicMediaQuery`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.media(.screen) {
                        $0.backgroundColor(BackgroundColor.color(.named(.blue)))
                    }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media screen{
                        .background-color-0{background-color:blue}
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
        func `HTML element rendering with complex media query`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.media(
                        Media.screen
                            .and(.maxWidth(.px(500)))
                            .and(.prefersColorScheme(.dark))
                    ) { $0.backgroundColor(BackgroundColor.color(.named(.blue))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media screen and (max-width: 500px) and (prefers-color-scheme: dark){
                        .background-color-0{background-color:blue}
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
        func `HTML element rendering with negated media query`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.media(!Media.print) {
                        $0.backgroundColor(BackgroundColor.color(.named(.blue)))
                    }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media not print{
                        .background-color-0{background-color:blue}
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
        func `HTML element rendering with media OR query`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.media(Media.screen || Media.print) {
                        $0.backgroundColor(BackgroundColor.color(.named(.blue)))
                    }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media screen, print{
                        .background-color-0{background-color:blue}
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
        func `HTML element rendering with only operator`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.media(Media.screen.only()) {
                        $0.backgroundColor(BackgroundColor.color(.named(.blue)))
                    }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media only screen{
                        .background-color-0{background-color:blue}
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
        func `HTML element rendering with feature-only media query`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.dark { $0.backgroundColor(BackgroundColor.color(.named(.blue))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media (prefers-color-scheme: dark){
                        .background-color-0{background-color:blue}
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
        func `HTML element rendering with multiple properties in media query`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div
                        .css.media(Media.screen && .maxWidth(.px(768))) {
                            $0.backgroundColor(BackgroundColor.color(.named(.blue)))
                                .color(Color.color(.named(.white)))
                                .padding(.px(20))
                        }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media screen and (max-width: 768px){
                        .padding-0{padding:20px}
                        .color-1{color:white}
                        .background-color-2{background-color:blue}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="padding-0 color-1 background-color-2">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element rendering with media query and pseudo-class`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div
                        .css.media(.screen && .minWidth(.px(768))) {
                            $0.backgroundColor(BackgroundColor.color(.named(.blue)))
                                .backgroundColor(BackgroundColor.color(.named(.red)))
                        }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media screen and (min-width: 768px){
                        .background-color-0{background-color:red}
                        .background-color-1{background-color:blue}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0 background-color-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element rendering with multiple media queries`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div
                        .css
                        .media(.screen && .minWidth(.px(768))) {
                            $0.backgroundColor(BackgroundColor.color(.named(.blue)))
                        }
                        .media(.screen && .prefersColorScheme(.dark)) {
                            $0.color(Color.color(.named(.white)))
                        }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media screen and (prefers-color-scheme: dark){
                        .color-0{color:white}
                      }
                      @media screen and (min-width: 768px){
                        .background-color-1{background-color:blue}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 background-color-1">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
