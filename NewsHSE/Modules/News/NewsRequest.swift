//
//  NewsRequest.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 24.11.2023.
//

import Foundation

struct NewsRequest: Requestable {
    typealias Responce = NewsModel
    var path: String = "/character"
}
