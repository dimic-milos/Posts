// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginAPI",
    products: [
        .library(
            name: "LoginAPI",
            targets: ["LoginAPI"]),
    ],
    targets: [
        .target(name: "LoginAPI")
    ]
)