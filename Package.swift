// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "swift-extras",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "SwiftExtras", targets: ["SwiftExtras"])
    ],
    targets: [
        .target(name: "SwiftExtras")
    ]
)
