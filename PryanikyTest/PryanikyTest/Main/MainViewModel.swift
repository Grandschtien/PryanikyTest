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
        let labelString = LabelString(name: model.data[0].name, string: model.data[0].data.text ?? "")
        let picture = Picture(name: model.data[1].name, picture: resource)
        let variants = Variants(name: model.data[2].name,
                                variants: model.data[2].data.variants ?? [],
                                selectionId: model.data[2].data.selectedID ?? 0)
        let modelForView = MainModelToView(labelString: labelString,
                                           picture: picture,
                                           variants: variants)
        view?.updateViewWithModel(model: modelForView)
    }
}
