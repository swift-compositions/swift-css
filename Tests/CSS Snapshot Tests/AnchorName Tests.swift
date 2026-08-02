//
//  AnchorName Tests.swift
//  swift-html
//
//  Created by Claude AI on 11/04/2025.
//

import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `AnchorName Tests` {
        @Test
        func `HTML element renders with anchor-name string value properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.anchorName(.single(.init("--section-header")))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .anchor-name-0{anchor-name:--section-header}
                    </style>
                  </head>
                  <body>
                    <div class="anchor-name-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with anchor-name none value`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.anchorName(AnchorName.none)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .anchor-name-0{anchor-name:none}
                    </style>
                  </head>
                  <body>
                    <div class="anchor-name-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML anchor-name with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.anchorName(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .anchor-name-0{anchor-name:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="anchor-name-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML anchor-name with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.anchorName(.single(.init("--section-intro"))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .anchor-name-0{anchor-name:--section-intro}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="anchor-name-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML anchor-name with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.anchorName(.single(.init("--heading"))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .anchor-name-0:hover{anchor-name:--heading}
                    </style>
                  </head>
                  <body>
                    <div class="anchor-name-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML anchor-name with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.anchorName(.single(.init("--footer"))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .anchor-name-0{anchor-name:--footer}
                    </style>
                  </head>
                  <body>
                    <div class="anchor-name-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
