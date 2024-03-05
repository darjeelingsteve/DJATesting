// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DJATesting",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "DJATesting", type: .dynamic, targets: ["DJATesting"])
    ],
    dependencies: [],
    targets: [
        .target(name: "DJATesting_ObjC", path: "Sources/DJATesting/ObjC", publicHeadersPath: "."),
        .target(name: "DJATesting", dependencies: ["DJATesting_ObjC"], exclude: ["ObjC"])
    ],
    swiftLanguageVersions: [.v5]
)
