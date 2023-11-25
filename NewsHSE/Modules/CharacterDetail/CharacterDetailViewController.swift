//
//  CharactersDetailViewController.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit

protocol CharacterDetailDisplayLogic: AnyObject {
    func displayNewsDetail(data: CharacterDetailDataFlow.Presentation.ViewModel)
}

final class CharacterDetailViewController: UIViewController, CharacterDetailDisplayLogic {
    
    lazy var contentView: DisplaysCharacterView = {
        let view = CharacterDetailView()
        return view
    }()
    
    private let interactor: CharacterDetailBussinessLogic
    
    init(interactor: CharacterDetailBussinessLogic) {
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
    }
    
    func displayNewsDetail(data: CharacterDetailDataFlow.Presentation.ViewModel) {
        contentView.configure(with: data)
    }
}
