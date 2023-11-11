//
//  NewsInteractor.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

protocol NewsBuissenesLogic {
    func requestData()
}

final class NewsInteractor: NewsBuissenesLogic {
    
    private let presenter: NewsPresentationLogic
    
    init(presenter: NewsPresentationLogic) {
        self.presenter = presenter
    }
    
    func requestData() {
        
    }
}
