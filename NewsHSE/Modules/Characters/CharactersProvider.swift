//
//  CharactersProvider.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 14.11.2023.
//

import Foundation

protocol ProvidesCharactersInfo {
    func requestNews() async throws -> CharactersModel
}

final class CharactersProvider: ProvidesCharactersInfo {
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
    }
    
    func requestNews() async throws -> CharactersModel {
        try await service.fetchNews(CharactersRequest.getCharacters)
    }
}
