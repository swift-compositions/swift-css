// swift-tools-version: 6.4

import PackageDescription

extension String {
    static let css: Self = "CSS"
    static let cssTheming: Self = "CSS Theming"
    var tests: Self { self + " Tests" }
}

extension Target.Dependency {
    static var css: Self { .target(name: .css) }
    static var cssTheming: Self { .target(name: .cssTheming) }
}

extension Target.Dependency {
    static var cssStandard: Self {
        .product(name: "CSS Standard", package: "swift-css-standard")
    }
    static var cssHTMLRendering: Self {
        .product(name: "CSS HTML Rendering", package: "swift-css-html-render")
    }
    static var cssHTMLLayoutRendering: Self {
        .product(name: "CSS HTML Layout Rendering", package: "swift-css-html-layout-render")
    }
    static var htmlRendering: Self {
        .product(name: "HTML Rendering", package: "swift-html-render")
    }
}

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
        .library(name: .css, targets: [.css]),
        .library(name: .cssTheming, targets: [.cssTheming]),
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
            name: .css,
            dependencies: [
                .cssHTMLRendering,
                .cssHTMLLayoutRendering,
                .htmlRendering,
                .cssStandard,
            ]
        ),
        .target(
            name: .cssTheming,
            dependencies: [
                .css,
                .htmlRendering,
                .cssStandard,
            ]
        ),
        .target(
            name: "CSS Theming Foundation Integration",
            dependencies: [
                .cssTheming
            ]
        ),
        .target(
            name: "CSS Test Support",
            dependencies: [
                .css,
                .cssTheming,
                .product(name: "HTML Rendering Core Test Support", package: "swift-html-render"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: .css.tests,
            dependencies: [
                .css,
                .cssTheming,
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
