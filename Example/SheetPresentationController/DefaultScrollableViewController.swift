//
//  DefaultScrollableViewController.swift
//  SheetPresentationController_Example
//
//  Created by Karol Piatek on 15/05/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import SheetPresentationController

final class DefaultScrollableViewController: UIViewController {
    private let exampleTitles: [Int] = (0...30).map { $0 }

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = true
        tableView.backgroundColor = .white
        tableView.backgroundView?.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tableView.reloadData()
    }
}

// MARK: UITableViewDataSource
extension DefaultScrollableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exampleTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = exampleTitles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") ?? UITableViewCell()
        cell.textLabel?.text = "\(title)"
        return cell
    }
}

// MARK: ScrollableViewController
extension DefaultScrollableViewController: ScrollableViewController {
    var scrollView: UIScrollView? {
        tableView
    }
}

// MARK: - Private
private extension DefaultScrollableViewController {
    func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
}
