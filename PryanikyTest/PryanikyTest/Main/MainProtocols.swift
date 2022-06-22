//
//  MainProtocols.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import Foundation

protocol MainViewOutput: AnyObject {
    func viewDidLoad()
}

protocol MainViewInput: AnyObject {
    func updateViewWithModel(model: MainModelToView)
}

protocol MainModelInput: AnyObject {
    func loadData()
}

protocol MainModelOutput: AnyObject {
    func didLoadData(model: PurpleData)
}
