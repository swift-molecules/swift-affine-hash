// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-affine-hash",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Affine Hash",
            targets: ["Affine Hash"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-affine",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-cardinal",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-hash",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ordinal",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Affine Hash",
            dependencies: [
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Hash", package: "swift-hash"),
            ]
        ),
        .testTarget(
            name: "Affine Hash Tests",
            dependencies: [
                "Affine Hash",
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Hash", package: "swift-hash"),
                .product(name: "Ordinal", package: "swift-ordinal"),
            ]
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

    let package: [SwiftSetting] = [
        .define(
            "SYNCHRONIZATION_AVAILABLE",
            .when(platforms: [.macOS, .iOS, .tvOS, .watchOS, .visionOS, .linux, .windows])
        )
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
