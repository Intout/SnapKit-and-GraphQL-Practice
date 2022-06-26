//
//  FilterUIView.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 26.06.2022.
//

import UIKit
import SnapKit

class FilterUIView: UIView {
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 24)
        label.text = "Filter"
        return label
    }()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.frame = UIScreen.main.bounds
        self.addSubview(containerView)
    
        containerView.addSubview(titleLabel)
        containerView.addSubview(tableView)
        configureContraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContraints(){
        
        containerView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.height.equalTo(167)
            make.width.equalTo(327)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalTo(16)
            make.top.equalTo(16)
        }
        tableView.backgroundColor = .white
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
        
    }
    
}
