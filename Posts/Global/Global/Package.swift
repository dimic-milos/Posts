// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Global",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Global",
            targets: ["Global"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Global",
            dependencies: [
            ]
        )
    ]
)
