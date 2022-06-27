//
//  UIView+Extension.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 26.06.2022.
//

import UIKit

extension UIView{
    func dropShadow(radius shadowRaidus: CGFloat, opacity shadowOpacity: Float, offset shadowOffset: CGSize){
        self.layer.shadowColor = UIColor.init{ (trait) in
            return trait.userInterfaceStyle == .dark ? .white : .black
        }.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRaidus
        self.layer.masksToBounds = false
    }
}
