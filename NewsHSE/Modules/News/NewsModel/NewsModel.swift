//
//  NewsModel.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 14.11.2023.
//

import Foundation

struct NewsModel: Decodable {
    let status: String
    let totalResults: Int
    var articles: [ArticleModel]
}

struct ArticleModel: Decodable {
    let source: SourceModel
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

struct SourceModel: Decodable {
    let id: String?
    let name: String
}

