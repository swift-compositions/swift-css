public import CSS_Standard

public enum Side: Sendable, Hashable {
    case top(LengthPercentage)
    case bottom(LengthPercentage)
    case left(LengthPercentage)
    case right(LengthPercentage)
}
