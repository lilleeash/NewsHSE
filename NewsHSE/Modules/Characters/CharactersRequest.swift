//
//  CharactersRequest.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 24.11.2023.
//

import Foundation

struct CharactersRequest: Requestable {
    typealias Responce = CharactersModel
    var path: String = "/character"
}
