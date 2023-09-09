// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PostAPI",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "PostAPI",
            targets: ["PostAPI"]
        )
    ],
    dependencies: [
        .models
    ],
    targets: [
        .target(
            name: "PostAPI",
            dependencies: [
                .models
            ]
        )
    ]
)

// MARK: - Model

extension Package.Dependency {

    static var models: Package.Dependency = .package(path: "../Models")
}

extension Target.Dependency {

    static var models: Target.Dependency = .product(
        name: "Models",
        package: "Models"
    )
}
