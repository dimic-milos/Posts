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
        .models,
        .global
    ],
    targets: [
        .target(
            name: "PostAPI",
            dependencies: [
                .models,
                .global
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

// MARK: - Global

extension Package.Dependency {

    static var global: Package.Dependency = .package(path: "../Global")
}

extension Target.Dependency {

    static var global: Target.Dependency = .product(
        name: "Global",
        package: "Global"
    )
}
