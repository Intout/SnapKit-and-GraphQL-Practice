//
//  MainTabBarUIView.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import UIKit

class MainNavigationBarUIView: UIView {

    let title = UILabel()
    let button = UIButton()
    
    
    
    func configureView(){
        
        
        let buttonImage = UIImage(systemName: "line.3.horizontal.decrease.circle")
        
        self.addSubview(title)
        self.addSubview(button)
        
        self.backgroundColor = .clear

        title.sizeToFit()
        
        
        title.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        
        title.text = "Rick and Morty"
        title.font = UIFont(name: "Roboto-Bold", size: 24)
        
        button.setImage(buttonImage, for: .normal)
        button.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(23)
            make.height.equalTo(23)
            
        }

    }
    

}
