//
//  CharactersViewController.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 07.11.2023.
//

import UIKit

protocol CharactersDisplayLogic: AnyObject {
    func displayNews(_ viewModel: CharactersDataFlow.Presentation.ViewModel)
}

final class CharactersViewController: UIViewController, CharactersDisplayLogic {
    
    lazy var contentView: CharactersView = {
        let view = CharactersView()
        view.delegate = self
        return view
    }()
    
    let interactor: CharactersBuissenesLogic
    
    init(interactor: CharactersBuissenesLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        Task {
            try await interactor.requestData()
        }
    }
    
    func displayNews(_ viewModel: CharactersDataFlow.Presentation.ViewModel) {
        contentView.configure(with: viewModel)
    }
}

extension CharactersViewController: CharactersViewTableViewDelegate {
    func didSelectRow(_ newsModel: CharacterDetailDataFlow.Presentation.ViewModel) {
        let vc = CharacterDetailBuilder().build()
        present(vc, animated: true)
    }
}

