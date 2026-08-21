import CSS_Standard

extension DarkModeColor.Theme {
    public struct Border: Sendable {
        public var primary: DarkModeColor
        public var secondary: DarkModeColor
        public var tertiary: DarkModeColor

        public var selected: DarkModeColor
        public var highlighted: DarkModeColor
        public var hover: DarkModeColor

        public var button: DarkModeColor

        public var error: DarkModeColor
        public var success: DarkModeColor
        public var warning: DarkModeColor
        public var info: DarkModeColor
        public var infoMuted: DarkModeColor
        public var neutral: DarkModeColor

        public init(
            primary: DarkModeColor,
            secondary: DarkModeColor,
            tertiary: DarkModeColor,
            selected: DarkModeColor,
            highlighted: DarkModeColor,
            hover: DarkModeColor? = nil,
            button: DarkModeColor,
            error: DarkModeColor,
            success: DarkModeColor,
            warning: DarkModeColor,
            info: DarkModeColor? = nil,
            infoMuted: DarkModeColor? = nil,
            neutral: DarkModeColor? = nil
        ) {
            self.primary = primary
            self.secondary = secondary
            self.tertiary = tertiary
            self.selected = selected
            self.highlighted = highlighted
            self.hover = hover ?? highlighted
            self.button = button
            self.error = error
            self.success = success
            self.warning = warning
            self.info = info ?? highlighted
            self.infoMuted = infoMuted ?? highlighted
            self.neutral = neutral ?? secondary
        }
    }
}
