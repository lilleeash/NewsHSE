//
//  NewsDetailPresenter.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import Foundation

protocol NewsDetailPresentationLogic {
    func presentData(data: NewsDataFlow.Presentation.Responce)
}

final class NewsDetailPresenter: NewsDetailPresentationLogic {
    weak var viewController: NewsDetailDisplayLogic?
    
    func presentData(data: NewsDataFlow.Presentation.Responce) {}
}
