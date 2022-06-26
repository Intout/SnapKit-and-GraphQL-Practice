//
//  TableViewHelper.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import Foundation
import UIKit


/// Helper method for TableView.
/// Table View UI oprations will be executed here after required data fetched via viewModel
class TableViewHelper: NSObject{
    
    weak var tableView: UITableView?
    weak var viewModel: MainViewModel?
    
    private var data: [CharacterData] = []
    private var filterTag: FilterTags?
    private var filteredData: [CharacterData] = []
    
    /// Takes corresponfing tableView to handle data and view operations.
    /// - Parameters:
    ///   - tableView: tableView to handle.
    ///   - vm: View model of superView.
    init(with tableView: UITableView, in vm: MainViewModel){
        super.init()
        self.viewModel = vm
        self.tableView = tableView
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        register()
    }
    
    /// Register custom view elements for TableView.
    private func register(){
        tableView?.register(MainTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }
    
    /// Takes and sets tableView required information data. TableView data will be reloaded in async UI thread to display new data.
    /// - Parameter data: Array of charater infromations to display on tableView
    func setData(with data: [CharacterData]){
        self.data = data
        self.filteredData = data
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    /// Sets tableViews Filter tag.
    /// If filter tag is same with previous one, filter tag gets deleted and all data will be shown.
    /// If filter tag is new, tableView data gets filtered and new tag is set as current one.
    /// TableView data will be reloaded in async UI thread to display new data.
    /// - Parameter tag: Fitler tag to filter data with.
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
        // 16 is for padding.
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
            cell.headerImageView.loadThumbnail(urlSting: imageURL, cropRect: CGRect(x: 0, y: 60, width: .max, height: 168))
        }
        
        cell.idLabel.text = filteredData[indexPath.item].id ?? "-"
        cell.nameLabel.text = filteredData[indexPath.item].name ?? "-"
        cell.locationLabel.text = filteredData[indexPath.item].location ?? "-"

        
        return cell
    }

}
