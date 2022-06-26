//
//  FilterViewController.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 26.06.2022.
//

import UIKit

class FilterViewController: UIViewController {

    private let filterView = FilterUIView()
    private var filterTableViewHelper: FilterLabelViewHelper?
    var viewModel = FilterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        self.viewModel.delegate = self
        self.filterTableViewHelper = .init(for: filterView.tableView, in: viewModel)
        self.filterTableViewHelper?.delegate = self
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        view.addSubview(filterView)
        self.viewModel.viewDidLoad()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FilterViewController: FilterViewModelDelegate{
    func didDataFetched(for tag: FilterTags?) {
        filterTableViewHelper?.setData(with: tag)
    }
}

extension FilterViewController: FilterTableDelegate{
    func didSelect(tag: FilterTags) {
        dismiss(animated: true)
    }
}
