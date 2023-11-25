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
    private let request: Requestable
    
    init(
        service: NetworkServiceProtocol = NetworkService(),
        request: Requestable = CharactersRequest()
    ) {
        self.service = service
        self.request = request
    }
    
    func requestNews() async throws -> CharactersModel {
        try await service.fetchNews(request)
    }
}
