//
//  BackgroundClip Tests.swift
//  swift-html
//
//  Created by Claude AI on 11/04/2025.
//

import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `BackgroundClip Tests` {
        @Test
        func `HTML element renders with background-clip border-box properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundClip(.borderBox)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-clip-0{background-clip:border-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-clip-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-clip padding-box properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundClip(.paddingBox)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-clip-0{background-clip:padding-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-clip-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-clip content-box properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundClip(.contentBox)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-clip-0{background-clip:content-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-clip-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-clip text properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundClip(.text)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-clip-0{background-clip:text}
                    </style>
                  </head>
                  <body>
                    <div class="background-clip-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-clip with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundClip(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-clip-0{background-clip:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="background-clip-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-clip with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.backgroundClip(.contentBox) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .background-clip-0{background-clip:content-box}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-clip-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-clip with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.backgroundClip(.contentBox) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-clip-0:hover{background-clip:content-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-clip-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-clip with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.backgroundClip(.contentBox) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .background-clip-0{background-clip:content-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-clip-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
