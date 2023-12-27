//
//  CharactersModel.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 14.11.2023.
//

import Foundation

// MARK: - Product
struct CharactersModel: Decodable, Equatable {
    let results: [Character]

    struct Character: Decodable, Equatable {
        let id: Int
        let name: String
        let type: String
        let image: String
    }
}
