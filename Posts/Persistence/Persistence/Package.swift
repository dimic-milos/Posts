// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Persistence",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Persistence",
            targets: ["Persistence"]
        )
    ],
    dependencies: [
        .resolver,
        .models
    ],
    targets: [
        .target(
            name: "Persistence",
            dependencies: [
                .resolver,
                .models
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
