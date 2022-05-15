//
//  SheetPresentationContainerView.swift
//  SheetPresentationController
//
//  Created by Karol Piatek on 15/05/2022.
//

import UIKit

public final class SheetPresentationContainerView: UIView {
    private enum Constants {
        static let defaultScrollIndicatorHeight: CGFloat = 5
        static let defaultScrollIndicatorWidth: CGFloat = 36
        static let defaultCornerRadius: CGFloat = 48
    }

    var cornerRadius: CGFloat = Constants.defaultCornerRadius {
        didSet {
            layer.cornerRadius = cornerRadius
            topIndicatorToContainerConstraint?.constant = cornerRadius / 2
        }
    }

    var topIndicatorColor: UIColor? {
        get { topIndicator.backgroundColor }
        set { topIndicator.backgroundColor = newValue }
    }

    var topIndicatorHeight: CGFloat = Constants.defaultScrollIndicatorHeight {
        didSet {
            topIndicatorHeightConstraint?.constant = topIndicatorHeight
            topIndicator.layer.cornerRadius = topIndicatorHeight / 2
        }
    }

    var topIndicatorWidth: CGFloat = Constants.defaultScrollIndicatorWidth {
        didSet {
            topIndicatorWidthConstraint?.constant = topIndicatorWidth
        }
    }

    private var topIndicatorHeightConstraint: NSLayoutConstraint?
    private var topIndicatorWidthConstraint: NSLayoutConstraint?
    private var topIndicatorToContainerConstraint: NSLayoutConstraint?

    private let topIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = Constants.defaultScrollIndicatorHeight / 2
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

        let topIndicatorHeightConstraint = topIndicator.heightAnchor.constraint(equalToConstant: topIndicatorHeight)
        let topIndicatorWidthConstraint = topIndicator.widthAnchor.constraint(equalToConstant: topIndicatorWidth)
        self.topIndicatorHeightConstraint = topIndicatorHeightConstraint
        self.topIndicatorWidthConstraint = topIndicatorHeightConstraint

        NSLayoutConstraint.activate([
            topIndicator.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            topIndicatorWidthConstraint,
            topIndicatorHeightConstraint,
            topIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        let topIndicatorToContainerConstraint = container.topAnchor.constraint(equalTo: topIndicator.bottomAnchor, constant: cornerRadius / 2)
        self.topIndicatorToContainerConstraint = topIndicatorToContainerConstraint
        NSLayoutConstraint.activate([
            topIndicatorToContainerConstraint,
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupUI() {
        backgroundColor = .white
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = Constants.defaultCornerRadius
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
