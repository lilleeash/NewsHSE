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
        let viewModel = data.articles.map {
            NewsViewModel(
                author: $0.author,
                title: $0.title,
                description: $0.description,
                url: $0.url,
                urlToImage: $0.urlToImage,
                publishedAt: $0.publishedAt,
                content: $0.content,
                sourceName: $0.source.name
            )
        }
        
        self.viewController?.displayNews(viewModel)
    }
}
