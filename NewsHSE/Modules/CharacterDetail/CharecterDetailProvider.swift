//
//  CharecterDetailProvider.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

protocol ProvidesCharacterDetailInfo {
    func requestCharacter() async throws -> CharacterDetailDataFlow.Presentation.Responce
}

final class CharecterDetailProvider: ProvidesCharacterDetailInfo {
    private let service: NetworkServiceProtocol
    private let id: Int
    
    init(
        id: Int,
        service: NetworkServiceProtocol = NetworkService()
    ) {
        self.id = id
        self.service = service
    }
    
    func requestCharacter() async throws -> CharacterDetailDataFlow.Presentation.Responce {
        try await service.fetchNews(CharacterDetailRequest.getSingleCharacter(id: id))
    }
}
