// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GherkinParser",
    products: [
        .library(
            name: "GherkinParser",
            targets: [
                "Gherkin"
            ]
        ),
        .library(
            name: "AstGenerator",
            targets: [
                "AstGenerator"
            ]
        ),
        .library(
            name: "TokensGenerator",
            targets: [
                "TokensGenerator"
            ]
        )
    ],
    targets: [
        .target(
            name: "Gherkin",
            resources: [
                .process("GherkinLanguages/gherkin-languages.json")
            ]
        ),
        .target(
            name: "AstGenerator",
            dependencies: [
                .target(name: "Gherkin")
            ]
        ),
        .target(
            name: "TokensGenerator",
            dependencies: [
                .target(name: "Gherkin"),
                .target(name: "AstGenerator")
            ]
        ),
        .executableTarget(
            name: "AstGeneratorCommand",
            dependencies: [
                "Gherkin",
                "AstGenerator"
            ]
        ),
        .executableTarget(
            name: "TokensGeneratorCommand",
            dependencies: [
                "Gherkin",
                "TokensGenerator"
            ]
        ),
        .testTarget(
            name: "GherkinParserTests",
            dependencies: [
                "Gherkin",
                "AstGenerator",
                "TokensGenerator"
            ]
        ),
    ]
)
