//
//  Border.Side.swift
//  swift-css
//
//  The sides a border configuration applies to.
//

extension Border {
    public enum Side: String, Hashable, Sendable, CaseIterable {
        case top, left, right, bottom
    }
}

extension Border.Side {
    public static let all: [Self] = allCases
}
