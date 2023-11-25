//
//  NewsDetailView.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit
import Kingfisher

protocol DisplaysNewsView: UIView {
    func configure(with viewModel: NewsDetailDataFlow.Presentation.ViewModel)
}

final class NewsDetailView: UIView, DisplaysNewsView {
    private enum Constants {
        static let imageHeight = CGFloat(250)
        static let padding = CGFloat(16)
        static let descriptionTopPadding = CGFloat(4)
        static let contentLabelTopPadding = CGFloat(32)
    }
    
    private var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 22, weight: .semibold)
        return view
    }()
    
    private var descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 15)
        view.textColor = .gray
        return view
    }()
     
    private var contentLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    
    private var imageView: UIImageView = {
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
        [
            titleLabel,
            descriptionLabel,
            contentLabel,
            contentLabel,
            imageView
        ].forEach {
            self.addSubview($0)
            $0.autolayout()
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            imageView.leftAnchor
                .constraint(equalTo: leftAnchor),
            imageView.trailingAnchor
                .constraint(equalTo: trailingAnchor),
            imageView.topAnchor
                .constraint(equalTo: topAnchor),
            imageView.bottomAnchor
                .constraint(equalTo: titleLabel.topAnchor, constant: -Constants.padding),
            imageView.heightAnchor
                .constraint(equalToConstant: Constants.imageHeight)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor
                .constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: Constants.padding),
            titleLabel.trailingAnchor
                .constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.padding),
            titleLabel.topAnchor
                .constraint(equalTo: imageView.bottomAnchor, constant: Constants.padding),
            titleLabel.bottomAnchor
                .constraint(equalTo: descriptionLabel.topAnchor, constant: -Constants.descriptionTopPadding),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor
                .constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: Constants.padding),
            descriptionLabel.trailingAnchor
                .constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.padding),
            descriptionLabel.topAnchor
                .constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.descriptionTopPadding),
            descriptionLabel.bottomAnchor
                .constraint(equalTo: contentLabel.topAnchor, constant: -Constants.contentLabelTopPadding)
        ])
        
        NSLayoutConstraint.activate([
            contentLabel.leftAnchor
                .constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: Constants.padding),
            contentLabel.trailingAnchor
                .constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.padding),
            contentLabel.topAnchor
                .constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.contentLabelTopPadding)
        ])
    }
}
