//
//  NewsProvider.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 14.11.2023.
//

import Foundation

protocol ProvidesNewsInfo {
    func requestNews() async throws -> NewsModel
}

final class NewsProvider: ProvidesNewsInfo {
    private let service: NetworkServiceProtocol
    private let request: Requestable
    
    init(
        service: NetworkServiceProtocol = NetworkService(),
        request: Requestable = NewsRequest()
    ) {
        self.service = service
        self.request = request
    }
    
    func requestNews() async throws -> NewsModel {
        try await service.fetchNews(request)
    }
}
