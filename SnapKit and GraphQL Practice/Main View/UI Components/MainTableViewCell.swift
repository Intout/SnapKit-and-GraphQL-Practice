//
//  MainTableViewCell.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {

    
    private var backgourndView: UIView = {
        let view = UIView()
        view.backgroundColor  = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.dropShadow(radius: 5, opacity: 0.1, offset: CGSize(width: 0, height: 10))
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    private(set) var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private var nameTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Name:"
        label.font = UIFont(name: ProjectFonts.robotoRegular.rawValue, size: 16)
        return label
    }()
    private(set) var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        label.font = UIFont(name: ProjectFonts.robotoRegular.rawValue, size: 16)
        return label
    }()
    
    private var locationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Location:"
        label.font = UIFont(name: ProjectFonts.robotoRegular.rawValue, size: 16)
        return label
    }()
    private(set) var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        label.font = UIFont(name: ProjectFonts.robotoRegular.rawValue, size: 16)
        return label
    }()
    
    private var idTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#id:"
        label.font = UIFont(name: ProjectFonts.robotoRegular.rawValue, size: 16)
        return label
    }()
    private(set) var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        label.font = UIFont(name: ProjectFonts.robotoRegular.rawValue, size: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 10
        
        self.addSubview(headerImageView)
        self.addSubview(backgourndView)
        
        backgourndView.addSubview(idLabel)
        backgourndView.addSubview(idTitleLabel)
        backgourndView.addSubview(nameLabel)
        backgourndView.addSubview(nameTitleLabel)
        backgourndView.addSubview(locationLabel)
        backgourndView.addSubview(locationTitleLabel)
        
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints(){
        
        // Image View
        headerImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.height.equalTo(168)
            make.width.equalTo(327)
            make.centerX.equalToSuperview()
        }
        
        // Background View
        backgourndView.snp.makeConstraints{ make in
            make.width.equalTo(327)
            make.height.equalTo(97)
            make.top.equalTo(headerImageView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        // ID Labels
        idTitleLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(idLabel.snp.leading).offset(-5)
            make.top.equalTo(headerImageView.snp.bottom).offset(8)
        }

        idLabel.snp.makeConstraints{ make in
            make.top.equalTo(headerImageView.snp.bottom).offset(8)
            make.trailing.equalTo(-17)
        }
        
        // Name Labels
        nameTitleLabel.snp.makeConstraints{ make in
            make.top.equalTo(idLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
        
        nameLabel.snp.makeConstraints{ make in
            make.top.equalTo(idLabel.snp.bottom).offset(8)
            make.leading.equalTo(nameTitleLabel.snp.trailing).offset(5)
            make.trailing.equalTo(8)
        }
        
        // Location Labels
        locationTitleLabel.snp.makeConstraints{ make in
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(8)
        }
        
        locationLabel.snp.makeConstraints{ make in
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(locationTitleLabel.snp.trailing).offset(5)
            make.trailing.equalTo(8)
        }
        
        
    }
    
    

}
