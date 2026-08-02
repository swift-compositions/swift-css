//
//  AccentColor Tests.swift
//  swift-html
//
//  Created by Claude AI on 11/04/2025.
//

import CSS_Test_Support
import Testing

extension `Snapshot Tests` {

    @Suite
    struct `AccentColor Tests` {
        @Test
        func `HTML element renders with accent-color properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.accentColor(.color(.named(.red)))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .accent-color-0{accent-color:red}
                    </style>
                  </head>
                  <body>
                    <div class="accent-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with accent-color using hex color properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.accentColor(.color(.hex("FF0000")))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .accent-color-0{accent-color:#FF0000}
                    </style>
                  </head>
                  <body>
                    <div class="accent-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML accent-color with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.accentColor(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .accent-color-0{accent-color:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="accent-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML accent-color with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.accentColor(.color(.hex("FF0000"))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .accent-color-0{accent-color:#FF0000}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="accent-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML accent-color with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.accentColor(.color(.hex("FF0000"))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .accent-color-0:hover{accent-color:#FF0000}
                    </style>
                  </head>
                  <body>
                    <div class="accent-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML accent-color with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.accentColor(.color(.hex("FF0000"))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .accent-color-0{accent-color:#FF0000}
                    </style>
                  </head>
                  <body>
                    <div class="accent-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
