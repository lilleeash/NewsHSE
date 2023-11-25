//
//  NewsRequest.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 24.11.2023.
//

import Foundation

struct NewsRequest: Requestable {
    typealias Responce = NewsModel
    var path: String = "/v2/everything"
    var queryParams: QueryParams? = [
        "domains": "techcrunch.com,thenextweb.com",
        "apiKey": "371307829f17416d9c883ff9c37fbdaa"
    ]
}
