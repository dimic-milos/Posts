// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Posts",
    products: [
        .library(
            name: "Posts",
            targets: ["Posts"]),
    ],
    targets: [
        .target(
            name: "Posts"),
        .testTarget(
            name: "PostsTests",
            dependencies: ["Posts"]),
    ]
)
