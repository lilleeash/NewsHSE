//
//  CharactersTableViewCell.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import UIKit
import Kingfisher

final class CharactersTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private enum Constants {
        static let horizontalPadding = CGFloat(8)
        static let verticalPadding = CGFloat(16)
        static let imageSize = CGFloat(50)
        static let spacing = CGFloat(8)
        static let cornerRadius = CGFloat(10)
    }
    
    private let newsImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray6
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = Constants.cornerRadius
        view.clipsToBounds = true
        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.spacing = Constants.spacing
        view.axis = .vertical
        view.alignment = .leading
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with item: CharacterViewModel) {
        titleLabel.text = item.name
        descriptionLabel.text = item.type
        newsImageView.kf.setImage(with: URL(string: item.image))
    }
}

private extension CharactersTableViewCell {
    
    private func addSubviews() {
        [stack, newsImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        [titleLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }
        
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor
                .constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            newsImageView.trailingAnchor
                .constraint(equalTo: stack.leadingAnchor, constant: -Constants.horizontalPadding),
            newsImageView.widthAnchor
                .constraint(equalToConstant: Constants.imageSize),
            newsImageView.heightAnchor
                .constraint(equalToConstant: Constants.imageSize),
            newsImageView.centerYAnchor
                .constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor
                .constraint(equalTo: newsImageView.trailingAnchor, constant: Constants.horizontalPadding),
            stack.trailingAnchor
                .constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            stack.bottomAnchor
                .constraint(equalTo: contentView.bottomAnchor, constant: -Constants.verticalPadding),
            stack.topAnchor
                .constraint(equalTo: contentView.topAnchor, constant: Constants.verticalPadding)
        ])
    }
}

