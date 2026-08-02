//
//  Snapshot Tests.swift
//  swift-css
//

import CSS_Test_Support
import Testing

@MainActor
@Suite(
    .serialized,
    .snapshots(configuration: .init(recording: .never))
)
struct `Snapshot Tests` {}
