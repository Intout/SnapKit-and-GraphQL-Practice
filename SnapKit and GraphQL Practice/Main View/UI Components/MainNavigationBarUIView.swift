//
//  MainTabBarUIView.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import UIKit

protocol FilterButtonDelegate: AnyObject{
    
    func didButtonPressed()
    
}

class MainNavigationBarUIView: UIView {

    fileprivate lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ProjectFonts.robotoBold.rawValue, size: 24)
        label.text = "Rick and Morty"
        return label
    }()
    fileprivate lazy var button: UIButton = {
        let button = UIButton()
        // Default image
        let buttonImage = UIImage(systemName: "line.3.horizontal.decrease.circle")
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    weak var delegate: FilterButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        self.addSubview(title)
        self.addSubview(button)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContainers(){
        title.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        button.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(23)
            make.height.equalTo(23)
        }

    }
    
    @objc fileprivate func buttonPressed(){
        delegate?.didButtonPressed()
    }

}
