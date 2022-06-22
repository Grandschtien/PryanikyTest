//
//  MainViewModel.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import Foundation

final class MainViewModel {
    weak var view: MainViewInput?
    
    private let model: MainModelInput
    
    init(model: MainModelInput) {
        self.model = model
    }
    
}

extension MainViewModel: MainViewOutput {
    func viewDidLoad() {
        model.loadData()
    }
}

extension MainViewModel: MainModelOutput {
    func didLoadData(model: PurpleData) {
        view?.updateViewWithModel(model: model)
    }
}
