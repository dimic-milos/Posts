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
        .global
    ],
    targets: [
        .target(
            name: "UI",
            dependencies: [
                .global
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
