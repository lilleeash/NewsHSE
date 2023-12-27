//
//  CharacterDetailPresenter.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import Foundation

protocol CharacterDetailPresentationLogic {
    func presentData(data: CharacterDetailDataFlow.Presentation.Responce)
}

final class CharacterDetailPresenter: CharacterDetailPresentationLogic {
    weak var viewController: CharacterDetailDisplayLogic?
    
    func presentData(data: CharacterDetailDataFlow.Presentation.Responce) {
        let viewModel = CharacterViewModel(id: data.id, name: data.name, type: data.type, image: data.image)
        
        self.viewController?.displayNewsDetail(data: viewModel)
    }
}
