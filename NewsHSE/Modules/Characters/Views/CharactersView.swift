//
//  CharactersView.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

import UIKit

protocol CharactersViewTableViewDelegate {
    func didSelectRow(_ newsModel: CharacterDetailDataFlow.Presentation.ViewModel)
}

final class CharactersView: UIView {
    
    private enum Constants {
        static let padding = CGFloat(8)
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = tableManager
        table.delegate = tableManager
        table.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
        return table
    }()
    
    private lazy var tableManager = CharactersTableManager()
    var delegate: CharactersViewTableViewDelegate?
    
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
    
    func configure(with viewModel: CharactersDataFlow.Presentation.ViewModel) {
        tableManager.tableData = viewModel
        tableView.reloadData()
    }
}

extension CharactersView: CharactersTableManagerDelegate {
    func didSelectRow(_ beerModel: CharacterDetailDataFlow.Presentation.ViewModel) {
        delegate?.didSelectRow(beerModel)
    }
}

private extension CharactersView {
    private func addSubviews() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.autoresizingMask([
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: Constants.padding),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.padding),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
}
