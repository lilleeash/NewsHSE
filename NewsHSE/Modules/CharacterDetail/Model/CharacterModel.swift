//
//  CharacterModel.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import Foundation

struct CharacterModel: Decodable {
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
