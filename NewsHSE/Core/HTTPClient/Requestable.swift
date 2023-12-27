//
//  Requestable.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 24.11.2023.
//

import Foundation

protocol Requestable {
    var endPoint: EndPointable { get }
    var method: APIMethod { get }
    var body: Encodable? { get }
    var headers: HTTPHeader? { get }
}

extension Requestable {
    var method: APIMethod { .get }
    var body: Encodable? { nil }
    var headers: HTTPHeader? { nil }
    var encoder: JSONEncoder { JSONEncoder() }
    
    func buildRequest() -> URLRequest? {
        guard let url = endPoint.getURL() else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = add(body: body)
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }

    private func add(body: Encodable?) -> Data? {
        guard let body else { return nil }
        guard let httpBody = try? encoder.encode(body) else { return nil }
        return httpBody
    }
}
