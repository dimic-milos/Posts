// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Testable",
    products: [
        .library(
            name: "Testable",
            targets: ["Testable"]),
    ],
    targets: [
        .target(
            name: "Testable"),
    ]
)
