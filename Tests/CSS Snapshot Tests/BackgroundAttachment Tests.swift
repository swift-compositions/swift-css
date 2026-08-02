//
//  BackgroundAttachment Tests.swift
//  swift-html
//
//  Created by Claude AI on 11/04/2025.
//

import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `BackgroundAttachment Tests` {
        @Test
        func `HTML element renders with background-attachment fixed properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundAttachment(.fixed)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-attachment-0{background-attachment:fixed}
                    </style>
                  </head>
                  <body>
                    <div class="background-attachment-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-attachment scroll properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundAttachment(.scroll)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-attachment-0{background-attachment:scroll}
                    </style>
                  </head>
                  <body>
                    <div class="background-attachment-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with background-attachment local properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundAttachment(.local)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-attachment-0{background-attachment:local}
                    </style>
                  </head>
                  <body>
                    <div class="background-attachment-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-attachment with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundAttachment(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-attachment-0{background-attachment:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="background-attachment-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-attachment with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.backgroundAttachment(.fixed) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .background-attachment-0{background-attachment:fixed}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-attachment-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-attachment with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.backgroundAttachment(.fixed) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-attachment-0:hover{background-attachment:fixed}
                    </style>
                  </head>
                  <body>
                    <div class="background-attachment-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML background-attachment with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.backgroundAttachment(.fixed) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .background-attachment-0{background-attachment:fixed}
                    </style>
                  </head>
                  <body>
                    <div class="background-attachment-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
