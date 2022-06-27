//
//  ViewController.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    private var viewModel = MainViewModel()
    private var tableViewHelper: TableViewHelper?
    
    private lazy var tableView = MainUITableView()
    private lazy var tabNavigationView = MainNavigationBarUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.viewDidLoad()

        viewModel.delegate = self
        tabNavigationView.delegate = self
        
        self.tableViewHelper = .init(with: tableView, in: viewModel)
        
        setupUI()
    }
        
    private func setupUI(){
        // tableView and navigationView must have constraints after added as a subView.
        view.addSubview(tableView)
        tableView.configureConstraints()
        
        navigationItem.titleView = tabNavigationView
        view.backgroundColor = UIColor.init{ (trait) in
            return trait.userInterfaceStyle == .dark ? .black : .white
        }
        
        tabNavigationView.configureConstraints()
         
    }
}

extension ViewController: MainViewModelDelegate{
    func didFetched(for data: [CharacterData]) {
        tableViewHelper?.setData(with: data)
    }
    
    func didFetchedFailed(with error: Error) {
        // (Optional) Add message.
        return
    }
}

extension ViewController: FilterTagDelegate{
    private func presentFilterPopUp(){
        let filterViewController = FilterViewController()
        filterViewController.delegate = self
        filterViewController.viewModel.setSelectedTag(as: tableViewHelper?.getFilterTag())
        filterViewController.modalPresentationStyle = .overCurrentContext
        filterViewController.modalTransitionStyle = .crossDissolve
        present(filterViewController, animated: true, completion: nil)
    }
    
    func filterChanged(with tag: FilterTags) {
        tableViewHelper?.setFilterTag(with: tag)
    }
}

extension ViewController: FilterButtonDelegate{
    func didButtonPressed() {
        presentFilterPopUp()
    }
}
