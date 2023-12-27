//
//  ModuleBuilder.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//

import UIKit

protocol ModuleBuilder {
    associatedtype Context
    associatedtype ViewController
    
    func build(with context: Context) -> ViewController
}
