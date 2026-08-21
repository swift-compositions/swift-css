public import CSS_HTML_Rendering
public import CSS_Standard
import HTML_Rendering

extension HTML.CSS {
    @inlinable
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func border(
        _ border: Border?
    ) -> HTML.CSS<some HTML.View> {
        if let border {

            let borderStyle =
                "\(border.width?.description ?? "") \(border.style?.description ?? "")"
            let lightColor = border.color?.light.description ?? ""
            let darkColor = border.color?.dark.description ?? ""
            let isSingleColor = border.color?.isSingleColor ?? true
            let sides: Swift.Set<Border.Side> = border.sides ?? .init(Border.Side.allCases)
            let isAllSides = sides.count == Border.Side.allCases.count

            if isAllSides {

                if isSingleColor {
                    base.inlineStyle(
                        RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(lightColor)")
                    )
                } else {

                    let ctx = HTML.Style.Rule.Context.current
                    let darkMedia = W3C_CSS_MediaQueries.Media.prefersColorScheme(.dark)
                    let darkAtRule: HTML.AtRule = {
                        if let existingAtRule = ctx.atRule {

                            let combined = darkMedia.and(

                                W3C_CSS_MediaQueries.Media(rawValue: existingAtRule.rawValue)
                            )

                            return HTML.AtRule(rawValue: combined.rawValue)
                        } else {
                            return HTML.AtRule.Media(darkMedia)
                        }
                    }()

                    HTML.Styled(
                        HTML.Styled(
                            base,
                            RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(lightColor)"),
                            atRule: ctx.atRule,
                            selector: ctx.selector,
                            pseudo: ctx.pseudo
                        ),
                        RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(darkColor)"),
                        atRule: darkAtRule,
                        selector: ctx.selector,
                        pseudo: ctx.pseudo
                    )
                }
            } else {

                borderSidesView(
                    sides: sides,
                    borderStyle: borderStyle,
                    lightColor: lightColor,
                    darkColor: darkColor,
                    isSingleColor: isSingleColor
                )
            }
        } else {
            base
        }
    }

    @inlinable
    @discardableResult
    public func border(
        _ sides: [Border.Side] = Border.Side.allCases,
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: DarkModeColor? = nil
    ) -> HTML.CSS<some HTML.View> {
        self.border(Border(sides: .init(sides), width: width, style: style, color: color))
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func border(
        _ sides: Border.Side...,
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: DarkModeColor? = nil
    ) -> HTML.CSS<some HTML.View> {
        self.border(Border(sides: .init(sides), width: width, style: style, color: color))
    }
}

extension HTML.CSS {

    @usableFromInline
    @CSS_HTML_Rendering.CSS.Builder
    func borderSidesView(
        sides: Swift.Set<Border.Side>,
        borderStyle: String,
        lightColor: String,
        darkColor: String,
        isSingleColor: Bool
    ) -> HTML.CSS<some HTML.View> {
        base
            .applyBorderSide(
                shouldApply: sides.contains(Border.Side.top),
                property: BorderTop.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor
            )
            .applyBorderSide(
                shouldApply: sides.contains(Border.Side.right),
                property: BorderRight.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor
            )
            .applyBorderSide(
                shouldApply: sides.contains(Border.Side.bottom),
                property: BorderBottom.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor
            )
            .applyBorderSide(
                shouldApply: sides.contains(Border.Side.left),
                property: BorderLeft.self,
                borderStyle: borderStyle,
                lightColor: lightColor,
                darkColor: darkColor,
                isSingleColor: isSingleColor
            )
    }
}

extension HTML.View {

    @inlinable
    @HTML.Builder
    package func applyBorderSide<P: W3C_CSS_Shared.Property>(
        shouldApply: Bool,
        property: P.Type,
        borderStyle: String,
        lightColor: String,
        darkColor: String,
        isSingleColor: Bool
    ) -> some HTML.View {
        if shouldApply {
            if isSingleColor {
                self.inlineStyle(RawProperty<P>("\(borderStyle) \(lightColor)"))
            } else {

                let ctx = HTML.Style.Rule.Context.current
                let darkMedia = W3C_CSS_MediaQueries.Media.prefersColorScheme(.dark)
                let darkAtRule: HTML.AtRule = {
                    if let existingAtRule = ctx.atRule {

                        let combined = darkMedia.and(

                            W3C_CSS_MediaQueries.Media(rawValue: existingAtRule.rawValue)
                        )

                        return HTML.AtRule(rawValue: combined.rawValue)
                    } else {
                        return HTML.AtRule.Media(darkMedia)
                    }
                }()

                HTML.Styled(
                    HTML.Styled(
                        self,
                        RawProperty<P>("\(borderStyle) \(lightColor)"),
                        atRule: ctx.atRule,
                        selector: ctx.selector,
                        pseudo: ctx.pseudo
                    ),
                    RawProperty<P>("\(borderStyle) \(darkColor)"),
                    atRule: darkAtRule,
                    selector: ctx.selector,
                    pseudo: ctx.pseudo
                )
            }
        } else {
            self
        }
    }
}

extension HTML.CSS {
    @inlinable
    @discardableResult
    public func borderTop(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: DarkModeColor? = nil
    ) -> HTML.CSS<some HTML.View> {
        self.border([.top], width: width, style: style, color: color)
    }

    @inlinable
    @discardableResult
    public func borderBottom(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: DarkModeColor? = nil
    ) -> HTML.CSS<some HTML.View> {
        self.border([.bottom], width: width, style: style, color: color)
    }

    @inlinable
    @discardableResult
    public func borderLeft(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: DarkModeColor? = nil
    ) -> HTML.CSS<some HTML.View> {
        self.border([.left], width: width, style: style, color: color)
    }

    @inlinable
    @discardableResult
    public func borderRight(
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: DarkModeColor? = nil
    ) -> HTML.CSS<some HTML.View> {
        self.border([.right], width: width, style: style, color: color)
    }
}
