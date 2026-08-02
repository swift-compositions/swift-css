//
//  BackgroundOrigin Tests.swift
//  swift-html
//
//  Created by Claude AI on 11/04/2025.
//

import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `BackgroundOrigin Tests` {
        @Test
        func `HTML element renders with background-origin border-box properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundOrigin(.borderBox)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-origin-0{background-origin:border-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-origin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-origin padding-box properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundOrigin(.paddingBox)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-origin-0{background-origin:padding-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-origin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-origin content-box properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundOrigin(.contentBox)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-origin-0{background-origin:content-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-origin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-origin with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundOrigin(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-origin-0{background-origin:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="background-origin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-origin with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.backgroundOrigin(.contentBox) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .background-origin-0{background-origin:content-box}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-origin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-origin with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.backgroundOrigin(.contentBox) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-origin-0:hover{background-origin:content-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-origin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-origin with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.backgroundOrigin(.contentBox) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .background-origin-0{background-origin:content-box}
                    </style>
                  </head>
                  <body>
                    <div class="background-origin-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
