// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-css",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "CSS", targets: ["CSS"]),
        .library(name: "CSS Theming", targets: ["CSS Theming"]),
        .library(
            name: "CSS Theming Foundation Integration",
            targets: ["CSS Theming Foundation Integration"]
        ),
        .library(name: "CSS Test Support", targets: ["CSS Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-compositions/swift-css-html-render.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-compositions/swift-css-html-layout-render.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-compositions/swift-html-render.git", branch: "main"),
        .package(url: "https://github.com/swift-standards/swift-css-standard.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "CSS",
            dependencies: [
                .product(name: "CSS HTML Rendering", package: "swift-css-html-render"),
                .product(name: "CSS HTML Layout Rendering", package: "swift-css-html-layout-render"),
                .product(name: "HTML Rendering", package: "swift-html-render"),
                .product(name: "CSS Standard", package: "swift-css-standard"),
            ]
        ),
        .target(
            name: "CSS Theming",
            dependencies: [
                .target(name: "CSS"),
                .product(name: "HTML Rendering", package: "swift-html-render"),
                .product(name: "CSS Standard", package: "swift-css-standard"),
            ]
        ),
        .target(
            name: "CSS Theming Foundation Integration",
            dependencies: [
                .target(name: "CSS Theming")
            ]
        ),
        .target(
            name: "CSS Test Support",
            dependencies: [
                .target(name: "CSS"),
                .target(name: "CSS Theming"),
                .product(name: "HTML Rendering Core Test Support", package: "swift-html-render"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "CSS Tests",
            dependencies: [
                .target(name: "CSS"),
                .target(name: "CSS Theming"),
            ],
            path: "Tests/CSS Tests"
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
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
