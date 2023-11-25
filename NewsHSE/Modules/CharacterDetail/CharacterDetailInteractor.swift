//
//  CharacterDetailInteractor.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import Foundation

protocol CharacterDetailBussinessLogic {
    func requestData()
}

final class CharacterDetailInteractor: CharacterDetailBussinessLogic {
    private let presenter: CharacterDetailPresentationLogic
    
    init(presenter: CharacterDetailPresentationLogic) {
        self.presenter = presenter
    }
    
    func requestData() {}
}
