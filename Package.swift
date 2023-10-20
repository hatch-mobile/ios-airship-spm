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
      name: "AirshipAutomationTarget",
      dependencies: [
        "AirshipBasementTarget",
        "AirshipAutomation"
      ]
    ),
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
      name: "AirshipMessageCenterTarget",
      dependencies: [
        "AirshipBasementTarget",
        "AirshipMessageCenter"
      ]
    ),
    .binaryTarget(
      name: "AirshipAutomation",
      url: "https://github.com/hatch-mobile/ios-airship-spm/releases/download/17.5.1/AirshipAutomation.xcframework.zip",
      checksum: "c6cadaf5a0a5ba247b4db306689b5b5eff91006256a0bca074909b763059424d"
    ),
    .binaryTarget(
      name: "AirshipBasement",
      url: "https://github.com/hatch-mobile/ios-airship-spm/releases/download/17.5.1/AirshipBasement.xcframework.zip",
      checksum: "88595bcb5b230536e0a2fb8dc407ef7e1df9515d466ac65b48d94a2f8867c929"
    ),
    .binaryTarget(
      name: "AirshipCore",
      url: "https://github.com/hatch-mobile/ios-airship-spm/releases/download/17.5.1/AirshipCore.xcframework.zip",
      checksum: "348c2ddf06cebd76b22cf9b6bce578828858491f58feabd7144a67d2e78f6e0d"
    ),
    .binaryTarget(
      name: "AirshipMessageCenter",
      url: "https://github.com/hatch-mobile/ios-airship-spm/releases/download/17.5.1/AirshipMessageCenter.xcframework.zip",
      checksum: "434f2e4cd91d8445c2d7bbb895e6bf8651be8f590b98c4c5aa5a935fbe5d45c1"
    )
  ]
)
