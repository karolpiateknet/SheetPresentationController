# SheetPresentationController

[![CI Status](https://img.shields.io/travis/karolpiateknet/SheetPresentationController.svg?style=flat)](https://travis-ci.org/karolpiateknet/SheetPresentationController)
[![Version](https://img.shields.io/cocoapods/v/SheetPresentationController.svg?style=flat)](https://cocoapods.org/pods/SheetPresentationController)
[![License](https://img.shields.io/cocoapods/l/SheetPresentationController.svg?style=flat)](https://cocoapods.org/pods/SheetPresentationController)
[![Platform](https://img.shields.io/cocoapods/p/SheetPresentationController.svg?style=flat)](https://cocoapods.org/pods/SheetPresentationController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
let sheetPresentationBehaviourController = SheetPresentationBehaviourController(
    initialDetent: .defaultSmall,
    detents: [
        .defaultSmall,
        .defaultMedium,
        SheetPresentationBehaviourController.Detent(screenCoveragePercentage: 0.9, isScrollable: true)
    ]
)
sheetPresentationBehaviourController.bottomSheet.topIndicatorHeight = 10
sheetPresentationBehaviourController.bottomSheet.topIndicatorWidth = 40
sheetPresentationBehaviourController.bottomSheet.cornerRadius = 20
sheetPresentationBehaviourController.bottomSheet.topIndicatorColor = .red
let sheetController = SheetPresentationController(
    backgroundViewController: TitleViewController(),
    sheetContentViewController: DefaultScrollableViewController(),
    sheetPresentationBehaviourController: sheetPresentationBehaviourController
)
```

https://user-images.githubusercontent.com/57398986/168480140-6ef3e155-ea1f-4c10-a3ce-bcad3d63a5fe.mov

## Requirements

## Installation

SheetPresentationController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SheetPresentationController'
```

## Author

Karol Piątek, https://github.com/karolpiateknet

## License

SheetPresentationController is available under the MIT license. See the LICENSE file for more info.
