//
//  CSS+border.swift
//  swift-css
//
//  Border convenience methods for CSS namespace with side configuration.
//

public import CSS_HTML_Rendering
public import CSS_Standard
public import HTML_Rendering

extension HTML.CSS {
    @inlinable
    @discardableResult
    @CSS_HTML_Rendering.CSS.Builder
    public func border(
        _ border: Border?
    ) -> HTML.CSS<some HTML.View> {
        if let border {
            // Extract common border properties
            let borderStyle =
                "\(border.width?.description ?? "") \(border.style?.description ?? "")"
            let lightColor = border.color?.light.description ?? ""
            let darkColor = border.color?.dark.description ?? ""
            let isSingleColor = border.color?.isSingleColor ?? true
            let sides: Swift.Set<Border.Side> = border.sides ?? .init(Border.Side.allCases)
            let isAllSides = sides.count == Border.Side.allCases.count

            if isAllSides {
                // All sides - use shorthand property
                if isSingleColor {
                    base.inlineStyle(
                        RawProperty<W3C_CSS_Backgrounds.Border>("\(borderStyle) \(lightColor)")
                    )
                } else {
                    // Different light/dark: emit both with dark mode media query
                    let ctx = HTML.Style.Rule.Context.current
                    let darkMedia = W3C_CSS_MediaQueries.Media.prefersColorScheme(.dark)
                    let darkAtRule: HTML.AtRule = {
                        if let existingAtRule = ctx.atRule {
                            // Combine with existing media query using Media's and() method
                            let combined = darkMedia.and(
                                // swift-linter:disable:next raw value access
                                // REASON: HTML.AtRule (CSS_HTML_Rendering) and
                                // W3C_CSS_MediaQueries.Media (CSS_Standard) are unrelated
                                // newtypes declared in separate upstream packages with no
                                // typed conversion between them; bridging via their shared
                                // raw String representation is this package's own interop code.
                                W3C_CSS_MediaQueries.Media(rawValue: existingAtRule.rawValue)
                            )
                            // swift-linter:disable:next raw value access
                            // REASON: see above — no typed HTML.AtRule(_: Media) initializer
                            // exists upstream to construct the combined dark-mode at-rule.
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
                // Individual sides - use nested _Conditional via result builder
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

// MARK: - Border Sides with Nested _Conditional

extension HTML.CSS {
    /// Applies border styles to individual sides using nested _Conditional types.
    ///
    /// Each side check produces a _Conditional wrapping the styled or unstyled view.
    /// The sides are applied in sequence: top -> right -> bottom -> left.
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

// MARK: - Conditional Border Side Modifier

extension HTML.View {
    /// Conditionally applies a border side style.
    ///
    /// Returns a `_Conditional` type: when `shouldApply` is true, returns the styled view;
    /// when false, returns `self` unchanged. This preserves type information through
    /// the result builder's `buildEither` mechanism.
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
                // Different light/dark: emit both with dark mode media query
                let ctx = HTML.Style.Rule.Context.current
                let darkMedia = W3C_CSS_MediaQueries.Media.prefersColorScheme(.dark)
                let darkAtRule: HTML.AtRule = {
                    if let existingAtRule = ctx.atRule {
                        // Combine with existing media query using Media's and() method
                        let combined = darkMedia.and(
                            // swift-linter:disable:next raw value access
                            // REASON: HTML.AtRule (CSS_HTML_Rendering) and
                            // W3C_CSS_MediaQueries.Media (CSS_Standard) are unrelated
                            // newtypes declared in separate upstream packages with no
                            // typed conversion between them; bridging via their shared
                            // raw String representation is this package's own interop code.
                            W3C_CSS_MediaQueries.Media(rawValue: existingAtRule.rawValue)
                        )
                        // swift-linter:disable:next raw value access
                        // REASON: see above — no typed HTML.AtRule(_: Media) initializer
                        // exists upstream to construct the combined dark-mode at-rule.
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

// MARK: - Individual Border Side Functions

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
