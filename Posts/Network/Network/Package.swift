// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Network",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Network",
            targets: ["Network"]),
    ],
    dependencies: [
        .resolver
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: [
                .resolver
            ]
        )
    ]
)

// MARK: - Resolver

extension Package.Dependency {

    static var resolver: Package.Dependency = .package(
        url: "https://github.com/hmlongco/Resolver.git",
        from: "1.5.0"
    )
}

extension Target.Dependency {

    static var resolver: Target.Dependency = .product(
        name: "Resolver",
        package: "Resolver"
    )
}
