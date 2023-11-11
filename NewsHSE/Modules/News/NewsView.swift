//
//  NewsView.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

import UIKit

final class NewsView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("BeersUIView couldn`t init")
    }
}
