//
//  BackdropFilter Tests.swift
//  swift-html
//
//  Created by Claude AI on 11/04/2025.
//

import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `BackdropFilter Tests` {
        @Test
        func `HTML element renders with backdrop-filter blur properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backdropFilter(.blur(.px(5)))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .backdrop-filter-0{backdrop-filter:blur(5px)}
                    </style>
                  </head>
                  <body>
                    <div class="backdrop-filter-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML element renders with backdrop-filter brightness properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backdropFilter(.brightness(1.5))
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .backdrop-filter-0{backdrop-filter:brightness(1.5)}
                    </style>
                  </head>
                  <body>
                    <div class="backdrop-filter-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        //    @Test
        //    func htmlElementWithMultipleBackdropFiltersRendersCorrectly() throws {
        //        assertInlineSnapshot(
        //            of: HTML.Document {
        //                div.css.backdropFilter(.composite([.blur(.px(5)), .brightness(1.2)]))
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <!doctype html>
        //            <html>
        //              <head>
        //                <style>
        //            .backdrop-filter-YazUw1{backdrop-filter:blur(5px) brightness(1.2)}
        //
        //                </style>
        //              </head>
        //              <body>
        //            <div class="backdrop-filter-YazUw1">
        //            </div>
        //              </body>
        //            </html>
        //            """
        //        }
        //    }

        @Test
        func `HTML backdrop-filter with none value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backdropFilter(BackdropFilter.none)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .backdrop-filter-0{backdrop-filter:none}
                    </style>
                  </head>
                  <body>
                    <div class="backdrop-filter-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML backdrop-filter with global value renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backdropFilter(.inherit)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .backdrop-filter-0{backdrop-filter:inherit}
                    </style>
                  </head>
                  <body>
                    <div class="backdrop-filter-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML backdrop-filter with media query renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.backdropFilter(.blur(.px(5))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .backdrop-filter-0{backdrop-filter:blur(5px)}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="backdrop-filter-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML backdrop-filter with pseudo-class renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.backdropFilter(.blur(.px(5))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .backdrop-filter-0:hover{backdrop-filter:blur(5px)}
                    </style>
                  </head>
                  <body>
                    <div class="backdrop-filter-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `HTML backdrop-filter with prefix renders properly`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.backdropFilter(.blur(.px(5))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .backdrop-filter-0{backdrop-filter:blur(5px)}
                    </style>
                  </head>
                  <body>
                    <div class="backdrop-filter-0">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
