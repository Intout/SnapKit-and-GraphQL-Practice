//
//  FilterTableViewHelper.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 26.06.2022.
//

import UIKit


class FilterLabelViewHelper: NSObject{
    
    weak var tableView: UITableView?
    weak var viewModel: MainViewModel?
    
    init(for tableView: UITableView, in vm: MainViewModel) {
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
    
    
}


extension FilterLabelViewHelper: UITableViewDelegate{
    
    
}

extension FilterLabelViewHelper: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath)
        return cell
    }
}
