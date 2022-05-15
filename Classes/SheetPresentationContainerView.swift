//
//  SheetPresentationContainerView.swift
//  SheetPresentationController
//
//  Created by Karol Piatek on 15/05/2022.
//

import UIKit

public final class SheetPresentationContainerView: UIView {
    private enum Constants {
        static let scrollIndicatorHeight: CGFloat = 5
        static let cornerRadius: CGFloat = 48
    }

    public var topIndicatorColor: UIColor? {
        get { topIndicator.backgroundColor }
        set { topIndicator.backgroundColor = newValue }
    }

    private let topIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = Constants.scrollIndicatorHeight / 2
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(frame: .zero)
        setupView()
        setupUI()
    }

    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(with view: UIView) {
        container.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: container.topAnchor),
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
}

// MARK: - Private
private extension SheetPresentationContainerView {
    func setupView() {
        addSubview(topIndicator)
        addSubview(container)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topIndicator.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            topIndicator.widthAnchor.constraint(equalToConstant: 36),
            topIndicator.heightAnchor.constraint(equalToConstant: Constants.scrollIndicatorHeight),
            topIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topIndicator.bottomAnchor, constant: 24),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupUI() {
        backgroundColor = .white
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = Constants.cornerRadius
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
