// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Testable",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Testable",
            targets: ["Testable"]
        )
    ],
    dependencies: [
        .resolver,
        .models,
        .postAPI
    ],
    targets: [
        .target(
            name: "Testable",
            dependencies: [
                .resolver,
                .models,
                .postAPI
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

// MARK: - PostAPI

extension Package.Dependency {

    static var postAPI: Package.Dependency = .package(path: "../PostAPI")
}

extension Target.Dependency {

    static var postAPI: Target.Dependency = .product(
        name: "PostAPI",
        package: "PostAPI"
    )
}
