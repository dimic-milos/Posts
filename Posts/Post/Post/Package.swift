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
        .resolver,
        .postAPI
    ],
    targets: [
        .target(
            name: "Post",
            dependencies: [
                .resolver,
                .postAPI
            ]
        ),
        .testTarget(
            name: "PostTests",
            dependencies: ["Post"]
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

// MARK: - PostAPI

extension Package.Dependency {

    static var postAPI: Package.Dependency = .package(
        url: "https://github.com/hmlongco/PostAPI.git",
        from: "1.5.0"
    )
}

extension Target.Dependency {

    static var postAPI: Target.Dependency = .product(
        name: "PostAPI",
        package: "PostAPI"
    )
}
