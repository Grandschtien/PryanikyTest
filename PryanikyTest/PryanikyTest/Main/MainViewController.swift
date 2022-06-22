//
//  MainViewController.swift
//  PryanikyTest
//
//  Created by Егор Шкарин on 22.06.2022.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    private let output: MainViewOutput
    private var modelForView: MainModelToView?
    // MARK: - UI
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.isScrollEnabled = false
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        table.register(TextCell.self)
        table.register(ImageCell.self)
        return table
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
        view.addSubview(tableView)
        tableView.pins()
    }
}
// MARK: -  View Input
extension MainViewController: MainViewInput {
    func updateViewWithModel(model: MainModelToView) {
        Task { [weak self] in
            self?.modelForView = model
            self?.tableView.reloadData()
        }
    }
}
// MARK: - table view delegates
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (modelForView?.variants.variants.count ?? 0) + 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(cellType: TextCell.self, for: indexPath)
        let imageCell = tableView.dequeueCell(cellType: ImageCell.self, for: indexPath)
        switch indexPath.row {
        case 0:
            cell.configureWithText(text: modelForView?.labelString.string ?? "")
        case 1...3:
            guard let variant = modelForView?.variants.variants[indexPath.row - 1] else {
                return .init()
            }
            cell.configure(with: variant)
        case 4:
            imageCell.configureWithResource(resource: modelForView?.picture.picture)
            return imageCell
        case (modelForView?.variants.variants.count ?? 0) + 2:
            cell.configureWithText(text: modelForView?.labelString.string ?? "")
        default :
            return .init()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == modelForView?.variants.selectionId {
            cell.setSelected(true, animated: false)
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("\(modelForView?.labelString.name ?? "") \(modelForView?.labelString.string ?? "") с индексом \(indexPath.row)")
        case 1...3:
            guard let variant = modelForView?.variants.variants[indexPath.row - 1] else {
                return
            }
            print("\(modelForView?.variants.name ?? ""): \(variant.id) \(variant.text)")
        case 4:
            if let url = modelForView?.picture.picture?.downloadURL {
                print("\(modelForView?.picture.name ?? ""): \(url)")
            }
        case (modelForView?.variants.variants.count ?? 0) + 2:
            print("\(modelForView?.labelString.name ?? "") \(modelForView?.labelString.string ?? "") с индексом \(indexPath.row)")
        default :
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
