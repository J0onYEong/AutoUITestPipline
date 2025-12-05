import ProjectDescription

let project = Project(
    name: "Junios",
    targets: [
        .target(
            name: "Junios",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.Junios",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "Junios/Sources",
                "Junios/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "JuniosTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.JuniosTests",
            infoPlist: .default,
            buildableFolders: [
                "Junios/Tests"
            ],
            dependencies: [.target(name: "Junios")]
        ),
    ]
)
