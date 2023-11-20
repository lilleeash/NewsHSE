//
//  NewsDetailViewController.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit

protocol NewsDetailDisplayLogic: AnyObject {
    func displayNewsDetail()
}

final class NewsDetailViewController: UIViewController, NewsDetailDisplayLogic {
    
    let data: NewsDetailDataFlow.Presentation.ViewModel
    
    lazy var contentView: NewsDetailView = {
        let view = NewsDetailView()
        return view
    }()
    
    init(data: NewsDetailDataFlow.Presentation.ViewModel) {
        self.data = data
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
        displayNewsDetail()
    }
    
    func displayNewsDetail() {
        contentView.configure(with: data)
    }
}
