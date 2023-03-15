<figure style="background-color:#3c8dbc; text-align: center;
        display: block;">
    <img src="https://accswift.bentray.work/assets/images/accSwift_logo.png" height="80"
         alt="AccSwift Logo">
</figure>

!["Flutter Version Badge"](https://img.shields.io/badge/Flutter-%3E%3D2.8.1-blue)

## Pre-requesitis

It is highly suggested to use the following tools and methods to build and run this project.

| Name     | Description                                  |
| -------- | -------------------------------------------- |
| Flutter  | Version >= 2.8.1                             |
| Dart SDK | Version >= 2.12.0                            |
| VSCode   | IDE or Text editor                           |
| FVM      | Flutter Version Management                   |
| Spider   | Generate assets dart code from assets folder |

## Project Setup

Make sure you have FVM installed in your system. Follow [this link](https://fvm.app/) for complete guide on FVM setup.

Set flutter version to 2.8.1

```bash
fvm use 2.8.1
```

Now that flutter version is set properly, we can move on.

We need to generate resource classes using [spider](https://pub.dev/packages/spider). You can install **spider** using pub in your system and then build resources folders.

```bash
pub global activate spider # Install spider globally
spider build # Build resources class
```

## Important Links
