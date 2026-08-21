public import CSS_Standard

public typealias ColorProperty = WithGlobal<DarkModeColor>

extension ColorProperty {

    @inlinable
    public static func single(_ color: CSS_Standard.Color.Value) -> ColorProperty {
        .value(DarkModeColor(color))
    }

    @inlinable
    public static func adaptive(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> ColorProperty {
        .value(DarkModeColor(light: light, dark: dark))
    }

    @inlinable
    public static func autoAdaptive(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil
    ) -> ColorProperty {
        .value(DarkModeColor(light: light, dark: dark))
    }
}

@usableFromInline
protocol ColorPropertyConvertible {

    static var injection: @Sendable (Self) -> ColorProperty { get }
}

extension DarkModeColor: ColorPropertyConvertible {
    @usableFromInline
    static let injection: @Sendable (DarkModeColor) -> ColorProperty = { .value($0) }
}

extension CSS_Standard.Color.Value: ColorPropertyConvertible {
    @usableFromInline
    static let injection: @Sendable (CSS_Standard.Color.Value) -> ColorProperty = { .single($0) }
}

extension CSS_Standard.Global: ColorPropertyConvertible {
    @usableFromInline
    static let injection: @Sendable (CSS_Standard.Global) -> ColorProperty = { .global($0) }
}
