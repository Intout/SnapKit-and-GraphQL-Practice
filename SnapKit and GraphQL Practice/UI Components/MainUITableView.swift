//
//  mainUITableView.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import UIKit
import SnapKit

class MainUITableView: UITableView {
    
    func configureTableView(){
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .blue
        
        self.snp.makeConstraints{ make in
            make.top.equalTo(self.superview!.safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
    
    
    
}
