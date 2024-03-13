//
//  RocketPresenter.swift
//  StoreD
//
//  Created by Andrew on 05.03.2024.
//

import UIKit

protocol RocketPresenterDelegate {
    func updateData(model: RocketDTO)
}

class RocketPresenter {

    weak var view: RocketViewControllerDelegate?

}

extension RocketPresenter: RocketPresenterDelegate {
    func updateData(model: RocketDTO) {
        view?.updateStruct(model: model)
    }
}
