import CSS_Standard

extension DarkModeColor.Theme {
    public struct Text: Sendable {
        public var primary: DarkModeColor
        public var secondary: DarkModeColor
        public var tertiary: DarkModeColor

        public var link: DarkModeColor
        public var linkHover: DarkModeColor
        public var button: DarkModeColor

        public var error: DarkModeColor
        public var success: DarkModeColor
        public var warning: DarkModeColor
        public var info: DarkModeColor
        public var neutral: DarkModeColor

        public var inverted: DarkModeColor
        public var disabled: DarkModeColor

        public init(
            primary: DarkModeColor,
            secondary: DarkModeColor,
            tertiary: DarkModeColor,
            link: DarkModeColor,
            linkHover: DarkModeColor? = nil,
            button: DarkModeColor,
            error: DarkModeColor,
            success: DarkModeColor,
            warning: DarkModeColor,
            info: DarkModeColor? = nil,
            neutral: DarkModeColor? = nil,
            inverted: DarkModeColor,
            disabled: DarkModeColor
        ) {
            self.primary = primary
            self.secondary = secondary
            self.tertiary = tertiary
            self.link = link
            self.linkHover = linkHover ?? link
            self.button = button
            self.error = error
            self.success = success
            self.warning = warning
            self.info = info ?? link
            self.neutral = neutral ?? secondary
            self.inverted = inverted
            self.disabled = disabled
        }
    }
}
