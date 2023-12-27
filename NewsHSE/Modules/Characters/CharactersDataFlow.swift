//
//  CharacterDataFlow.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 14.11.2023.
//

enum CharactersDataFlow {
    enum Presentation {
        typealias Responce = CharactersModel
        typealias ViewModel = [CharacterViewModel]
    }
    
    enum ErrorType: Error {
        case noInternet
        case other
    }
}
