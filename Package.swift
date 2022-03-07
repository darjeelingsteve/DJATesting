// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DJATesting",
    platforms: [
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v2)
    ],
    products: [
        .library(name: "DJATesting", type: .dynamic, targets: ["DJATesting"])
    ],
    dependencies: [],
    targets: [
        .target(name: "DJATesting_ObjC", path: "Sources/DJATesting/ObjC"),
        .target(name: "DJATesting", dependencies: ["DJATesting_ObjC"], exclude: ["ObjC"])
    ],
    swiftLanguageVersions: [.v5]
)
