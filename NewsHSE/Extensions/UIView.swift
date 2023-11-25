//
//  UIView.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import UIKit

extension UIView {
    @discardableResult
    func autolayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
