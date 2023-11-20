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
    
    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
    }
    
    func requestNews() async throws -> NewsModel {
        try await service.fetchNews()
    }
}
