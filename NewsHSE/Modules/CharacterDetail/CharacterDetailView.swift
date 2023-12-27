//
//  CharacterDetailView.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit
import Kingfisher

protocol DisplaysCharacterView: UIView {
    func configure(with viewModel: CharacterDetailDataFlow.Presentation.ViewModel)
}

final class CharacterDetailView: UIView {
    private enum Constants {
        static let imageSize = CGFloat(250)
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
    
    private var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DisplaysCharacterView
extension CharacterDetailView: DisplaysCharacterView {
    func configure(with viewModel: CharacterDetailDataFlow.Presentation.ViewModel) {
        titleLabel.text = viewModel.name
        descriptionLabel.text = viewModel.type
        imageView.kf.setImage(with: URL(string: viewModel.image))
    }
}

// MARK: - private extension
private extension CharacterDetailView {
    private func addSubviews() {
        [
            titleLabel,
            descriptionLabel,
            imageView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor
                .constraint(equalToConstant: Constants.imageSize),
            imageView.widthAnchor
                .constraint(equalToConstant: Constants.imageSize),
            imageView.centerXAnchor
                .constraint(equalTo: centerXAnchor),
            imageView.topAnchor
                .constraint(equalTo: topAnchor, constant: Constants.padding),
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
                .constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.descriptionTopPadding)
        ])
    }
}
