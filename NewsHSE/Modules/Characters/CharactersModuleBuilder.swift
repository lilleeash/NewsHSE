//
//  CharactersBuilder.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

import UIKit

final class CharactersModuleBuilder: ModuleBuilder {
    func build(with _: Void) -> CharactersViewController {
        let provider = CharactersProvider()
        let presenter = CharactersPresenter()
        let interactor = CharactersInteractor(presenter: presenter, provider: provider)
        let viewController = CharactersViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
