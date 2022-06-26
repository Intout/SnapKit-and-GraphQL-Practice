//
//  MainTableViewCell.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {

    
    private var backgourndView = UIView()
    private(set) var headerImageView = UIImageView()
    
    private var nameTitleLabel = UILabel()
    private(set) var nameLabel = UILabel()
    
    private var locationTitleLabel = UILabel()
    private(set) var locationLabel = UILabel()
    
    private var idTitleLabel = UILabel()
    private(set) var idLabel = UILabel()
    
    let font = UIFont(name: "Roboto-Regular", size: 16)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell(){
        
        self.addSubview(backgourndView)
        
        self.layer.cornerRadius = 10
        self.backgourndView.layer.cornerRadius = 10
        backgourndView.snp.makeConstraints{ make in
            make.width.equalTo(327)
            make.height.equalTo(265)
            make.center.equalToSuperview()
        }
        
        backgourndView.backgroundColor = .systemGray6
        backgourndView.clipsToBounds = true
        
        // Image View
        backgourndView.addSubview(headerImageView)
        headerImageView.image = UIImage(systemName: "photo")
        headerImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.height.equalTo(168)
            make.width.equalToSuperview()
        }
        
        // ID Labels
        backgourndView.addSubview(idLabel)
        backgourndView.addSubview(idTitleLabel)
        
        idTitleLabel.text = "#id:"
        idTitleLabel.font = font
        idTitleLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(idLabel.snp.leading).offset(-5)
            make.top.equalTo(headerImageView.snp.bottom).offset(8)
        }

        idLabel.text = "1"
        idLabel.font = font
        idLabel.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        idLabel.snp.makeConstraints{ make in
            make.top.equalTo(headerImageView.snp.bottom).offset(8)
            make.trailing.equalTo(-17)
        }
        
        // Name Labels
        backgourndView.addSubview(nameLabel)
        backgourndView.addSubview(nameTitleLabel)
        
        nameTitleLabel.text = "Name:"
        nameTitleLabel.font = font
        nameTitleLabel.snp.makeConstraints{ make in
            make.top.equalTo(idLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
        
        nameLabel.text = "name"
        nameLabel.font = font
        nameLabel.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(idLabel.snp.bottom).offset(8)
            make.leading.equalTo(nameTitleLabel.snp.trailing).offset(5)
            make.trailing.equalTo(8)
        }
        
        // Location Labels
        backgourndView.addSubview(locationLabel)
        backgourndView.addSubview(locationTitleLabel)
        
        locationTitleLabel.text = "Location:"
        locationTitleLabel.font = font
        locationTitleLabel.snp.makeConstraints{ make in
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
        
        locationLabel.text = "location"
        locationLabel.font = font
        locationLabel.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        locationLabel.snp.makeConstraints{ make in
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(locationTitleLabel.snp.trailing).offset(5)
            make.trailing.equalTo(8)
        }
        
        
    }
    
    

}
