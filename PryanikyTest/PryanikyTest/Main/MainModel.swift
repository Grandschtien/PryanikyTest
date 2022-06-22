//
//  MainModel.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import Foundation

final class MainModel {
    weak var output: MainModelOutput?
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension MainModel: MainModelInput {
    func loadData() {
        Task {
            do {
                let data = try await networkManager.loadDataFromNetwork(urlString: networkManager.url)
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(PurpleData.self, from: data)
                output?.didLoadData(model: decoded)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
