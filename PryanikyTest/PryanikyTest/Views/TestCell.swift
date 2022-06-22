//
//  TextCell.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import UIKit

class TextCell: UITableViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        label.pins(UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) did't implement")
    }
    func configure(with variant: Variant) {
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        label.text = variant.text
    }
    func configureWithText(text: String) {
        label.text = text
    }
}
