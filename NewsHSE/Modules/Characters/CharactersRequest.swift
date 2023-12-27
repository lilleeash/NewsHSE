//
//  CharactersRequest.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 24.11.2023.
//

import Foundation

enum CharactersRequest: Requestable {
    case getCharacters
    
    var endPoint: EndPointable {
        switch self {
        case .getCharacters:
            return CharactersEndPoint()
        }
    }
}

struct CharactersEndPoint: EndPointable {
    var path: String = "/character"
}
