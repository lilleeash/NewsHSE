//
//  NewsPresenter.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

protocol NewsPresentationLogic {
    func presentData()
}

final class NewsPresenter: NewsPresentationLogic {
    
    weak var viewController: NewsDisplayLogic?
    
    func presentData() {
        
    }
}
