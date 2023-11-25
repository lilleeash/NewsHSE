//
//  CharacterDetailPresenter.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import Foundation

protocol CharacterDetailPresentationLogic {
    func presentData(data: CharactersDataFlow.Presentation.Responce)
}

final class CharacterDetailPresenter: CharacterDetailPresentationLogic {
    weak var viewController: CharacterDetailDisplayLogic?
    
    func presentData(data: CharactersDataFlow.Presentation.Responce) {}
}
