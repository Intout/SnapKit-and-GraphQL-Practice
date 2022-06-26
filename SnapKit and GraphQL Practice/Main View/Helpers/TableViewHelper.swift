//
//  TableViewHelper.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import Foundation
import UIKit


class TableViewHelper: NSObject{
    
    weak var tableView: UITableView?
    weak var viewModel: MainViewModel?
    
    private var data: [CharacterData] = []
    private var filterTag: FilterTags?
    private var filteredData: [CharacterData] = []
    
    init(with tableView: UITableView, in vm: MainViewModel){
        super.init()
        self.viewModel = vm
        self.tableView = tableView
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        register()
    }
    
    private func register(){
        tableView?.register(MainTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }
    
    func setData(with data: [CharacterData]){
        self.data = data
        self.filteredData = data
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func setFilterTag(with tag: FilterTags){
        if tag == filterTag{
            self.filteredData = data
            filterTag = nil
        } else {
            self.filteredData = data.filter{
                $0.name?.lowercased().contains(tag.rawValue.lowercased()) ?? false
            }
            filterTag = tag
        }
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func getFilterTag() -> FilterTags?{
        return filterTag
    }
    
}

extension TableViewHelper: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        265 + 16
    }
}

extension TableViewHelper: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! MainTableViewCell
        
        
        if let imageURL = filteredData[indexPath.item].image{
            cell.headerImageView.loadFrom(URLAddress: imageURL, boundsToCrop: CGRect(x: 0, y: 60, width: .max, height: 168))
        }
        
        cell.idLabel.text = filteredData[indexPath.item].id ?? "-"
        cell.nameLabel.text = filteredData[indexPath.item].name ?? "-"
        cell.locationLabel.text = filteredData[indexPath.item].location ?? "-"

        
        return cell
    }

}
