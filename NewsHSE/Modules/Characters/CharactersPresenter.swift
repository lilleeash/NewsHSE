//
//  CharactersPresenter.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

protocol CharactersPresentationLogic {
    func presentData(data: CharactersDataFlow.Presentation.Responce)
}

final class CharactersPresenter: CharactersPresentationLogic {
    
    weak var viewController: CharactersDisplayLogic?
    
    func presentData(data: CharactersDataFlow.Presentation.Responce) {
        let viewModel = data.results.map {
            CharactersViewModel(id: $0.id, name: $0.name, type: $0.type, image: $0.image)
        }
        
        self.viewController?.displayNews(viewModel)
    }
}
