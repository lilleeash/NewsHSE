//
//  CharacterDetailBuilder.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import UIKit

final class CharacterDetailBuilder: ModuleBuilder {
    func build(with context: Int) -> CharacterDetailViewController {
        let provider = CharecterDetailProvider(id: context)
        let presenter = CharacterDetailPresenter()
        let interactor = CharacterDetailInteractor(presenter: presenter, provider: provider)
        let viewController = CharacterDetailViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
