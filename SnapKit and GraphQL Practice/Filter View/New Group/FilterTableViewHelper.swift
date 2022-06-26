//
//  FilterTableViewHelper.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 26.06.2022.
//

import UIKit

protocol FilterTableDelegate: AnyObject{
    func didSelect(tag: FilterTags)
}

class FilterLabelViewHelper: NSObject{
    
    weak var tableView: UITableView?
    weak var viewModel: FilterViewModel?
    
    private var tags: [FilterTags] = FilterTags.allCases
    private var selectedTag: FilterTags?
    weak var delegate: FilterTableDelegate?
    
    init(for tableView: UITableView, in vm: FilterViewModel) {
        super.init()
        self.tableView = tableView
        self.viewModel = vm
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        register()
        
    }
    
    private func register(){
        tableView?.register(FilterTableViewTableViewCell.self, forCellReuseIdentifier: "filterCell")
    }
    
    func setData(with filterTags: FilterTags?){
        self.selectedTag = filterTags
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
}


extension FilterLabelViewHelper: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelect(tag: tags[indexPath.item])
    }
    
}

extension FilterLabelViewHelper: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! FilterTableViewTableViewCell
        cell.label.text = tags[indexPath.item].rawValue
        
        
        
        if selectedTag == tags[indexPath.item]{
            cell.highlightAsSelected()
        }
        
        return cell
    }
    
}
