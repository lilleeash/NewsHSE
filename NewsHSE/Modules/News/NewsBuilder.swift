//
//  NewsBuilder.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

import UIKit

final class NewsBuilder: ModuleBuilder {
    func build() -> UIViewController {
        let presenter = NewsPresenter()
        let interactor = NewsInteractor(presenter: presenter)
        let viewController = NewsViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
