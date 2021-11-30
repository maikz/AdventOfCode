// swift-tools-version:5.5


import PackageDescription

let package = Package(
    name: "AdventOfCode",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "AdventOfCode", targets: ["AdventOfCode"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.5.0"),
    ],
    targets: [
        .executableTarget(
            name: "AdventOfCode",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            path: "Sources"
        ),
    ]
)
