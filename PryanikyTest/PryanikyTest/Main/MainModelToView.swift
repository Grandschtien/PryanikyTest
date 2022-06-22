//
//  MainModelToView.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import Foundation
import Kingfisher

struct MainModelToView {
    let labelString: LabelString
    let picture: Picture
    let variants: Variants
}

struct LabelString {
    let name: String
    let string: String
}
struct Picture {
    let name: String
    let picture: ImageResource?
}
struct Variants {
    let name: String
    let variants: [Variant]
    let selectionId: Int
}
