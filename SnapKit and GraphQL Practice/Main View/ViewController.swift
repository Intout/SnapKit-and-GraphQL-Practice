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
        
        self.title = "Rick and Morty"
        self.navigationItem.largeTitleDisplayMode = .always
        
        self.tableViewHelper = .init(with: tableView, in: viewModel)
    
        
        
        setupUI()
    }
    
    
    private func setupUI(){
        self.view.addSubview(tableView)
        tableView.configureTableView()
        tableView.addSubview(tabNavigationView)
        navigationItem.titleView = tabNavigationView
        tabNavigationView.configureView()
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
