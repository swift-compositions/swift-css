//
//  Border.swift
//  swift-css
//
//  Border type definition with side configuration.
//

import CSS_HTML_Rendering
public import CSS_Standard

public struct Border: Equatable, Sendable {
    public var sides: Swift.Set<Side>?
    public var width: BorderWidth?
    public var style: CSS_Standard.LineStyle?
    public var color: DarkModeColor?

    public init(
        sides: Swift.Set<Side>? = nil,
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: DarkModeColor? = nil
    ) {
        self.width = width
        self.style = style
        self.color = color
        self.sides = sides
    }
}
