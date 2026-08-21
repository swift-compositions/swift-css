public import CSS_Standard

public struct DarkModeColor: Sendable, Hashable, ColorConvertible {

    public let light: CSS_Standard.Color.Value

    public let dark: CSS_Standard.Color.Value

    @inlinable
    public init(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil
    ) {
        self.light = light
        self.dark = dark ?? light.darker()
    }

    @inlinable
    public init(_ color: CSS_Standard.Color.Value) {
        self.light = color
        self.dark = color
    }
}

extension DarkModeColor {

    public static func color(_ color: W3C_CSS_Values.Color) -> DarkModeColor {
        .init(light: color, dark: color)
    }
}

extension DarkModeColor {

    @inlinable
    public var isSingleColor: Bool { light == dark }
}

extension DarkModeColor {

    @inlinable
    public func map(
        _ transform: (CSS_Standard.Color.Value) -> CSS_Standard.Color.Value
    ) -> DarkModeColor {
        DarkModeColor(
            light: transform(light),
            dark: transform(dark)
        )
    }

    @inlinable
    public func flatMap(_ transform: (CSS_Standard.Color.Value) -> DarkModeColor) -> DarkModeColor {
        let lightTransformed = transform(light)
        let darkTransformed = transform(dark)
        return DarkModeColor(
            light: lightTransformed.light,
            dark: darkTransformed.dark
        )
    }
}

extension DarkModeColor {

    @inlinable
    public func adjustBrightness(by percentage: Double) -> DarkModeColor {
        map { $0.adjustBrightness(by: percentage) }
    }

    @inlinable
    public func darker(by percentage: Double = 0.2) -> DarkModeColor {
        map { $0.darker(by: percentage) }
    }

    @inlinable
    public func lighter(by percentage: Double = 0.2) -> DarkModeColor {
        map { $0.lighter(by: percentage) }
    }

    @inlinable
    public func opacity(_ alpha: Double) -> DarkModeColor {
        map { $0.opacity(alpha) }
    }
}

extension DarkModeColor {

    @inlinable
    public func withDarkColor(_ dark: CSS_Standard.Color.Value) -> DarkModeColor {
        DarkModeColor(light: self.light, dark: dark)
    }
}

extension CSS_Standard.Color.Value {

    @inlinable
    public func withDarkColor(_ dark: CSS_Standard.Color.Value) -> DarkModeColor {
        DarkModeColor(light: self, dark: dark)
    }
}

extension DarkModeColor: CustomStringConvertible {
    public var description: String {
        if isSingleColor {
            return light.description
        } else {
            let attribute = CSS_Standard.Color.property
            return
                "@media (prefers-color-scheme: light) { \(attribute):\(light) } @media (prefers-color-scheme: dark) { \(attribute):\(dark) }"
        }
    }
}
