// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Login",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Login",
            targets: ["Login"]
        )
    ],
    dependencies: [
        .resolver,
        .loginAPI
    ],
    targets: [
        .target(
            name: "Login",
            dependencies: [
                .resolver,
                .loginAPI
            ]
        )
        ,
        .testTarget(
            name: "LoginTests",
            dependencies: ["Login"]
        )
    ]
)

// MARK: - Resolver

extension Package.Dependency {

    static var resolver: Package.Dependency = .package(
        url: "https://github.com/hmlongco/Resolver.git",
        from: "1.1.2"
    )
}

extension Target.Dependency {

    static var resolver: Target.Dependency = .product(
        name: "Resolver",
        package: "Resolver"
    )
}


// MARK: - LoginAPI

extension Package.Dependency {

    static var loginAPI: Package.Dependency = .package(path: "../LoginAPI")
}

extension Target.Dependency {

    static var loginAPI: Target.Dependency = .product(
        name: "LoginAPI",
        package: "LoginAPI"
    )
}
