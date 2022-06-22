//
//  ImageCell.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import UIKit
import Kingfisher

class ImageCell: UITableViewCell {
    private var image: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(image)
        image.pins()
        selectionStyle = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init(code:) did't implement")
    }

    func configureWithResource(resource: ImageResource?) {
        if let resource = resource {
            image.kf.setImage(with: resource)
            print(resource.downloadURL)
        } else {
            image.image = UIImage(systemName: "arrow.down.doc.fill")
        }
        
    }
}
