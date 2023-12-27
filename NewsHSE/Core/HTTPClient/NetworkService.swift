//
//  NetworkService.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchNews<Responce: Decodable>(_ request: Requestable) async throws -> Responce
}

final class NetworkService: NetworkServiceProtocol {
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    init() {
        self.decoder = JSONDecoder()
        self.encoder = JSONEncoder()
        self.session = URLSession.shared
    }
    
    func fetchNews<Responce: Decodable>(_ request: Requestable) async throws -> Responce {
        guard let request = request.buildRequest() else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await session.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
            throw URLError(URLError.Code(rawValue: httpResponse.statusCode))
        }
        
        let fetchedData = try decoder.decode(Responce.self, from: data)
        return fetchedData
    }
}
