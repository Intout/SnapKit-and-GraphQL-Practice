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
        view.backgroundColor = UIColor.init{ (trait) in
            return trait.userInterfaceStyle == .dark ? .black : .white
        }
        view.layer.cornerRadius = 10
        return view
    }()
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.init{ (trait) in
            return trait.userInterfaceStyle == .dark ? .black : .white
        }
        tableView.separatorStyle = .none
        // Top border
        let border = UIView()
        border.backgroundColor = .gray
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0.5)
        tableView.addSubview(border)
        // for UITest
        tableView.accessibilityIdentifier = AccessibilityIdentifiers.filterTable.rawValue
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds
        self.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(tableView)
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraints(){
        
        containerView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.height.equalTo(167)
            make.width.equalTo(327)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalTo(16)
            make.top.equalTo(16)
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
        
    }
    
}
