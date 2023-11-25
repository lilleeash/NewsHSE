//
//  NewsInteractor.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//
import Foundation

protocol NewsBuissenesLogic {
    func requestData() async throws
}

final class NewsInteractor: NewsBuissenesLogic {
    
    private let presenter: NewsPresentationLogic
    private let provider: ProvidesNewsInfo
    
    init(presenter: NewsPresentationLogic, provider: ProvidesNewsInfo) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func requestData() async throws {
        do {
            let fetchedNews = try await provider.requestNews()
            DispatchQueue.main.async {
                self.presenter.presentData(data: fetchedNews)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
