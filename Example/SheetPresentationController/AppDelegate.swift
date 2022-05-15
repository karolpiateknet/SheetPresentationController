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
        let sheetController = SheetPresentationController(
            backgroundViewController: TitleViewController(),
            sheetContentViewController: DefaultScrollableViewController(),
            initialDetent: .small,
            detents: [.large, .small]
        )
        window = UIWindow()
        navigationController.setViewControllers([sheetController], animated: false)
        navigationController.navigationBar.isHidden = true

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
