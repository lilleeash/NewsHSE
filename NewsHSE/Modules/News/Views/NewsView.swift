//
//  NewsView.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

import UIKit

protocol NewsTableViewDelegate {
    func didSelectRow(_ newsModel: NewsDetailDataFlow.Presentation.ViewModel)
}

final class NewsView: UIView {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = tableManager
        table.delegate = tableManager
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return table
    }()
    
    private lazy var tableManager = NewsTableManager()
    var delegate: NewsTableViewDelegate?
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        addSubviews()
        setUpConstraints()
        tableManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("BeersUIView couldn`t init")
    }
    
    func configure(with viewModel: NewsDataFlow.Presentation.ViewModel) {
        tableManager.tableData = viewModel
        tableView.reloadData()
    }
}

extension NewsView: NewsTableManagerDelegate {
    func didSelectRow(_ beerModel: NewsDetailDataFlow.Presentation.ViewModel) {
        delegate?.didSelectRow(beerModel)
    }
}

private extension NewsView {
    private func addSubviews() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.autoresizingMask([
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
}
