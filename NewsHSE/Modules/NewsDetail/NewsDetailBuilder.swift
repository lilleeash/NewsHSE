//
//  NewsDetailBuilder.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import UIKit

final class NewsDetailBuilder: ModuleBuilder {
    func build() -> UIViewController {
        let presenter = NewsDetailPresenter()
        let interactor = NewsDetailInteractor(presenter: presenter)
        let viewController = NewsDetailViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
