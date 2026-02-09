// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AdMixerMediationAdFit",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AdMixerMediationAdFit",
            targets: ["iOS_SSP_AdFit_SPM"]),
    ],
    dependencies: [
        // AdFit SDK
        .package(
            url: "https://github.com/adfit/adfit-spm",
            "3.14.7"..<"3.18.7"
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.1.7"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationAdFitBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-AdMixerDownload/raw/main/AdMixerMediationAdFit1.0.5-beta.xcframework.zip",
            checksum: "894ed0479f943b2542848bf608773741024248ec63ebb92c1a022a384a74e66f"
        ),
        .target(
            name: "iOS_SSP_AdFit_SPM",
            dependencies: [
                "AdMixerMediationAdFitBinary",
                .product(name: "AdFitSDK", package: "adfit-spm"),
                .product(name: "AdMixerMediation", package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-AdFit-SPM"
        ),
    ]
)
