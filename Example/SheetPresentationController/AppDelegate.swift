//
//  AppDelegate.swift
//  SheetPresentationController
//
//  Created by Karol Piątek on 05/15/2022.
//  Copyright (c) 2022 Karol Piątek. All rights reserved.
//

import UIKit
import SheetPresentationController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private let navigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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
        window = UIWindow()
        navigationController.setViewControllers([sheetController], animated: false)
        navigationController.navigationBar.isHidden = true

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
