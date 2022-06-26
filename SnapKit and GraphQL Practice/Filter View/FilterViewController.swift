//
//  FilterViewController.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 26.06.2022.
//

import UIKit

protocol FilterTagDelegate: AnyObject{
    func filterChanged(with tag: FilterTags)
}

class FilterViewController: UIViewController {

    fileprivate let filterView = FilterUIView()
    fileprivate var filterTableViewHelper: FilterLabelViewHelper?
    
    private(set) var viewModel = FilterViewModel()
    weak var delegate: FilterTagDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.definesPresentationContext = true
        self.filterTableViewHelper = .init(for: filterView.tableView, in: viewModel)
        
        self.viewModel.delegate = self
        self.filterTableViewHelper?.delegate = self
        self.filterTableViewHelper?.delegate = self
        self.viewModel.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI(){
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        view.addSubview(filterView)
        
    }

}

extension FilterViewController: FilterViewModelDelegate{
    func didDataFetched(for tag: FilterTags?) {
        filterTableViewHelper?.setData(with: tag)
    }
}

extension FilterViewController: FilterTableDelegate{
    func didSelect(tag: FilterTags) {
        delegate?.filterChanged(with: tag)
        dismiss(animated: true)
    }
}
