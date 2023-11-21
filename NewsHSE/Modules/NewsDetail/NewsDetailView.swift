//
//  NewsDetailView.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit
import Kingfisher

class NewsDetailView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 22, weight: .semibold)
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 15)
        view.textColor = .gray
        return view
    }()
     
    private lazy var contentLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemGray6
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
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        contentLabel.text = viewModel.content
        
        guard let urlToImage = viewModel.urlToImage else { return }
        imageView.kf.setImage(with: URL(string: urlToImage))
    }
}

private extension NewsDetailView {
    private func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(contentLabel)
        
        NSLayoutConstraint.autoresizingMask([
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.autoresizingMask([
            titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -4),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.autoresizingMask([
            descriptionLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentLabel.topAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.autoresizingMask([
            contentLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            contentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32)
        ])
    }
}
