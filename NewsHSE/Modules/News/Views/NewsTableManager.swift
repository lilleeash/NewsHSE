//
//  NewsTableManager.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit

protocol NewsTableManagerDelegate {
    func didSelectRow(_ beerModel: NewsDetailDataFlow.Presentation.ViewModel)
}

final class NewsTableManager: NSObject {
    var delegate: NewsTableManagerDelegate?
    var tableData: NewsDataFlow.Presentation.ViewModel = []
}

// MARK: - UITableViewDataSource
extension NewsTableManager: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let newsViewModel = tableData[safe: indexPath.row],
            let cell = tableView.dequeueReusableCell(
                withIdentifier: NewsTableViewCell.identifier,
                for: indexPath
            ) as? NewsTableViewCell
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
