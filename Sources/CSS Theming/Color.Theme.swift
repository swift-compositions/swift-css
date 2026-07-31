//
//  File.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 12/03/2025.
//

import CSS_Standard
import Synchronization

extension DarkModeColor {
    public struct Theme: Sendable {
        public var gray: DarkModeColor
        public var blue: DarkModeColor
        public var green: DarkModeColor
        public var purple: DarkModeColor
        public var red: DarkModeColor
        public var yellow: DarkModeColor
        public var orange: DarkModeColor
        public var teal: DarkModeColor
        public var cyan: DarkModeColor
        public var pink: DarkModeColor
        public var brown: DarkModeColor
        public var black: DarkModeColor
        public var offBlack: DarkModeColor
        public var white: DarkModeColor
        public var offWhite: DarkModeColor
        public var neutral: DarkModeColor
        public var info: DarkModeColor
        public var text: DarkModeColor.Theme.Text
        public var background: DarkModeColor.Theme.Background
        public var border: DarkModeColor.Theme.Border
        public var branding: DarkModeColor.Theme.Branding
    }
}

extension DarkModeColor.Theme {
    /// Global prepared value (set via `prepareDependencies`).
    ///
    /// Guarded by a `Mutex` so concurrent `_prepare` writes and `current` reads
    /// never observe a torn (partially-written) theme value.
    private static let _preparedStorage: Mutex<DarkModeColor.Theme> = Mutex(.default)

    /// Scoped override (set via `withDependencies`)
    @TaskLocal private static var _scoped: DarkModeColor.Theme? = nil

    /// Current theme value. Returns scoped override if set, otherwise prepared value.
    public static var current: DarkModeColor.Theme {
        _scoped ?? _preparedStorage.withLock { $0 }
    }

    /// Set the global prepared value.
    public static func _prepare(_ value: DarkModeColor.Theme) {
        _preparedStorage.withLock { $0 = value }
    }
}

extension DarkModeColor {
    public static var theme: DarkModeColor.Theme {
        DarkModeColor.Theme.current
    }
}

extension DarkModeColor {
    public static var text: DarkModeColor.Theme.Text {
        DarkModeColor.Theme.current.text
    }
}

extension DarkModeColor {
    public static var background: DarkModeColor.Theme.Background {
        DarkModeColor.Theme.current.background
    }
}

extension DarkModeColor {
    public static var border: DarkModeColor.Theme.Border {
        DarkModeColor.Theme.current.border
    }
}

extension DarkModeColor {
    public static var branding: DarkModeColor.Theme.Branding {
        DarkModeColor.Theme.current.branding
    }
}

extension DarkModeColor {
    public static var gray: Self { DarkModeColor.Theme.current.gray }
    public static var black: Self { DarkModeColor.Theme.current.black }
    public static var offBlack: Self { DarkModeColor.Theme.current.offBlack }
    public static var white: Self { DarkModeColor.Theme.current.white }
    public static var offWhite: Self { DarkModeColor.Theme.current.offWhite }
    public static var cyan: Self { DarkModeColor.Theme.current.cyan }
    public static var teal: Self { DarkModeColor.Theme.current.teal }
    public static var pink: Self { DarkModeColor.Theme.current.pink }
    public static var brown: Self { DarkModeColor.Theme.current.brown }
    public static var orange: Self { DarkModeColor.Theme.current.orange }
    public static var green: Self { DarkModeColor.Theme.current.green }
    public static var purple: Self { DarkModeColor.Theme.current.purple }
    public static var blue: Self { DarkModeColor.Theme.current.blue }
    public static var red: Self { DarkModeColor.Theme.current.red }
    public static var yellow: Self { DarkModeColor.Theme.current.yellow }
    public static var neutral: Self { DarkModeColor.Theme.current.neutral }
    public static var info: Self { DarkModeColor.Theme.current.info }

    public static let transparent: Self = .init(light: .transparent, dark: .transparent)
}

extension DarkModeColor {
    public static let cardBackground: Self = .init(
        light: .rgb(red: 245, green: 246, blue: 248),
        dark: .rgb(red: 25, green: 25, blue: 27)
    )
}

extension DarkModeColor {
    public static let buttonBackground: Self = .cardBackground
}

// MARK: - Convenience API for setting theme

extension DarkModeColor.Theme {
    /// Execute an operation with a custom theme.
    ///
    /// Usage:
    /// ```swift
    /// DarkModeColor.Theme.withValue(.github) {
    ///     // Code here sees .github theme
    /// }
    /// ```
    public static func withValue<R, Failure: Swift.Error>(
        _ theme: DarkModeColor.Theme,
        operation: () throws(Failure) -> R
    ) throws(Failure) -> R {
        // `TaskLocal.withValue` is untyped `rethrows`, so the error is bridged back
        // to `Failure` explicitly; `operation` is the sole throwing source, so the
        // downcast always succeeds.
        let result: Result<R, Failure>
        // swift-linter:disable:next do throws for typed catch
        // REASON: Synchronization.TaskLocal.withValue(_:operation:) is a cross-module
        // stdlib API declared untyped `rethrows`; there is no `E` to name in `do throws(E)`.
        do {
            result = .success(try $_scoped.withValue(theme, operation: operation))
        } catch {
            result = .failure(error as! Failure)
        }
        return try result.get()
    }

    /// Execute an async operation with a custom theme.
    nonisolated(nonsending)
        public static func withValue<R, Failure: Swift.Error>(
            _ theme: DarkModeColor.Theme,
            operation: nonisolated(nonsending) () async throws(Failure) -> R
        ) async throws(Failure) -> R
    {
        // See the sync overload above for why the error is bridged explicitly.
        let result: Result<R, Failure>
        // swift-linter:disable:next do throws for typed catch
        // REASON: Synchronization.TaskLocal.withValue(_:operation:) is a cross-module
        // stdlib API declared untyped `rethrows`; there is no `E` to name in `do throws(E)`.
        do {
            result = .success(try await $_scoped.withValue(theme, operation: operation))
        } catch {
            result = .failure(error as! Failure)
        }
        return try result.get()
    }
}
