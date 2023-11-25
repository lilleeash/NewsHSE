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
        guard let request = buildRequest(request) else {
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

private extension NetworkService {
    private func buildRequest(_ request: Requestable) -> URLRequest? {
        guard var urlComponents = URLComponents(string: APIEnviroment.baseURL.rawValue) else { return nil }
        urlComponents.path = "\(urlComponents.path)\(request.path)"
        urlComponents.queryItems = add(queryParams: request.queryParams)
        guard let finalURL = urlComponents.url else { return nil }
        
        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = add(body: request.body)
        urlRequest.allHTTPHeaderFields = request.headers
        return urlRequest
    }

    private func add(body: Encodable?) -> Data? {
        guard let body else { return nil }
        guard let httpBody = try? encoder.encode(body) else { return nil }
        return httpBody
    }

    private func add(queryParams: QueryParams?) -> [URLQueryItem]? {
        guard let queryParams else { return nil }
        return queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
}
