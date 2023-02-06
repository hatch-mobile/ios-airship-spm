// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Airship",
  defaultLocalization: "en",
  platforms: [.iOS(.v11), .macOS(.v10_15), .tvOS(.v11)],
  products: [
    .library(
      name: "AirshipCore",
      targets: ["AirshipCoreTarget"]
    ),
    .library(
      name: "AirshipBasement",
      targets: ["AirshipBasementTarget"]
    ),
    .library(
      name: "AirshipAutomation",
      targets: ["AirshipAutomationTarget"]
    ),
    .library(
      name: "AirshipMessageCenter",
      targets: ["AirshipMessageCenterTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "AirshipBasementTarget",
      dependencies: [
        "AirshipBasement"
      ]
    ),
    .target(
      name: "AirshipCoreTarget",
      dependencies: [
        "AirshipBasementTarget",
        "AirshipCore"
      ]
    ),
    .target(
      name: "AirshipAutomationTarget",
      dependencies: [
        "AirshipBasementTarget",
        "AirshipAutomation"
      ]
    ),
    .target(
      name: "AirshipMessageCenterTarget",
      dependencies: [
        "AirshipBasementTarget",
        "AirshipMessageCenter"
      ]
    ),
    .binaryTarget(
      name: "AirshipBasement",
      url: "https://github.com/hatch-mobile/ios-airship-spm/releases/download/16.10.7/AirshipBasement.xcframework.zip",
      checksum: "1df6e1550c298b36865e492d5e0e6331e1375d0233ecb7d3e46fe39a760b9638"
    ),
    .binaryTarget(
      name: "AirshipCore",
      url: "https://github.com/hatch-mobile/ios-airship-spm/releases/download/16.10.7/AirshipCore.xcframework.zip",
      checksum: "ef2e3362f8b7351d94941b21d190ca8854bef2a301b9f695a804db6665baf34c"
    ),
    .binaryTarget(
      name: "AirshipMessageCenter",
      url: "https://github.com/hatch-mobile/ios-airship-spm/releases/download/16.10.7/AirshipMessageCenter.xcframework.zip",
      checksum: "606af4c47980837c8e2472268b18ee0c0d39e0f6d80f50f69e8b55d454b31005"
    ),
    .binaryTarget(
      name: "AirshipAutomation",
      url: "https://github.com/hatch-mobile/ios-airship-spm/releases/download/16.10.7/AirshipAutomation.xcframework.zip",
      checksum: "9554fcf342ecc5da2f806720c1a95957313abad3d5969374919bfa0090288663"
    )
  ]
)
