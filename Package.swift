// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGoogleSignIn",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v6)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GoogleSignIn",
            targets: ["SwiftGoogleSignIn"]),
    ],
    dependencies: [
         // Dependencies declare other packages that this package depends on.
        .package(
            name: "GTMSessionFetcher",
            url: "https://github.com/google/gtm-session-fetcher.git",
            "1.4.0" ..< "2.0.0"
        ),
        .package(
            name: "GTMAppAuth",
            url: "git@github.com:sugarpac/GTMAppAuth.git",
            .branch("master")
        ),
        .package(
            name: "AppAuth",
            url: "https://github.com/openid/AppAuth-iOS.git",
            "1.4.0" ..< "2.0.0"
        )
    ],
    targets: [
//         Targets are the basic building blocks of a package. A target can define a module or a test suite.
//         Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftGoogleSignIn",
            dependencies: [
                .target(name: "GoogleSignInWrapper", condition: .when(platforms: .some([.iOS]))),
            ],
            resources: [
                .process("Sources/GoogleSignInWrapper")
            ]),
        .target(
            name: "GoogleSignInWrapper",
            dependencies: [
                .product(name: "GTMSessionFetcherCore", package: "GTMSessionFetcher"),
                .product(name: "AppAuthCore", package: "AppAuth"),
                .product(name: "GTMAppAuth", package: "GTMAppAuth"),
                .target(name: "GoogleSignInBinary", condition: .when(platforms: .some([.iOS])))
            ]),
        .testTarget(
            name: "GoogleSignInTests",
            dependencies: ["SwiftGoogleSignIn"]),
        .binaryTarget(
            name: "GoogleSignInBinary",
            path: "artifacts/GoogleSignIn.xcframework"
        )
    ]
)
