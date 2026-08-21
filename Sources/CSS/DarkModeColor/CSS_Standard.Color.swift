public import CSS_Standard

extension CSS_Standard.Color {

    public func opacity(_ alpha: Double) -> CSS_Standard.Color {
        switch self {
        case .color(let color):
            return .color(color.opacity(alpha))

        case .global:
            return self
        }
    }

    public func darker(by percent: Double = 0.2) -> CSS_Standard.Color {
        switch self {
        case .color(let color):
            return .color(color.darker(by: percent))

        case .global:
            return self
        }
    }

    public func lighter(by percent: Double = 0.2) -> CSS_Standard.Color {
        switch self {
        case .color(let color):
            return .color(color.lighter(by: percent))

        case .global:
            return self
        }
    }

    public func adjustBrightness(by percent: Double) -> CSS_Standard.Color {
        switch self {
        case .color(let color):
            return .color(color.adjustBrightness(by: percent))

        case .global:
            return self
        }
    }
}
