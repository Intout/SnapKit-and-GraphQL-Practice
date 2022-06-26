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
    private var tableView = MainUITableView()
    private var tableViewHelper: TableViewHelper?
    private var tabNavigationView = MainNavigationBarUIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        viewModel.delegate = self
        self.navigationItem.largeTitleDisplayMode = .always
        self.tabNavigationView.delegate = self
        
        self.tableViewHelper = .init(with: tableView, in: viewModel)
        
        
        
        
        setupUI()
    }
    
    
    private func setupUI(){
        
        self.view.addSubview(tableView)
        tableView.configureTableView()
        tableView.addSubview(tabNavigationView)
        navigationItem.titleView = tabNavigationView
        tabNavigationView.configureContainers()
         
    }


}

extension ViewController: MainViewModelDelegate{
    func didFetched(for data: [CharacterData]) {
        tableViewHelper?.setData(with: data)
    }
    
    func didFetchedFailed(with error: Error) {
        // (Optional) add message.
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
        print("View didn't loaded")
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

#if DEBUG
import SwiftUI

struct InfoVCRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // leave this empty
    }
    
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

@available(iOS 13.0, *)
struct InfoVCPreview: PreviewProvider {
    static var previews: some View {
        InfoVCRepresentable()
    }
}
#endif
