//
//  exports.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 01/09/2025.
//

@_exported import CSS
@_exported import CSS_Standard

// MARK: - Theming Values

/// A container for theming values that can be modified in a scoped context.
///
/// This mirrors the `DependencyValues` pattern from swift-dependencies.
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

// MARK: - prepareDependencies API

/// Set global default theming values. Call once at app startup.
///
/// Usage:
/// ```swift
/// prepareDependencies {
///     $0.theme = .github
///     $0.font = customFont
/// }
/// ```
///
/// These values become the new defaults when no scoped override is active.
public func prepareDependencies(
    _ modify: (inout ThemingValues) -> Void
) {
    var values = ThemingValues()
    modify(&values)
    DarkModeColor.Theme._prepare(values.theme)
    Font.Defaults._prepare(values.font)
}

// MARK: - withDependencies API

/// Execute an operation with modified theming values.
///
/// Usage:
/// ```swift
/// withDependencies {
///     $0.theme = .github
///     $0.font = customFont
/// } operation: {
///     // Code here sees the modified values
/// }
/// ```
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

/// Execute an async operation with modified theming values.
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
