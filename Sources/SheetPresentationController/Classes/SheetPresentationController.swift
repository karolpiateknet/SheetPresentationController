//
//  SheetPresentationController.swift
//  SheetPresentationController
//
//  Created by Karol Piatek on 15/05/2022.
//

import UIKit

/// ViewController with scrollView.
public protocol ScrollableViewController: UIViewController {
    var scrollView: UIScrollView? { get }
}

/// Class for showing view controller with bottom sheet.
public final class SheetPresentationController: UIViewController {
    /// The preferred status bar style for the view controller.
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        backgroundViewController.preferredStatusBarStyle
    }

    public let controller: SheetPresentationBehaviourController

    private let backgroundViewController: UIViewController

    private let sheetContentViewController: ScrollableViewController

    public init(
        backgroundViewController: UIViewController,
        sheetContentViewController: ScrollableViewController,
        sheetPresentationBehaviourController: SheetPresentationBehaviourController
    ) {
        self.backgroundViewController = backgroundViewController
        self.sheetContentViewController = sheetContentViewController
        controller = sheetPresentationBehaviourController
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private
private extension SheetPresentationController {
    func setupView() {
        addChild(backgroundViewController)
        addChild(sheetContentViewController)
        view.addSubview(backgroundViewController.view)
        NSLayoutConstraint.activate([
            backgroundViewController.view.topAnchor.constraint(equalTo: backgroundViewController.view.superview!.topAnchor),
            backgroundViewController.view.leadingAnchor.constraint(equalTo: backgroundViewController.view.superview!.leadingAnchor),
            backgroundViewController.view.trailingAnchor.constraint(equalTo: backgroundViewController.view.superview!.trailingAnchor),
            backgroundViewController.view.bottomAnchor.constraint(equalTo: backgroundViewController.view.superview!.bottomAnchor)
        ])
        controller.prepareForUsage(
            rootView: view,
            bottomSheetContent: sheetContentViewController.view,
            scrollView: sheetContentViewController.scrollView
        )
        backgroundViewController.didMove(toParent: self)
        sheetContentViewController.didMove(toParent: self)
    }
}
