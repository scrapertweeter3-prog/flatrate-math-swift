// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "FlatrateMath",
    products: [
        .library(name: "FlatrateMath", targets: ["FlatrateMath"])
    ],
    targets: [
        .target(name: "FlatrateMath")
    ]
)
