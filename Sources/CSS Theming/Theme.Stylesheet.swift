import CSS

extension DarkModeColor.Theme {

    public var stylesheet: StyleSheet {
        DarkModeColor.Theme.StyleSheet(theme: self)
    }
}

extension DarkModeColor.Theme {
    public struct StyleSheet: CustomStringConvertible {
        let theme: DarkModeColor.Theme
    }
}

extension DarkModeColor.Theme.StyleSheet {
    public var description: String {
        """
        /* Generated Theme Stylesheet */
        :root {
            /* Base Colors */
            --color-gray: \(theme.gray.light.description);
            --color-blue: \(theme.blue.light.description);
            --color-green: \(theme.green.light.description);
            --color-purple: \(theme.purple.light.description);
            --color-red: \(theme.red.light.description);
            --color-yellow: \(theme.yellow.light.description);
            --color-orange: \(theme.orange.light.description);
            --color-teal: \(theme.teal.light.description);
            --color-cyan: \(theme.cyan.light.description);
            --color-pink: \(theme.pink.light.description);
            --color-brown: \(theme.brown.light.description);
            --color-black: \(theme.black.light.description);
            --color-off-black: \(theme.offBlack.light.description);
            --color-white: \(theme.white.light.description);
            --color-off-white: \(theme.offWhite.light.description);

            /* Text Colors */
            --text-primary: \(theme.text.primary.light.description);
            --text-secondary: \(theme.text.secondary.light.description);
            --text-tertiary: \(theme.text.tertiary.light.description);
            --text-link: \(theme.text.link.light.description);
            --text-button: \(theme.text.button.light.description);
            --text-error: \(theme.text.error.light.description);
            --text-success: \(theme.text.success.light.description);
            --text-warning: \(theme.text.warning.light.description);
            --text-disabled: \(theme.text.disabled.light.description);

            /* Background Colors */
            --background-primary: \(theme.background.primary.light.description);
            --background-secondary: \(theme.background.secondary.light.description);
            --background-tertiary: \(theme.background.tertiary.light.description);
            --background-elevated: \(theme.background.elevated.light.description);
            --background-grouped: \(theme.background.grouped.light.description);
            --background-selected: \(theme.background.selected.light.description);
            --background-highlighted: \(theme.background.highlighted.light.description);
            --background-button: \(theme.background.button.light.description);
            --background-error: \(theme.background.error.light.description);
            --background-success: \(theme.background.success.light.description);
            --background-warning: \(theme.background.warning.light.description);
            --background-info: \(theme.background.info.light.description);

            /* Border Colors */
            --border-primary: \(theme.border.primary.light.description);
            --border-secondary: \(theme.border.secondary.light.description);
            --border-tertiary: \(theme.border.tertiary.light.description);
            --border-selected: \(theme.border.selected.light.description);
            --border-highlighted: \(theme.border.highlighted.light.description);
            --border-button: \(theme.border.button.light.description);
            --border-error: \(theme.border.error.light.description);
            --border-success: \(theme.border.success.light.description);
            --border-warning: \(theme.border.warning.light.description);
            --border-info: \(theme.border.info.light.description);

            /* Branding Colors */
            --branding-primary: \(theme.branding.primary.light.description);
            --branding-secondary: \(theme.branding.secondary.light.description);
            --branding-accent: \(theme.branding.accent.light.description);
            --branding-primary-subtle: \(theme.branding.primarySubtle.light.description);
            --branding-secondary-subtle: \(theme.branding.secondarySubtle.light.description);

            /* Translucent variants for charts and overlays */
            --color-gray-translucent: \(theme.gray.light.opacity(0.2).description);
            --color-blue-translucent: \(theme.blue.light.opacity(0.2).description);
            --color-green-translucent: \(theme.green.light.opacity(0.2).description);
            --color-purple-translucent: \(theme.purple.light.opacity(0.2).description);
            --color-red-translucent: \(theme.red.light.opacity(0.2).description);
            --color-yellow-translucent: \(theme.yellow.light.opacity(0.2).description);
            --color-orange-translucent: \(theme.orange.light.opacity(0.2).description);
            --color-teal-translucent: \(theme.teal.light.opacity(0.2).description);
            --color-cyan-translucent: \(theme.cyan.light.opacity(0.2).description);
            --color-pink-translucent: \(theme.pink.light.opacity(0.2).description);
            --color-brown-translucent: \(theme.brown.light.opacity(0.2).description);
            --color-black-translucent: \(theme.black.light.opacity(0.2).description);
            --color-off-black-translucent: \(theme.offBlack.light.opacity(0.2).description);
            --color-white-translucent: \(theme.white.light.opacity(0.2).description);
            --color-off-white-translucent: \(theme.offWhite.light.opacity(0.2).description);
        }

        @media (prefers-color-scheme: dark) {
            :root {
                /* Base Colors */
                --color-gray: \(theme.gray.dark.description);
                --color-blue: \(theme.blue.dark.description);
                --color-green: \(theme.green.dark.description);
                --color-purple: \(theme.purple.dark.description);
                --color-red: \(theme.red.dark.description);
                --color-yellow: \(theme.yellow.dark.description);
                --color-orange: \(theme.orange.dark.description);
                --color-teal: \(theme.teal.dark.description);
                --color-cyan: \(theme.cyan.dark.description);
                --color-pink: \(theme.pink.dark.description);
                --color-brown: \(theme.brown.dark.description);
                --color-black: \(theme.black.dark.description);
                --color-off-black: \(theme.offBlack.dark.description);
                --color-white: \(theme.white.dark.description);
                --color-off-white: \(theme.offWhite.dark.description);

                /* Text Colors */
                --text-primary: \(theme.text.primary.dark.description);
                --text-secondary: \(theme.text.secondary.dark.description);
                --text-tertiary: \(theme.text.tertiary.dark.description);
                --text-link: \(theme.text.link.dark.description);
                --text-button: \(theme.text.button.dark.description);
                --text-error: \(theme.text.error.dark.description);
                --text-success: \(theme.text.success.dark.description);
                --text-warning: \(theme.text.warning.dark.description);
                --text-disabled: \(theme.text.disabled.dark.description);

                /* Background Colors */
                --background-primary: \(theme.background.primary.dark.description);
                --background-secondary: \(theme.background.secondary.dark.description);
                --background-tertiary: \(theme.background.tertiary.dark.description);
                --background-elevated: \(theme.background.elevated.dark.description);
                --background-grouped: \(theme.background.grouped.dark.description);
                --background-selected: \(theme.background.selected.dark.description);
                --background-highlighted: \(theme.background.highlighted.dark.description);
                --background-button: \(theme.background.button.dark.description);
                --background-error: \(theme.background.error.dark.description);
                --background-success: \(theme.background.success.dark.description);
                --background-warning: \(theme.background.warning.dark.description);
                --background-info: \(theme.background.info.dark.description);

                /* Border Colors */
                --border-primary: \(theme.border.primary.dark.description);
                --border-secondary: \(theme.border.secondary.dark.description);
                --border-tertiary: \(theme.border.tertiary.dark.description);
                --border-selected: \(theme.border.selected.dark.description);
                --border-highlighted: \(theme.border.highlighted.dark.description);
                --border-button: \(theme.border.button.dark.description);
                --border-error: \(theme.border.error.dark.description);
                --border-success: \(theme.border.success.dark.description);
                --border-warning: \(theme.border.warning.dark.description);
                --border-info: \(theme.border.info.dark.description);

                /* Branding Colors */
                --branding-primary: \(theme.branding.primary.dark.description);
                --branding-secondary: \(theme.branding.secondary.dark.description);
                --branding-accent: \(theme.branding.accent.dark.description);
                --branding-primary-subtle: \(theme.branding.primarySubtle.dark.description);
                --branding-secondary-subtle: \(theme.branding.secondarySubtle.dark.description);

                /* Translucent variants for charts and overlays */
                --color-gray-translucent: \(theme.gray.dark.opacity(0.2).description);
                --color-blue-translucent: \(theme.blue.dark.opacity(0.2).description);
                --color-green-translucent: \(theme.green.dark.opacity(0.2).description);
                --color-purple-translucent: \(theme.purple.dark.opacity(0.2).description);
                --color-red-translucent: \(theme.red.dark.opacity(0.2).description);
                --color-yellow-translucent: \(theme.yellow.dark.opacity(0.2).description);
                --color-orange-translucent: \(theme.orange.dark.opacity(0.2).description);
                --color-teal-translucent: \(theme.teal.dark.opacity(0.2).description);
                --color-cyan-translucent: \(theme.cyan.dark.opacity(0.2).description);
                --color-pink-translucent: \(theme.pink.dark.opacity(0.2).description);
                --color-brown-translucent: \(theme.brown.dark.opacity(0.2).description);
                --color-black-translucent: \(theme.black.dark.opacity(0.2).description);
                --color-off-black-translucent: \(theme.offBlack.dark.opacity(0.2).description);
                --color-white-translucent: \(theme.white.dark.opacity(0.2).description);
                --color-off-white-translucent: \(theme.offWhite.dark.opacity(0.2).description);
            }
        }

        /* Utility classes using CSS variables */
        .text-primary { color: var(--text-primary); }
        .text-secondary { color: var(--text-secondary); }
        .text-tertiary { color: var(--text-tertiary); }
        .text-link { color: var(--text-link); }
        .text-error { color: var(--text-error); }
        .text-success { color: var(--text-success); }
        .text-warning { color: var(--text-warning); }

        .bg-primary { background-color: var(--background-primary); }
        .bg-secondary { background-color: var(--background-secondary); }
        .bg-tertiary { background-color: var(--background-tertiary); }
        .bg-elevated { background-color: var(--background-elevated); }
        .bg-error { background-color: var(--background-error); }
        .bg-success { background-color: var(--background-success); }
        .bg-warning { background-color: var(--background-warning); }

        .border-primary { border-color: var(--border-primary); }
        .border-secondary { border-color: var(--border-secondary); }
        .border-tertiary { border-color: var(--border-tertiary); }
        .border-error { border-color: var(--border-error); }
        .border-success { border-color: var(--border-success); }
        .border-warning { border-color: var(--border-warning); }
        """

    }
}
