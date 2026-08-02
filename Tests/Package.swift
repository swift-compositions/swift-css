// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "testing",
    platforms: [
        .macOS(.v26)
    ],
    dependencies: [
        .package(path: ".."),
        .package(url: "https://github.com/swift-foundations/swift-testing.git", branch: "main"),
    ],
    targets: [
        .testTarget(
            name: "CSS Performance Tests",
            dependencies: [
                .product(name: "CSS Test Support", package: "swift-css"),
                .product(name: "Testing", package: "swift-testing"),
            ],
            path: "CSS Performance Tests"
        ),
        .testTarget(
            name: "CSS Snapshot Tests",
            dependencies: [
                .product(name: "CSS Test Support", package: "swift-css"),
                .product(name: "Testing", package: "swift-testing"),
            ],
            path: "CSS Snapshot Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem
}
