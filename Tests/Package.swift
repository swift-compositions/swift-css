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
        .package(
            url: "https://github.com/swift-foundations/swift-html-render.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-standards/swift-html-standard.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "CSS Tests Support",
            dependencies: [
                .product(name: "CSS", package: "swift-css"),
                .product(name: "CSS Theming", package: "swift-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "HTML Rendering Core Test Support", package: "swift-html-render"),
                .product(name: "HTML Standard Test Support", package: "swift-html-standard"),
            ],
            path: "Support"
        ),
        .testTarget(
            name: "CSS Performance Tests",
            dependencies: [
                "CSS Tests Support",
                .product(name: "Testing", package: "swift-testing"),
            ],
            path: "CSS Performance Tests"
        ),
        .testTarget(
            name: "CSS Snapshot Tests",
            dependencies: [
                "CSS Tests Support",
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
