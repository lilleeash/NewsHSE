//
//  CharactersTableManager.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit

protocol CharactersTableManagerDelegate {
    func didSelectRow(_ beerModel: CharacterDetailDataFlow.Presentation.ViewModel)
}

final class CharactersTableManager: NSObject {
    var delegate: CharactersTableManagerDelegate?
    var tableData: CharactersDataFlow.Presentation.ViewModel = []
}

// MARK: - UITableViewDataSource
extension CharactersTableManager: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let newsViewModel = tableData[safe: indexPath.row],
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CharactersTableViewCell.identifier,
                for: indexPath
            ) as? CharactersTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(with: newsViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let beerModel = tableData[indexPath.row]
        delegate?.didSelectRow(beerModel)
    }
}
