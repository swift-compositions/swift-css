import CSS_Standard

extension ColorConvertible {

    public static func hex(_ hexColor: HexColor) -> Self {
        return .color(.hex(hexColor))
    }
}
