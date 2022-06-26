//
//  FilterTableViewTableViewCell.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 26.06.2022.
//

import UIKit
import SnapKit

class FilterTableViewTableViewCell: UITableViewCell {

    private(set) lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 24)
        return label
    }()
    
    fileprivate lazy var indicatorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(label)
        self.addSubview(indicatorView)
        configureConstraints()
    }
    
    private func configureConstraints(){
        
        
        label.text = "Text"
        label.snp.makeConstraints{ make in
            make.leading.equalTo(16)
            make.centerY.equalToSuperview()
        }
        
        indicatorView.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
