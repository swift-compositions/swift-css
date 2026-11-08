public import CSS_HTML_Rendering
import CSS_Standard
import HTML_Rendering
public import W3C_CSS_Values

extension HTML.CSS {

    @inlinable
    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func text(
        align: TextAlign? = nil,
        decoration: TextDecoration? = nil,
        transform: TextTransform? = nil,
        overflow: TextOverflow? = nil
    ) -> HTML.CSS<some HTML.View> {
        base
            .inlineStyle(align)
            .inlineStyle(decoration)
            .inlineStyle(transform)
            .inlineStyle(overflow)
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func color(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {

        if darkModeColor.isSingleColor {
            self.color(W3C_CSS_Color.Color.color(darkModeColor.light))
        } else {
            self.color(W3C_CSS_Color.Color.color(darkModeColor.light))
                .dark(W3C_CSS_Color.Color.color(darkModeColor.dark))
        }
    }

    @discardableResult
    public func color(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        color(DarkModeColor(light: light, dark: dark))
    }

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func backgroundColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.backgroundColor(W3C_CSS_Backgrounds.BackgroundColor.color(darkModeColor.light))
        } else {
            self.backgroundColor(W3C_CSS_Backgrounds.BackgroundColor.color(darkModeColor.light))
                .dark {
                    $0.backgroundColor(
                        W3C_CSS_Backgrounds.BackgroundColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    @discardableResult
    public func backgroundColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        backgroundColor(DarkModeColor(light: light, dark: dark))
    }

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func border(
        width: W3C_CSS_Backgrounds.BorderWidth,
        style: W3C_CSS_Values::LineStyle,
        color: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if color.isSingleColor {
            self.border(W3C_CSS_Backgrounds.Border(width: width, style: style, color: color.light))
        } else {
            self.border(W3C_CSS_Backgrounds.Border(width: width, style: style, color: color.light))
                .dark {
                    $0.border(
                        W3C_CSS_Backgrounds.Border(width: width, style: style, color: color.dark)
                    )
                }
        }
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func accentColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.accentColor(CSS_Standard::AccentColor.color(darkModeColor.light))
        } else {
            self.accentColor(CSS_Standard::AccentColor.color(darkModeColor.light))
                .dark { $0.accentColor(CSS_Standard::AccentColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func accentColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        accentColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderBlockColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBlockColor(CSS_Standard::BorderBlockColor.color(darkModeColor.light))
        } else {
            self.borderBlockColor(CSS_Standard::BorderBlockColor.color(darkModeColor.light))
                .dark {
                    $0.borderBlockColor(CSS_Standard::BorderBlockColor.color(darkModeColor.dark))
                }
        }
    }

    @discardableResult
    public func borderBlockColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBlockColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderBlockEndColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBlockEndColor(CSS_Standard::BorderBlockEndColor.color(darkModeColor.light))
        } else {
            self.borderBlockEndColor(CSS_Standard::BorderBlockEndColor.color(darkModeColor.light))
                .dark {
                    $0.borderBlockEndColor(
                        CSS_Standard::BorderBlockEndColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    @discardableResult
    public func borderBlockEndColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBlockEndColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderBlockStartColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBlockStartColor(
                CSS_Standard::BorderBlockStartColor.color(darkModeColor.light)
            )
        } else {
            self.borderBlockStartColor(
                CSS_Standard::BorderBlockStartColor.color(darkModeColor.light)
            )
            .dark {
                $0.borderBlockStartColor(
                    CSS_Standard::BorderBlockStartColor.color(darkModeColor.dark)
                )
            }
        }
    }

    @discardableResult
    public func borderBlockStartColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBlockStartColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderBottomColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderBottomColor(CSS_Standard::BorderBottomColor.color(darkModeColor.light))
        } else {
            self.borderBottomColor(CSS_Standard::BorderBottomColor.color(darkModeColor.light))
                .dark {
                    $0.borderBottomColor(CSS_Standard::BorderBottomColor.color(darkModeColor.dark))
                }
        }
    }

    @discardableResult
    public func borderBottomColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderBottomColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderColor(CSS_Standard::BorderColor.color(darkModeColor.light))
        } else {
            self.borderColor(CSS_Standard::BorderColor.color(darkModeColor.light))
                .dark { $0.borderColor(CSS_Standard::BorderColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func borderColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderInlineColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderInlineColor(CSS_Standard::BorderInlineColor.color(darkModeColor.light))
        } else {
            self.borderInlineColor(CSS_Standard::BorderInlineColor.color(darkModeColor.light))
                .dark {
                    $0.borderInlineColor(CSS_Standard::BorderInlineColor.color(darkModeColor.dark))
                }
        }
    }

    @discardableResult
    public func borderInlineColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderInlineColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderInlineEndColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderInlineEndColor(CSS_Standard::BorderInlineEndColor.color(darkModeColor.light))
        } else {
            self.borderInlineEndColor(CSS_Standard::BorderInlineEndColor.color(darkModeColor.light))
                .dark {
                    $0.borderInlineEndColor(
                        CSS_Standard::BorderInlineEndColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    @discardableResult
    public func borderInlineEndColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderInlineEndColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderInlineStartColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderInlineStartColor(
                CSS_Standard::BorderInlineStartColor.color(darkModeColor.light)
            )
        } else {
            self.borderInlineStartColor(
                CSS_Standard::BorderInlineStartColor.color(darkModeColor.light)
            )
            .dark {
                $0.borderInlineStartColor(
                    CSS_Standard::BorderInlineStartColor.color(darkModeColor.dark)
                )
            }
        }
    }

    @discardableResult
    public func borderInlineStartColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderInlineStartColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderLeftColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderLeftColor(CSS_Standard::BorderLeftColor.color(darkModeColor.light))
        } else {
            self.borderLeftColor(CSS_Standard::BorderLeftColor.color(darkModeColor.light))
                .dark { $0.borderLeftColor(CSS_Standard::BorderLeftColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func borderLeftColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderLeftColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderRightColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderRightColor(CSS_Standard::BorderRightColor.color(darkModeColor.light))
        } else {
            self.borderRightColor(CSS_Standard::BorderRightColor.color(darkModeColor.light))
                .dark {
                    $0.borderRightColor(CSS_Standard::BorderRightColor.color(darkModeColor.dark))
                }
        }
    }

    @discardableResult
    public func borderRightColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderRightColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func borderTopColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.borderTopColor(CSS_Standard::BorderTopColor.color(darkModeColor.light))
        } else {
            self.borderTopColor(CSS_Standard::BorderTopColor.color(darkModeColor.light))
                .dark { $0.borderTopColor(CSS_Standard::BorderTopColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func borderTopColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        borderTopColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func caretColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.caretColor(CSS_Standard::CaretColor.color(darkModeColor.light))
        } else {
            self.caretColor(CSS_Standard::CaretColor.color(darkModeColor.light))
                .dark { $0.caretColor(CSS_Standard::CaretColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func caretColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        caretColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func columnRuleColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.columnRuleColor(CSS_Standard::ColumnRuleColor.color(darkModeColor.light))
        } else {
            self.columnRuleColor(CSS_Standard::ColumnRuleColor.color(darkModeColor.light))
                .dark { $0.columnRuleColor(CSS_Standard::ColumnRuleColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func columnRuleColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        columnRuleColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func fill(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.fill(CSS_Standard::Fill.color(darkModeColor.light))
        } else {
            self.fill(CSS_Standard::Fill.color(darkModeColor.light))
                .dark { $0.fill(CSS_Standard::Fill.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func fill(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        fill(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func floodColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.floodColor(CSS_Standard::FloodColor.color(darkModeColor.light))
        } else {
            self.floodColor(CSS_Standard::FloodColor.color(darkModeColor.light))
                .dark { $0.floodColor(CSS_Standard::FloodColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func floodColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        floodColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func lightingColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.lightingColor(CSS_Standard::LightingColor.color(darkModeColor.light))
        } else {
            self.lightingColor(CSS_Standard::LightingColor.color(darkModeColor.light))
                .dark { $0.lightingColor(CSS_Standard::LightingColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func lightingColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        lightingColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func outlineColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.outlineColor(CSS_Standard::OutlineColor.color(darkModeColor.light))
        } else {
            self.outlineColor(CSS_Standard::OutlineColor.color(darkModeColor.light))
                .dark { $0.outlineColor(CSS_Standard::OutlineColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func outlineColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        outlineColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func stopColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.stopColor(CSS_Standard::StopColor.color(darkModeColor.light))
        } else {
            self.stopColor(CSS_Standard::StopColor.color(darkModeColor.light))
                .dark { $0.stopColor(CSS_Standard::StopColor.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func stopColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        stopColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func stroke(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.stroke(CSS_Standard::Stroke.color(darkModeColor.light))
        } else {
            self.stroke(CSS_Standard::Stroke.color(darkModeColor.light))
                .dark { $0.stroke(CSS_Standard::Stroke.color(darkModeColor.dark)) }
        }
    }

    @discardableResult
    public func stroke(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        stroke(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func textDecorationColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.textDecorationColor(CSS_Standard::TextDecorationColor.color(darkModeColor.light))
        } else {
            self.textDecorationColor(CSS_Standard::TextDecorationColor.color(darkModeColor.light))
                .dark {
                    $0.textDecorationColor(
                        CSS_Standard::TextDecorationColor.color(darkModeColor.dark)
                    )
                }
        }
    }

    @discardableResult
    public func textDecorationColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        textDecorationColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @discardableResult
    @CSS_HTML_Rendering::CSS.Builder
    public func textEmphasisColor(
        _ darkModeColor: DarkModeColor
    ) -> HTML.CSS<some HTML.View> {
        if darkModeColor.isSingleColor {
            self.textEmphasisColor(CSS_Standard::TextEmphasisColor.color(darkModeColor.light))
        } else {
            self.textEmphasisColor(CSS_Standard::TextEmphasisColor.color(darkModeColor.light))
                .dark {
                    $0.textEmphasisColor(CSS_Standard::TextEmphasisColor.color(darkModeColor.dark))
                }
        }
    }

    @discardableResult
    public func textEmphasisColor(
        light: CSS_Standard::Color.Value,
        dark: CSS_Standard::Color.Value
    ) -> HTML.CSS<some HTML.View> {
        textEmphasisColor(DarkModeColor(light: light, dark: dark))
    }
}

extension HTML.CSS {

    @inlinable
    @discardableResult
    public func frame(
        width: CSS_Standard::Width? = nil,
        height: CSS_Standard::Height? = nil,
        minWidth: MinWidth? = nil,
        minHeight: MinHeight? = nil,
        maxWidth: MaxWidth? = nil,
        maxHeight: MaxHeight? = nil
    ) -> HTML.CSS<some HTML.View> {
        var result = HTML.AnyView(base)

        if let width {
            result = HTML.AnyView(result.inlineStyle(width))
        }
        if let height {
            result = HTML.AnyView(result.inlineStyle(height))
        }
        if let minWidth {
            result = HTML.AnyView(result.inlineStyle(minWidth))
        }
        if let minHeight {
            result = HTML.AnyView(result.inlineStyle(minHeight))
        }
        if let maxWidth {
            result = HTML.AnyView(result.inlineStyle(maxWidth))
        }
        if let maxHeight {
            result = HTML.AnyView(result.inlineStyle(maxHeight))
        }

        return HTML.CSS<HTML.AnyView>(base: result)
    }
}

extension HTML.CSS {

    @inlinable
    @discardableResult
    public func gridContainer(
        columns: GridTemplateColumns? = nil,
        rows: GridTemplateRows? = nil,
        gap: Gap? = nil,
        rowGap: RowGap? = nil,
        columnGap: ColumnGap? = nil,
        justifyItems: JustifyItems? = nil,
        alignItems: AlignItems? = nil
    ) -> HTML.CSS<some HTML.View> {
        var result = HTML.AnyView(base.inlineStyle(Display.grid))

        if let columns {
            result = HTML.AnyView(result.inlineStyle(columns))
        }
        if let rows {
            result = HTML.AnyView(result.inlineStyle(rows))
        }
        if let gap {
            result = HTML.AnyView(result.inlineStyle(gap))
        }
        if let rowGap {
            result = HTML.AnyView(result.inlineStyle(rowGap))
        }
        if let columnGap {
            result = HTML.AnyView(result.inlineStyle(columnGap))
        }
        if let justifyItems {
            result = HTML.AnyView(result.inlineStyle(justifyItems))
        }
        if let alignItems {
            result = HTML.AnyView(result.inlineStyle(alignItems))
        }

        return HTML.CSS<HTML.AnyView>(base: result)
    }
}

extension HTML.CSS {

    @inlinable
    @discardableResult
    public func gridItem(
        column: GridColumn? = nil,
        row: GridRow? = nil,
        columnStart: GridColumnStart? = nil,
        columnEnd: GridColumnEnd? = nil,
        rowStart: GridRowStart? = nil,
        rowEnd: GridRowEnd? = nil,
        justifySelf: JustifySelf? = nil,
        alignSelf: AlignSelf? = nil
    ) -> HTML.CSS<some HTML.View> {
        var result = HTML.AnyView(base)

        if let column {
            result = HTML.AnyView(result.inlineStyle(column))
        }
        if let row {
            result = HTML.AnyView(result.inlineStyle(row))
        }
        if let columnStart {
            result = HTML.AnyView(result.inlineStyle(columnStart))
        }
        if let columnEnd {
            result = HTML.AnyView(result.inlineStyle(columnEnd))
        }
        if let rowStart {
            result = HTML.AnyView(result.inlineStyle(rowStart))
        }
        if let rowEnd {
            result = HTML.AnyView(result.inlineStyle(rowEnd))
        }
        if let justifySelf {
            result = HTML.AnyView(result.inlineStyle(justifySelf))
        }
        if let alignSelf {
            result = HTML.AnyView(result.inlineStyle(alignSelf))
        }

        return HTML.CSS<HTML.AnyView>(base: result)
    }
}

extension HTML.CSS {

    @inlinable
    @discardableResult
    public func positioned(
        _ position: W3C_CSS_Positioning.Position,
        top: Top? = nil,
        right: Right? = nil,
        bottom: Bottom? = nil,
        left: Left? = nil,
        zIndex: ZIndex? = nil
    ) -> HTML.CSS<some HTML.View> {
        var result = HTML.AnyView(base.inlineStyle(position))

        if let top {
            result = HTML.AnyView(result.inlineStyle(top))
        }
        if let right {
            result = HTML.AnyView(result.inlineStyle(right))
        }
        if let bottom {
            result = HTML.AnyView(result.inlineStyle(bottom))
        }
        if let left {
            result = HTML.AnyView(result.inlineStyle(left))
        }
        if let zIndex {
            result = HTML.AnyView(result.inlineStyle(zIndex))
        }

        return HTML.CSS<HTML.AnyView>(base: result)
    }

    @inlinable
    @discardableResult
    public func absoluteFill() -> HTML.CSS<some HTML.View> {
        self.positioned(
            .absolute,
            top: .px(0),
            right: .px(0),
            bottom: .px(0),
            left: .px(0)
        )
    }
}

extension HTML.CSS {

    @inlinable
    @discardableResult
    public func spacing(
        padding: Padding? = nil,
        margin: Margin? = nil
    ) -> HTML.CSS<some HTML.View> {
        var result = HTML.AnyView(base)

        if let padding {
            result = HTML.AnyView(result.inlineStyle(padding))
        }
        if let margin {
            result = HTML.AnyView(result.inlineStyle(margin))
        }

        return HTML.CSS<HTML.AnyView>(base: result)
    }
}

extension HTML.CSS {

    @discardableResult
    @inlinable
    public func flexContainer(
        direction: FlexDirection? = nil,
        wrap: FlexWrap? = nil,
        justification: JustifyContent? = nil,
        itemAlignment: AlignItems? = nil,
        rowGap: RowGap? = nil,
        columnGap: ColumnGap? = nil
    )
        -> HTML.CSS<
            HTML.Styled<
                HTML.Styled<
                    HTML.Styled<
                        HTML.Styled<
                            HTML.Styled<
                                HTML.Styled<HTML.Styled<Base, Display>, FlexDirection>, FlexWrap
                            >, JustifyContent
                        >, AlignItems
                    >, RowGap
                >, ColumnGap
            >
        >
    {
        self
            .display(.flex)
            .flexDirection(direction)
            .flexWrap(wrap)
            .justifyContent(justification)
            .alignItems(itemAlignment)
            .rowGap(rowGap)
            .columnGap(columnGap)
    }

    @discardableResult
    @inlinable
    public func flexItem(
        grow: FlexGrow? = nil,
        shrink: FlexShrink? = nil,
        basis: FlexBasis? = nil
    ) -> HTML.CSS<HTML.Styled<HTML.Styled<HTML.Styled<Base, FlexGrow>, FlexShrink>, FlexBasis>> {
        self
            .flexGrow(grow)
            .flexShrink(shrink)
            .flexBasis(basis)
    }
}

extension HTML.CSS {

    @discardableResult
    @inlinable
    public func position(
        _ value: W3C_CSS_Positioning.Position?,
        top: Top? = nil,
        right: Right? = nil,
        bottom: Bottom? = nil,
        left: Left? = nil
    )
        -> HTML.CSS<
            HTML.Styled<
                HTML.Styled<
                    HTML.Styled<
                        HTML.Styled<HTML.Styled<Base, W3C_CSS_Positioning.Position>, Top>, Left
                    >, Right
                >, Bottom
            >
        >
    {
        self
            .position(value)
            .top(top)
            .left(left)
            .right(right)
            .bottom(bottom)
    }
}
