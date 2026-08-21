extension DarkModeColor.Theme {
    public static var `default`: Self {
        .init(
            gray: .gray500,
            blue: .blue500,
            green: .green500,
            purple: .purple500,
            red: .red500,
            yellow: .yellow500,
            orange: .orange500,
            teal: .teal500,
            cyan: .cyan500,
            pink: .pink500,
            brown: .brown500,
            black: .init(light: .hex("121212"), dark: .hex("121212")),
            offBlack: .init(light: .hex("171717"), dark: .hex("171717")),
            white: .init(light: .hex("fff"), dark: .hex("fff")),
            offWhite: .init(light: .hex("fafafa"), dark: .hex("fafafa")),
            neutral: .gray500,
            info: .blue500,
            text: .default,
            background: .default,
            border: .default,
            branding: .default
        )
    }
}

extension DarkModeColor.Theme.Text {
    static var `default`: Self {
        .init(
            primary: .init(light: .hex("000000"), dark: .hex("FFFFFF")),
            secondary: .init(light: .hex("3C3C43").opacity(0.6), dark: .hex("EBEBF5").opacity(0.6)),
            tertiary: .init(light: .hex("3C3C43").opacity(0.3), dark: .hex("EBEBF5").opacity(0.3)),
            link: .init(light: .hex("0066cc"), dark: .hex("4d94ff")),
            linkHover: .init(light: .hex("0066cc").opacity(0.8), dark: .hex("4d94ff").opacity(0.8)),
            button: .init(light: .hex("000000"), dark: .hex("FFFFFF")),
            error: .init(light: .hex("CA0900"), dark: .hex("ED2239")),
            success: .init(light: .hex("34C759"), dark: .hex("30D158")),
            warning: .init(light: .hex("FFBA00"), dark: .hex("FFC502")),
            info: .init(light: .hex("0066cc"), dark: .hex("4d94ff")),
            neutral: .init(light: .hex("3C3C43").opacity(0.6), dark: .hex("EBEBF5").opacity(0.6)),
            inverted: .init(light: .hex("FFFFFF"), dark: .hex("000000")),
            disabled: .init(light: .hex("3C3C43").opacity(0.2), dark: .hex("EBEBF5").opacity(0.2))
        )
    }
}

extension DarkModeColor.Theme.Background {
    public static var `default`: Self {
        .init(
            primary: .init(light: .hex("FFFFFF"), dark: .hex("121212")),
            secondary: .init(light: .hex("F2F2F7"), dark: .hex("1C1C1E")),
            tertiary: .init(light: .hex("EBEBEB"), dark: .hex("2C2C2E")),
            elevated: .init(light: .hex("FFFFFF"), dark: .hex("1C1C1E")),
            grouped: .init(light: .hex("F2F2F7"), dark: .hex("1C1C1E")),
            selected: .init(light: .hex("DCDCDC"), dark: .hex("3A3A3C")),
            highlighted: .init(
                light: .hex("E5E5EA").opacity(0.6),
                dark: .hex("3A3A3C").opacity(0.6)
            ),
            button: .init(light: .hex("e5e7eb"), dark: .hex("374151")),
            buttonHover: .init(light: .hex("d1d5db"), dark: .hex("4b5563")),
            error: .init(light: .hex("FFC0C0"), dark: .hex("863432")),
            errorMuted: .init(light: .hex("EFDCDC"), dark: .hex("402E2B")),
            success: .init(light: .hex("dcfce7"), dark: .hex("14532d")),
            successMuted: .init(
                light: .hex("dcfce7").opacity(0.5),
                dark: .hex("14532d").opacity(0.5)
            ),
            warning: .init(light: .hex("FFEAAD"), dark: .hex("8F7723")),
            warningMuted: .init(light: .hex("EFE9D6"), dark: .hex("413B29")),
            info: .init(light: .hex("dbeafe"), dark: .hex("1e3a8a")),
            infoMuted: .init(light: .hex("dbeafe").opacity(0.5), dark: .hex("1e3a8a").opacity(0.5)),
            neutral: .init(light: .hex("F2F2F7"), dark: .hex("1C1C1E"))
        )
    }
}

extension DarkModeColor.Theme.Border {
    public static var `default`: Self {
        .init(
            primary: .init(light: .hex("FFFFFF"), dark: .hex("121212")),
            secondary: .init(light: .hex("F2F2F7"), dark: .hex("1C1C1E")),
            tertiary: .init(light: .hex("EBEBEB"), dark: .hex("2C2C2E")),
            selected: .init(light: .hex("DCDCDC"), dark: .hex("3A3A3C")),
            highlighted: .init(
                light: .hex("E5E5EA").opacity(0.6),
                dark: .hex("3A3A3C").opacity(0.6)
            ),
            hover: .init(light: .hex("DCDCDC").opacity(0.8), dark: .hex("3A3A3C").opacity(0.8)),
            button: .init(light: .hex("e5e7eb"), dark: .hex("374151")),
            error: .init(light: .hex("E31315"), dark: .hex("E21415")),
            success: .init(light: .hex("dcfce7"), dark: .hex("14532d")),
            warning: .init(light: .hex("FEC300"), dark: .hex("FEC300")),
            info: .init(light: .hex("dbeafe"), dark: .hex("1e3a8a")),
            infoMuted: .init(light: .hex("dbeafe").opacity(0.5), dark: .hex("1e3a8a").opacity(0.5)),
            neutral: .init(light: .hex("F2F2F7"), dark: .hex("1C1C1E"))
        )
    }
}

extension DarkModeColor.Theme.Branding {
    public static var `default`: Self {
        .init(
            primary: .init(light: .hex("0066cc"), dark: .hex("4d94ff")),
            secondary: .init(light: .hex("5856D6"), dark: .hex("5E5CE6")),
            accent: .init(light: .hex("FF9500"), dark: .hex("FF9F0A")),
            primarySubtle: .init(
                light: .hex("007AFF").opacity(0.2),
                dark: .hex("0A84FF").opacity(0.2)
            ),
            secondarySubtle: .init(
                light: .hex("5856D6").opacity(0.2),
                dark: .hex("5E5CE6").opacity(0.2)
            )
        )
    }
}
