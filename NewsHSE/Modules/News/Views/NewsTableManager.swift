//
//  NewsTableManager.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit

final class NewsTableManager: NSObject {
    var tableData: NewsDataFlow.Presentation.ViewModel = []
}

// MARK: - UITableViewDataSource
extension NewsTableManager: UITableViewDataSource {
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
}
