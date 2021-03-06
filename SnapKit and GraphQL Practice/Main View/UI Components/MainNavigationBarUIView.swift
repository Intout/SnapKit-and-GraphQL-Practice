//
//  MainTabBarUIView.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import UIKit

/// Handles communication between button and superView.
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
        let buttonImage = UIImage(named: "FilterButton-NonPressed")
        button.setImage(buttonImage, for: .normal)
        button.clipsToBounds = false
        // For UI testing
        button.accessibilityIdentifier = AccessibilityIdentifiers.filterButton.rawValue
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
    
    func configureConstraints(){
        title.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        button.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-5)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }

    }
    
    /// Button action.
    @objc fileprivate func buttonPressed(){
        delegate?.didButtonPressed()
    }

}
