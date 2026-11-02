// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AdMixerMediationAdFit",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AdMixerMediationAdFit",
            targets: ["iOS_SSP_AdFit_SPM"]),
    ],
    dependencies: [
        // AdFit SDK — 3.18.6 부터 iOS 15.0 요구. adfit-spm 매니페스트는 .iOS(.v13) 을 선언하지만 바이너리 MinimumOSVersion 이 15.0 이라
        // 이 패키지의 platforms 를 .v15 로 올려 iOS 14 앱이 해석 단계에서 걸러지게 한다. 하한 3.18.6 = iOS 15 SDK 첫 버전(어댑터 2.0.1 부터 버전별 API 를 셀렉터로 분기), 상한은 검증 버전(3.22.7)의 마이너 바로 위
        .package(
            url: "https://github.com/adfit/adfit-spm",
            "3.18.6"..<"3.23.0"
        ),
        // SSP AdMixerMediation SDK — 2.0.0 부터 배너 onImpressionBanner(2.6.0 심볼) 호출
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.6.1"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationAdFitBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-AdFit-SPM/releases/download/2.0.0/AdMixerMediationAdFit2.0.0.xcframework.zip",
            checksum: "a9ad024f9e966a0503a021ef5ad927fed7af37f1ddbc44890035f9a8f1ba401b"
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
