// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PostsAPI",
    products: [
        .library(
            name: "PostsAPI",
            targets: ["PostsAPI"]),
    ],
    targets: [
        .target(name: "PostsAPI"),
    ]
)