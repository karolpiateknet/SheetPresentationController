//
//  TitleViewController.swift
//  SheetPresentationController_Example
//
//  Created by Karol Piatek on 15/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

final class TitleViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "backgroundViewController"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.addSubview(titleLabel)
        view.backgroundColor = .blue
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
