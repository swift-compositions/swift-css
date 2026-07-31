//
//  Color.Theme.Branding.swift
//  swift-css
//

import CSS_Standard

extension DarkModeColor.Theme {
    public struct Branding: Sendable {
        public var primary: DarkModeColor
        public var secondary: DarkModeColor
        public var accent: DarkModeColor
        public var primarySubtle: DarkModeColor
        public var secondarySubtle: DarkModeColor

        public init(
            primary: DarkModeColor,
            secondary: DarkModeColor,
            accent: DarkModeColor,
            primarySubtle: DarkModeColor,
            secondarySubtle: DarkModeColor
        ) {
            self.primary = primary
            self.secondary = secondary
            self.accent = accent
            self.primarySubtle = primarySubtle
            self.secondarySubtle = secondarySubtle
        }
    }
}
