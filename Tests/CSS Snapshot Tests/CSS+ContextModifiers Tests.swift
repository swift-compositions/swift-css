//
//  CSS+ContextModifiers Tests.swift
//  swift-css
//
//  Tests for CSS context modifiers (.dark, .hover, .media, etc.)
//

import CSS_Test_Support
import Testing

extension `Snapshot Tests` {
    @Suite
    struct `ContextModifiers Tests` {

        // MARK: - Dark Mode Tests

        @Test
        func `dark mode closure syntax`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.dark { $0.color(Color.color(.named(.white))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media (prefers-color-scheme: dark){
                        .color-0{color:white}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `chained dark mode for color`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.color(.red).dark(.blue)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:red}
                      @media (prefers-color-scheme: dark){
                        .color-0{color:blue}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `chained dark mode for backgroundColor`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundColor(.white).dark(.black)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-1{background-color:white}
                      @media (prefers-color-scheme: dark){
                        .background-color-0{background-color:black}
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
        func `multiple chained dark modes`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css
                        .color(.red).dark(.blue)
                        .backgroundColor(.white).dark(.black)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-1{background-color:white}
                      .color-3{color:red}
                      @media (prefers-color-scheme: dark){
                        .background-color-0{background-color:black}
                        .color-2{color:blue}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="background-color-0 background-color-1 color-2 color-3">
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - Light Mode Tests

        @Test
        func `light mode closure syntax`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.light { $0.color(Color.color(.named(.black))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media (prefers-color-scheme: light){
                        .color-0{color:black}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `chained light mode`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.color(.black).light(.white)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-1{color:black}
                      @media (prefers-color-scheme: light){
                        .color-0{color:white}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - Hover Tests

        @Test
        func `hover closure syntax`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.hover { $0.backgroundColor(BackgroundColor.color(.named(.blue))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0:hover{background-color:blue}
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
        func `chained hover`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundColor(.blue).hover(.red)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0:hover{background-color:red}
                      .background-color-1{background-color:blue}
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

        // MARK: - Focus Tests

        @Test
        func `focus closure syntax`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.focus { $0.borderColor(BorderColor.color(.named(.blue))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .border-color-0:focus{border-color:blue}
                    </style>
                  </head>
                  <body>
                    <div class="border-color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `chained focus`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.borderColor(.gray).focus(.blue)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .border-color-0:focus{border-color:blue}
                      .border-color-1{border-color:gray}
                    </style>
                  </head>
                  <body>
                    <div class="border-color-0 border-color-1">
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - Active Tests

        @Test
        func `active closure syntax`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.active { $0.backgroundColor(BackgroundColor.color(.named(.red))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0:active{background-color:red}
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
        func `chained active`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.backgroundColor(.blue).active(.red)
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .background-color-0:active{background-color:red}
                      .background-color-1{background-color:blue}
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

        // MARK: - Media Query Tests

        @Test
        func `print media query`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.print { $0.color(Color.color(.named(.black))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media print{
                        .color-0{color:black}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `screen media query`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.screen { $0.color(Color.color(.named(.blue))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media screen{
                        .color-0{color:blue}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `desktop media query`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.desktop { $0.flexDirection(.row) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media only screen and (min-width: 832px){
                        .flex-direction-0{flex-direction:row}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="flex-direction-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `mobile media query`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.mobile { $0.flexDirection(.column) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media only screen and (max-width: 831px){
                        .flex-direction-0{flex-direction:column}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="flex-direction-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - Selector Tests

        @Test
        func `selector modifier`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.selector("my-component") { $0.color(Color.color(.named(.red))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      my-component .color-0{color:red}
                    </style>
                  </head>
                  <body>
                    <div class="color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        // MARK: - Nested Context Tests

        @Test
        func `nested dark and hover`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.dark { $0.hover { $0.color(Color.color(.named(.white))) } }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media (prefers-color-scheme: dark){
                        .color-0:hover{color:white}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0">
                    </div>
                  </body>
                </html>
                """
            }
        }

        @Test
        func `nested mobile and dark`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css.mobile {
                        $0.dark { $0.backgroundColor(BackgroundColor.color(.named(.black))) }
                    }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      @media (prefers-color-scheme: dark){
                        .background-color-0{background-color:black}
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

        // MARK: - Combined Styles Tests

        @Test
        func `base style with dark and hover variants`() throws {
            snapshot(as: .html) {
                HTML.Document {
                    div.css
                        .color(Color.color(.named(.black)))
                        .dark { $0.color(Color.color(.named(.white))) }
                        .hover { $0.color(Color.color(.named(.blue))) }
                }
            } matches: {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                      .color-0:hover{color:blue}
                      .color-2{color:black}
                      @media (prefers-color-scheme: dark){
                        .color-1{color:white}
                      }
                    </style>
                  </head>
                  <body>
                    <div class="color-0 color-1 color-2">
                    </div>
                  </body>
                </html>
                """
            }
        }
    }
}
