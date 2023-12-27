//
//  Array+Subscript.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 20.11.2023.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        index < self.count ? self[index] : nil
    }
}
