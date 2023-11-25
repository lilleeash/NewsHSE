//
//  NewsPresenter.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

protocol NewsPresentationLogic {
    func presentData(data: NewsDataFlow.Presentation.Responce)
}

final class NewsPresenter: NewsPresentationLogic {
    
    weak var viewController: NewsDisplayLogic?
    
    func presentData(data: NewsDataFlow.Presentation.Responce) {
        let viewModel = data.results.map {
            NewsViewModel(id: $0.id, name: $0.name, type: $0.type, image: $0.image)
        }
        
        self.viewController?.displayNews(viewModel)
    }
}
