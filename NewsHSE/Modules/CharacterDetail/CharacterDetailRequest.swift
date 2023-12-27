//
//  CharacterDetailRequest.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

enum CharacterDetailRequest: Requestable {
    case getSingleCharacter(id: Int)
    
    var endPoint: EndPointable {
        switch self {
        case .getSingleCharacter(let id):
            return CharacterDetailEndPoint(id: id)
        }
    }
}

struct CharacterDetailEndPoint: EndPointable {
    var path: String
    
    init(id: Int) {
        self.path = "/character/\(id)"
    }
}
