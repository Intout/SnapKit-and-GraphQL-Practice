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
    
}

extension TableViewHelper: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        265 + 16
    }
}

extension TableViewHelper: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! MainTableViewCell
        
        return cell
    }
}
