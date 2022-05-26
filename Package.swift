// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SheetPresentationController",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SheetPresentationController",
            targets: ["SheetPresentationController"]
        ),
    ],
    targets: [
        .target(
            name: "SheetPresentationController",
            dependencies: []
        ),
        .testTarget(
            name: "SheetPresentationControllerTests",
            dependencies: ["SheetPresentationController"]
        ),
    ]
)
