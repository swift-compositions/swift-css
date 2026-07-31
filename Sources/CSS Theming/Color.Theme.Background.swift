//
//  Color.Theme.Background.swift
//  swift-css
//

import CSS_Standard

extension DarkModeColor.Theme {
    public struct Background: Sendable {
        public var primary: DarkModeColor
        public var secondary: DarkModeColor
        public var tertiary: DarkModeColor

        public var elevated: DarkModeColor
        public var grouped: DarkModeColor

        public var selected: DarkModeColor
        public var highlighted: DarkModeColor

        public var button: DarkModeColor
        public var buttonHover: DarkModeColor

        public var error: DarkModeColor
        public var errorMuted: DarkModeColor
        public var success: DarkModeColor
        public var successMuted: DarkModeColor
        public var warning: DarkModeColor
        public var warningMuted: DarkModeColor
        public var info: DarkModeColor
        public var infoMuted: DarkModeColor
        public var neutral: DarkModeColor

        public init(
            primary: DarkModeColor,
            secondary: DarkModeColor,
            tertiary: DarkModeColor,
            elevated: DarkModeColor,
            grouped: DarkModeColor,
            selected: DarkModeColor,
            highlighted: DarkModeColor,
            button: DarkModeColor,
            buttonHover: DarkModeColor? = nil,
            error: DarkModeColor,
            errorMuted: DarkModeColor? = nil,
            success: DarkModeColor,
            successMuted: DarkModeColor? = nil,
            warning: DarkModeColor,
            warningMuted: DarkModeColor? = nil,
            info: DarkModeColor? = nil,
            infoMuted: DarkModeColor? = nil,
            neutral: DarkModeColor? = nil
        ) {
            self.primary = primary
            self.secondary = secondary
            self.tertiary = tertiary
            self.elevated = elevated
            self.grouped = grouped
            self.selected = selected
            self.highlighted = highlighted
            self.button = button
            self.buttonHover = buttonHover ?? button
            self.error = error
            self.errorMuted = errorMuted ?? error
            self.success = success
            self.successMuted = successMuted ?? success
            self.warning = warning
            self.warningMuted = warningMuted ?? warning
            self.info = info ?? highlighted
            self.infoMuted = infoMuted ?? highlighted
            self.neutral = neutral ?? secondary
        }
    }
}
