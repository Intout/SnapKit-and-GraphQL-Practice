//
//  MainTableViewCell.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {

    
    let backgourndView = UIView()
    let headerImageView = UIImageView()
    
    let nameTitleLabel = UILabel()
    let nameLabel = UILabel()
    
    let locationTitleLabel = UILabel()
    let locationLabel = UILabel()
    
    let idTitleLabel = UILabel()
    let idLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell(){
        
        self.addSubview(backgourndView)
        
        backgourndView.snp.makeConstraints{ make in
            make.width.equalTo(327)
            make.height.equalTo(265)
            make.center.equalToSuperview()
        }
        
        backgourndView.backgroundColor = .systemGray6
        
        backgourndView.addSubview(headerImageView)
        
        headerImageView.image = UIImage(systemName: "car.fill")
        
        headerImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(168)
        }


        
   
        
        
        
        idTitleLabel.text = "id#"
    
        idLabel.text = "1"
        
        
    }
    
    

}
