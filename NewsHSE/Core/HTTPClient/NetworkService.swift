//
//  NetworkService.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchNews() async throws -> NewsModel
}

final class NetworkService: NetworkServiceProtocol {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
        self.session = session
    }
    
    func fetchNews() async throws -> NewsModel {
        guard let request = buildRequest(path: "/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=371307829f17416d9c883ff9c37fbdaa") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await session.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
            throw URLError(URLError.Code(rawValue: httpResponse.statusCode))
        }
        
        let fetchedData = try decoder.decode(NewsModel.self, from: data)
        return fetchedData
    }
}

private extension NetworkService {
    private func buildRequest(path: String, method: APIMethod = .get) -> URLRequest? {
        guard let finalURL = URL(string: APIEnviroment.baseURL.rawValue + path) else { return nil }
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        return request
    }
}
