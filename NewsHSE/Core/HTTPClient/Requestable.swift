//
//  Requestable.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 24.11.2023.
//

import Foundation

protocol Requestable {
    var path: String { get }
    var method: APIMethod { get }
    var body: Encodable? { get }
    var queryParams: QueryParams? { get }
    var headers: HTTPHeader? { get }
}

extension Requestable {
    var method: APIMethod { .get }
    var body: Encodable? { nil }
    var headers: HTTPHeader? { nil }
    var queryParams: QueryParams? { nil }
}
