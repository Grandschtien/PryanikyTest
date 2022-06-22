//
//  MainAssembly.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import UIKit

final class MainAssembly {
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assemble() -> MainAssembly {
        let networkManager = NetworkManager()
        let model = MainModel(networkManager: networkManager)
        let viewModel = MainViewModel(model: model)
        let viewController = MainViewController(viewModel: viewModel)

        viewModel.view = viewController
        model.output = viewModel

        return MainAssembly(viewController: viewController)
    }
}
