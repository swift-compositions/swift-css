//
//  BackgroundImage Tests.swift
//  swift-html
//
//  Created by Claude AI on 11/04/2025.
//

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

        //    @Test
        //    func htmlElementWithBackgroundImageLinearGradientRendersCorrectly() throws {
        //        assertInlineSnapshot(
        //            of: HTML.Document {
        //                div.css.backgroundImage(.linearGradient(degree: 45, .color(.red), .color(.blue)))
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <!doctype html>
        //            <html>
        //              <head>
        //                <style>
        //            .background-image-EdcYg1{background-image:linear-gradient(45deg, red, blue)}
        //
        //                </style>
        //              </head>
        //              <body>
        //            <div class="background-image-EdcYg1">
        //            </div>
        //              </body>
        //            </html>
        //            """
        //        }
        //    }
        //
        //    @Test
        //    func htmlElementWithBackgroundImageRadialGradientRendersCorrectly() throws {
        //        assertInlineSnapshot(
        //            of: HTML.Document {
        //                div.css.backgroundImage(.radialGradient(.color(.red), .color(.blue)))
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <!doctype html>
        //            <html>
        //              <head>
        //                <style>
        //            .background-image-kbqMx1{background-image:radial-gradient(red, blue)}
        //
        //                </style>
        //              </head>
        //              <body>
        //            <div class="background-image-kbqMx1">
        //            </div>
        //              </body>
        //            </html>
        //            """
        //        }
        //    }
        //
        //    @Test
        //    func htmlElementWithMultipleBackgroundImagesRendersCorrectly() throws {
        //        assertInlineSnapshot(
        //            of: HTML.Document {
        //                div.css.backgroundImage(.composite([.url, .url]))
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <!doctype html>
        //            <html>
        //              <head>
        //                <style>
        //            .background-image-PsRHs1{background-image:url, url}
        //
        //                </style>
        //              </head>
        //              <body>
        //            <div class="background-image-PsRHs1">
        //            </div>
        //              </body>
        //            </html>
        //            """
        //        }
        //    }

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
