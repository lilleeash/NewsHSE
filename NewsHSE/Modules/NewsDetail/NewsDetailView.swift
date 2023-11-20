//
//  NewsDetailView.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit

class NewsDetailView: UIView {
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private lazy var titleView: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var descriptionView: UILabel = {
        let view = UILabel()
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: NewsDetailDataFlow.Presentation.ViewModel) {
        titleView.text = viewModel.title
        descriptionView.text = viewModel.description
    }
}

private extension NewsDetailView {
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(descriptionView)
        
        NSLayoutConstraint.autoresizingMask([
            stackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
}
