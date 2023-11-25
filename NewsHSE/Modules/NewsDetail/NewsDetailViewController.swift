//
//  NewsDetailViewController.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit

protocol NewsDetailDisplayLogic: AnyObject {
    func displayNewsDetail(data: NewsDetailDataFlow.Presentation.ViewModel)
}

final class NewsDetailViewController: UIViewController, NewsDetailDisplayLogic {
    
    lazy var contentView: DisplaysNewsView = {
        let view = NewsDetailView()
        return view
    }()
    
    private let interactor: NewsDetailBussinessLogic
    
    init(interactor: NewsDetailBussinessLogic) {
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
    
    func displayNewsDetail(data: NewsDetailDataFlow.Presentation.ViewModel) {
        contentView.configure(with: data)
    }
}
