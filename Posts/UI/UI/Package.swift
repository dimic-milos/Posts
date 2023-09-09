// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UI",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "UI",
            targets: ["UI"]
        )
    ],
    dependencies: [
        .global,
        .assets
    ],
    targets: [
        .target(
            name: "UI",
            dependencies: [
                .global,
                .assets
            ]
        )
    ]
)

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

// MARK: - Asset

extension Package.Dependency {

    static var assets: Package.Dependency = .package(path: "../Assets")
}

extension Target.Dependency {

    static var assets: Target.Dependency = .product(
        name: "Assets",
        package: "Assets"
    )
}
