//
//  File.swift
//  coenttb-newsletter
//
//  Created by Coen ten Thije Boonkkamp on 26/06/2025.
//

import CSS_Standard
import Synchronization

extension Font {
    public struct Defaults: Sendable {
        public var extraLargeTitle2: Font
        public var extraLargeTitle: Font
        public var largeTitle: Font
        public var title: Font
        public var title2: Font
        public var title3: Font
        public var headline: Font
        public var subheadline: Font
        public var body: Font
        public var callout: Font
        public var caption: Font
        public var caption2: Font
        public var footnote: Font

        public init(
            extraLargeTitle2: Font,
            extraLargeTitle: Font,
            largeTitle: Font,
            title: Font,
            title2: Font,
            title3: Font,
            headline: Font,
            subheadline: Font,
            body: Font,
            callout: Font,
            caption: Font,
            caption2: Font,
            footnote: Font
        ) {
            self.extraLargeTitle2 = extraLargeTitle2
            self.extraLargeTitle = extraLargeTitle
            self.largeTitle = largeTitle
            self.title = title
            self.title2 = title2
            self.title3 = title3
            self.headline = headline
            self.subheadline = subheadline
            self.body = body
            self.callout = callout
            self.caption = caption
            self.caption2 = caption2
            self.footnote = footnote
        }
    }
}

extension Font.Defaults {
    /// Global prepared value (set via `prepareDependencies`).
    ///
    /// Guarded by a `Mutex` so concurrent `_prepare` writes and `current` reads
    /// never observe a torn (partially-written) value.
    private static let _preparedStorage: Mutex<Font.Defaults> = Mutex(.default)

    /// Scoped override (set via `withDependencies`)
    @TaskLocal private static var _scoped: Font.Defaults? = nil

    /// Current font defaults. Returns scoped override if set, otherwise prepared value.
    public static var current: Font.Defaults {
        _scoped ?? _preparedStorage.withLock { $0 }
    }

    /// Set the global prepared value.
    public static func _prepare(_ value: Font.Defaults) {
        _preparedStorage.withLock { $0 = value }
    }
}

extension Font {
    public static var extraLargeTitle2: Font { .font.extraLargeTitle2 }
    public static var extraLargeTitle: Font { .font.extraLargeTitle }
    public static var largeTitle: Font { .font.largeTitle }
    public static var title: Font { .font.title }
    public static var title2: Font { .font.title2 }
    public static var title3: Font { .font.title3 }
    public static var headline: Font { .font.headline }
    public static var subheadline: Font { .font.subheadline }
    public static var body: Font { .font.body }
    public static var callout: Font { .font.callout }
    public static var caption: Font { .font.caption }
    public static var caption2: Font { .font.caption2 }
    public static var footnote: Font { .font.footnote }
}

extension Font {
    public static func body(_ size: BodySize) -> Font {
        switch size {
        case .small: .caption
        case .regular: .body
        }
    }
}

extension Font {
    public static var font: Font.Defaults {
        Font.Defaults.current
    }
}

extension Font.Defaults {
    public static var `default`: Self {
        .init(
            extraLargeTitle2: .init(
                family: .systemUi,
                size: .rem(2.75),  // ~44px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .light,
                lineHeight: 1.1
            ),
            extraLargeTitle: .init(
                family: .systemUi,
                size: .rem(2.25),  // ~36px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .light,
                lineHeight: 1.1
            ),
            largeTitle: .init(
                family: .systemUi,
                size: .rem(2),  // ~32px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.15
            ),
            title: .init(
                family: .systemUi,
                size: .rem(1.75),  // ~28px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.2
            ),
            title2: .init(
                family: .systemUi,
                size: .rem(1.375),  // ~22px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.25
            ),
            title3: .init(
                family: .systemUi,
                size: .rem(1.25),  // ~20px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.3
            ),
            headline: .init(
                family: .systemUi,
                size: .rem(1.0625),  // ~17px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .semiBold,
                lineHeight: 1.35
            ),
            subheadline: .init(
                family: .systemUi,
                size: .rem(0.9375),  // ~15px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.4
            ),
            body: .init(
                family: .systemUi,
                size: .rem(1),  // ~16px (base size)
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.5
            ),
            callout: .init(
                family: .systemUi,
                size: .rem(1),  // ~16px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.4
            ),
            caption: .init(
                family: .systemUi,
                size: .rem(0.75),  // ~12px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.35
            ),
            caption2: .init(
                family: .systemUi,
                size: .rem(0.6875),  // ~11px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.3
            ),
            footnote: .init(
                family: .systemUi,
                size: .rem(0.8125),  // ~13px
                stretch: .normal,
                style: .normal,
                variant: .normal,
                weight: .normal,
                lineHeight: 1.35
            )
        )
    }
}

// MARK: - Convenience API for setting font

extension Font.Defaults {
    /// Execute an operation with custom font defaults.
    ///
    /// Usage:
    /// ```swift
    /// Font.Defaults.withValue(customFont) {
    ///     // Code here sees customFont
    /// }
    /// ```
    public static func withValue<R, Failure: Swift.Error>(
        _ font: Font.Defaults,
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
            result = .success(try $_scoped.withValue(font, operation: operation))
        } catch {
            result = .failure(error as! Failure)
        }
        return try result.get()
    }

    /// Execute an async operation with custom font defaults.
    nonisolated(nonsending)
        public static func withValue<R, Failure: Swift.Error>(
            _ font: Font.Defaults,
            operation: nonisolated(nonsending) () async throws(Failure) -> R
        ) async throws(Failure) -> R
    {
        // See the sync overload above for why the error is bridged explicitly.
        let result: Result<R, Failure>
        // swift-linter:disable:next do throws for typed catch
        // REASON: Synchronization.TaskLocal.withValue(_:operation:) is a cross-module
        // stdlib API declared untyped `rethrows`; there is no `E` to name in `do throws(E)`.
        do {
            result = .success(try await $_scoped.withValue(font, operation: operation))
        } catch {
            result = .failure(error as! Failure)
        }
        return try result.get()
    }
}
