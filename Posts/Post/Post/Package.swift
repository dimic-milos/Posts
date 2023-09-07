// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Post",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Post",
            targets: ["Post"]),
    ],
    targets: [
        .target(
            name: "Post"),
        .testTarget(
            name: "PostTests",
            dependencies: ["Post"]),
    ]
)
