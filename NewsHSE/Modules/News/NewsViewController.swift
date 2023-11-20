//
//  ViewController.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 07.11.2023.
//

import UIKit

protocol NewsDisplayLogic: AnyObject {
    func displayNews(_ viewModel: NewsDataFlow.Presentation.ViewModel)
}

final class NewsViewController: UIViewController, NewsDisplayLogic {
    
    lazy var contentView: NewsView = {
        let view = NewsView()
        view.delegate = self
        return view
    }()
    
    let interactor: NewsBuissenesLogic
    
    init(interactor: NewsBuissenesLogic) {
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
        
        Task {
            try await interactor.requestData()
        }
    }
    
    func displayNews(_ viewModel: NewsDataFlow.Presentation.ViewModel) {
        contentView.configure(with: viewModel)
    }
}

extension NewsViewController: NewsTableViewDelegate {
    func didSelectRow(_ newsModel: NewsDetailDataFlow.Presentation.ViewModel) {
        let vc = NewsDetailViewController(data: newsModel)
        present(vc, animated: true)
    }
}

