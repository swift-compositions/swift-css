@_exported import CSS
@_exported import CSS_Standard

public struct ThemingValues: Sendable {
    public var theme: DarkModeColor.Theme
    public var font: Font.Defaults

    public init(
        theme: DarkModeColor.Theme = .current,
        font: Font.Defaults = .current
    ) {
        self.theme = theme
        self.font = font
    }
}

public func prepareDependencies(
    _ modify: (inout ThemingValues) -> Void
) {
    var values = ThemingValues()
    modify(&values)
    DarkModeColor.Theme._prepare(values.theme)
    Font.Defaults._prepare(values.font)
}

public func withDependencies<R, Failure: Swift.Error>(
    _ modify: (inout ThemingValues) -> Void,
    operation: () throws(Failure) -> R
) throws(Failure) -> R {
    var values = ThemingValues()
    modify(&values)
    return try DarkModeColor.Theme.withValue(values.theme) { () throws(Failure) -> R in
        try Font.Defaults.withValue(values.font, operation: operation)
    }
}

nonisolated(nonsending)
    public func withDependencies<R, Failure: Swift.Error>(
        _ modify: (inout ThemingValues) -> Void,
        operation: nonisolated(nonsending) () async throws(Failure) -> R
    ) async throws(Failure) -> R
{
    var values = ThemingValues()
    modify(&values)
    return try await DarkModeColor.Theme.withValue(values.theme) {
        () async throws(Failure) -> R in
        try await Font.Defaults.withValue(values.font, operation: operation)
    }
}
