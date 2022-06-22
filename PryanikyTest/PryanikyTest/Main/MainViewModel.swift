//
//  MainViewModel.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import Foundation
import Kingfisher

final class MainViewModel {
    weak var view: MainViewInput?
    
    private let model: MainModelInput
    
    init(model: MainModelInput) {
        self.model = model
    }
    
    func makeImageResource(url: URL?) -> ImageResource? {
        if let url = url {
            return ImageResource(downloadURL: url, cacheKey: url.absoluteString)
        } else {
            return nil
        }
    }
}

extension MainViewModel: MainViewOutput {
    func viewDidLoad() {
        model.loadData()
    }
}

extension MainViewModel: MainModelOutput {
    func didLoadData(model: PurpleData) {
        let resource = makeImageResource(url: URL(string: model.data[1].data.url ?? ""))
        let modelForView = MainModelToView(labelString: model.data[0].data.text ?? "",
                                           picture: resource,
                                           variants: model.data[2].data.variants ?? [])
        view?.updateViewWithModel(model: modelForView)
    }
}
