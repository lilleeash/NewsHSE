//
//  CharactersModel.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 14.11.2023.
//

import Foundation

// MARK: - Product
struct CharactersModel: Decodable {
    let info: Info
    let results: [Character]
    
    struct Info: Decodable {
        let count, pages: Int
        let next: String
        let prev: String?
    }

    struct Character: Decodable {
        let id: Int
        let name: String
        let status: String
        let species: String
        let type: String
        let gender: String
        let origin: Location
        let location: Location
        let image: String
        let episode: [String]
        let url: String
        let created: String
        
        struct Location: Decodable {
            let name: String
            let url: String
        }
    }
}
