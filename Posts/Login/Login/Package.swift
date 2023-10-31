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
        .global,
        .ui,
        .assets,
        .loginAPI,
        .testable
    ],
    targets: [
        .target(
            name: "Login",
            dependencies: [
                .resolver,
                .global,
                .ui,
                .assets,
                .loginAPI
            ]
        )
        ,
        .testTarget(
            name: "LoginTests",
            dependencies: [
                "Login",
                .testable
            ]
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
