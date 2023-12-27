//
//  CharacterDetailInteractor.swift
//  NewsHSE
//
//  Created by Darya Zhitova on 25.11.2023.
//

import Foundation

protocol CharacterDetailBussinessLogic {
    func requestData()
}

final class CharacterDetailInteractor: CharacterDetailBussinessLogic {
    private let presenter: CharacterDetailPresentationLogic
    private let provider: ProvidesCharacterDetailInfo
    
    init(presenter: CharacterDetailPresentationLogic, provider: ProvidesCharacterDetailInfo) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func requestData() {
        Task {
            do {
                let fetchCharacter = try await provider.requestCharacter()
                DispatchQueue.main.async {
                    self.presenter.presentData(data: fetchCharacter)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
