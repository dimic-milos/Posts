// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Global",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Global",
            targets: ["Global"]
        ),
    ],
    dependencies: [
        .flowStacks
    ],
    targets: [
        .target(
            name: "Global",
            dependencies: [
                .flowStacks
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
