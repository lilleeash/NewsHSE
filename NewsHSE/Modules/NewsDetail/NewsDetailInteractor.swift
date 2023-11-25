//
//  NewsDetailInteractor.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import Foundation

protocol NewsDetailBussinessLogic {
    func requestData()
}

final class NewsDetailInteractor: NewsDetailBussinessLogic {
    private let presenter: NewsDetailPresentationLogic
    
    init(presenter: NewsDetailPresentationLogic) {
        self.presenter = presenter
    }
    
    func requestData() {}
}
