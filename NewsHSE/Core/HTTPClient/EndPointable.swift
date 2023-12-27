//
//  EndPointable.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 26.11.2023.
//

import Foundation

protocol EndPointable {
    var path: String { get }
    var queryParams: QueryParams? { get }
}

extension EndPointable {
    
    var queryParams: QueryParams? { nil }
    
    func getURL() -> URL? {
        guard var urlComponents = URLComponents(string: APIEnviroment.baseURL.rawValue) else { return nil }
        urlComponents.path = "\(urlComponents.path)\(path)"
        urlComponents.queryItems = add(queryParams: queryParams)
        guard let finalURL = urlComponents.url else { return nil }
        return finalURL
    }
    
    private func add(queryParams: QueryParams?) -> [URLQueryItem]? {
        guard let queryParams else { return nil }
        return queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
}
