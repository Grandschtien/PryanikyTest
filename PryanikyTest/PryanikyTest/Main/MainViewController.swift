//
//  MainViewController.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let output: MainViewOutput
// MARK: - UI
    private lazy var topLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    private lazy var bottomLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    private lazy var staticTable: UITableView = {
       let table = UITableView()
        
        return table
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
// MARK: - initialize
    init(viewModel: MainViewOutput) {
        self.output = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Пряники"
        view.backgroundColor = .systemBackground
    }
}
// MARK: -  View Input
extension MainViewController: MainViewInput {
    func updateViewWithModel(model: PurpleData) {
        
    }
}
// MARK: - table view delegates
extension MainViewController {
    
}
