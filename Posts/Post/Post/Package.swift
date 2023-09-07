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
        .postAPI
    ],
    targets: [
        .target(
            name: "Post",
            dependencies: [
                .flowStacks,
                .resolver,
                .global,
                .ui,
                .postAPI
            ]
        ),
        .testTarget(
            name: "PostTests",
            dependencies: ["Post"]
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
