//
//  CharacterDetailBuilder.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import UIKit

final class CharacterDetailBuilder: ModuleBuilder {
    func build() -> UIViewController {
        let presenter = CharacterDetailPresenter()
        let interactor = CharacterDetailInteractor(presenter: presenter)
        let viewController = CharacterDetailViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
