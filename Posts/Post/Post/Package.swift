// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Post",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Post",
            targets: ["Post"]),
    ],
    dependencies: [
        .flowStacks,
        .resolver,
        .global,
        .ui,
        .network,
        .persistence,
        .models,
        .assets,
        .postAPI,
        .testable
    ],
    targets: [
        .target(
            name: "Post",
            dependencies: [
                .flowStacks,
                .resolver,
                .global,
                .ui,
                .network,
                .persistence,
                .models,
                .assets,
                .postAPI
            ]
        ),
        .testTarget(
            name: "PostTests",
            dependencies: [
                "Post",
                .testable
            ]
        )
    ]
)

// MARK: - FlowStacks

extension Package.Dependency {

    static var flowStacks: Package.Dependency = .package(
        url: "https://github.com/johnpatrickmorgan/FlowStacks.git",
        exact: "0.3.4"
    )
}

extension Target.Dependency {

    static var flowStacks: Target.Dependency = .product(
        name: "FlowStacks",
        package: "FlowStacks"
    )
}


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

// MARK: - UI

extension Package.Dependency {

    static var ui: Package.Dependency = .package(path: "../UI")
}

extension Target.Dependency {

    static var ui: Target.Dependency = .product(
        name: "UI",
        package: "UI"
    )
}

// MARK: - Network

extension Package.Dependency {

    static var network: Package.Dependency = .package(path: "../Network")
}

extension Target.Dependency {

    static var network: Target.Dependency = .product(
        name: "Network",
        package: "Network"
    )
}

// MARK: - Persistence

extension Package.Dependency {

    static var persistence: Package.Dependency = .package(path: "../Persistence")
}

extension Target.Dependency {

    static var persistence: Target.Dependency = .product(
        name: "Persistence",
        package: "Persistence"
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

// MARK: - Testable

extension Package.Dependency {

    static var testable: Package.Dependency = .package(path: "../Testable")
}

extension Target.Dependency {

    static var testable: Target.Dependency = .product(
        name: "Testable",
        package: "Testable"
    )
}
