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
    
    lazy var contentView: DisplaysCharactersView = {
        let view = CharactersView()
        view.delegate = self
        return view
    }()
    
    private let interactor: CharactersBuissenesLogic
    
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
        interactor.requestData()
    }
    
    func displayNews(_ viewModel: CharactersDataFlow.Presentation.ViewModel) {
        contentView.configure(with: viewModel)
    }
}

// MARK: - CharactersViewDelegate
extension CharactersViewController: CharactersViewDelegate {
    func didSelectRow(_ newsModel: CharacterDetailDataFlow.Presentation.ViewModel) {
        let vc = CharacterDetailBuilder().build(with: newsModel.id)
        present(vc, animated: true)
    }
}

