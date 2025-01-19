// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "swift-extras",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(name: "SwiftExtras", targets: ["SwiftExtras"])
    ],
    targets: [
        .target(name: "SwiftExtras")
    ]
)
