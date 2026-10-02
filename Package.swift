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
        .package(url: "https://github.com/swift-atoms/swift-memory.git", branch: "main", traits: ["Lock", "Map", "Shared", "Cursor"]),
        .package(url: "https://github.com/swift-molecules/swift-memory-allocation.git", branch: "main", traits: ["MemoryAllocatorArena", "MemoryInline", "MemorySmall"]),
        .package(url: "https://github.com/swift-atoms/swift-storage.git", branch: "main", traits: ["Generational", "Memory"]),
        .package(url: "https://github.com/swift-atoms/swift-ascii.git", branch: "main", traits: ["Coder", "Parser", "Serializer"]),
        .package(url: "https://github.com/swift-atoms/swift-coder.git", branch: "main", traits: ["Carrier", "Map"]),
        .package(url: "https://github.com/swift-atoms/swift-ratio.git", branch: "main", traits: ["Bit", "Ordinal", "Difference"]),
        .package(url: "https://github.com/swift-atoms/swift-span.git", branch: "main", traits: ["Iterator", "Byte"]),
        .package(url: "https://github.com/swift-atoms/swift-finite.git", branch: "main", traits: ["Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-point.git", branch: "main", traits: ["Affine", "Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-displacement.git", branch: "main", traits: ["Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-affine.git", branch: "main", traits: ["Tagged", "Vector"]),
        .package(url: "https://github.com/swift-atoms/swift-binary.git", branch: "main", traits: ["Serializer"]),
        .package(url: "https://github.com/swift-atoms/swift-collection.git", branch: "main", traits: ["Repetition", "Search"]),
        .package(url: "https://github.com/swift-atoms/swift-coordinate.git", branch: "main", traits: ["Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-cyclic.git", branch: "main", traits: ["Index", "Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-difference.git", branch: "main", traits: ["Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-formatter.git", branch: "main", traits: ["Conversions", "Number", "Radix", "Tagged"]),
        .package(url: "https://github.com/swift-atoms/swift-geometry.git", branch: "main", traits: ["Affine"]),
        .package(url: "https://github.com/swift-atoms/swift-iterator.git", branch: "main", traits: ["Repetition", "Search"]),
        .package(url: "https://github.com/swift-atoms/swift-parser.git", branch: "main", traits: ["Always", "Append", "Choice", "Either", "Iterator", "IteratorLeaves", "Map", "Optic", "Pair", "Predicate", "Product", "Repetition", "Skip"]),
        .package(url: "https://github.com/swift-atoms/swift-predicate.git", branch: "main", traits: ["Always"]),
        .package(url: "https://github.com/swift-atoms/swift-renderer.git", branch: "main", traits: ["Document"]),
        .package(url: "https://github.com/swift-atoms/swift-serializer.git", branch: "main", traits: ["Always", "Byte", "Either", "Map", "Optic", "Pair", "Repetition"]),
        .package(url: "https://github.com/swift-atoms/swift-text.git", branch: "main", traits: ["Byte", "Casing"]),
        .package(url: "https://github.com/swift-atoms/swift-time.git", branch: "main", traits: ["Affine"]),
        .package(url: "https://github.com/swift-atoms/swift-translation.git", branch: "main", traits: ["Affine"]),
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
