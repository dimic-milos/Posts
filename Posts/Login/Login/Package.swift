// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Login",
    products: [
        .library(
            name: "Login",
            targets: ["Login"]),
    ],
    targets: [
        .target(
            name: "Login"),
        .testTarget(
            name: "LoginTests",
            dependencies: ["Login"]),
    ]
)
