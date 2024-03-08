//
//  RocketPresenter.swift
//  StoreD
//
//  Created by Andrew on 05.03.2024.
//

import UIKit

protocol RocketPresenterDelegate {
    func loadView()
} 

class RocketPresenter {

    private let networkManager = NetworkManager()

    weak var view: RocketViewController?

}

extension RocketPresenter: RocketPresenterDelegate {

    func loadView() {
        Task {
            await getRockets()
        }
    }

}

// сделать модель в которую будет мапиться DTO
private extension RocketPresenter {
    private func getRockets() async -> [RocketDTO] {
        do {
            let rockets = try await networkManager.getRockets()
            await view?.updateStruct(models: rockets)
            return rockets
        } catch {
            return []
        }
    }
}
