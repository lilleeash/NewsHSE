//
//  NewsViewModel.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 14.11.2023.
//

import Foundation

struct NewsViewModel: Decodable {
    let id: Int
    let name: String
    let type: String
    let image: String
}
