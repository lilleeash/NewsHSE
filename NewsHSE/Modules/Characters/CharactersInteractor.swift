//
//  CharactersInteractor.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 11.11.2023.
//
import Foundation

protocol CharactersBuissenesLogic {
    func requestData()
}

final class CharactersInteractor: CharactersBuissenesLogic {
    
    private let presenter: CharactersPresentationLogic
    private let provider: ProvidesCharactersInfo
    
    init(presenter: CharactersPresentationLogic, provider: ProvidesCharactersInfo) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func requestData() {
        Task {
            do {
                let fetchedNews = try await provider.requestNews()
                
                DispatchQueue.main.async {
                    self.presenter.presentData(fetchedNews)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
