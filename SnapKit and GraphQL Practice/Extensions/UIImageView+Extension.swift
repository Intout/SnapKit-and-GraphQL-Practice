//
//  UIImage+Extension.swift
//  SnapKit and GraphQL Practice
//
//  Created by Mert Tecimen on 25.06.2022.
//

import UIKit


extension UIImageView {
    func loadFrom(URLAddress: String, boundsToCrop: CGRect?) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    
                    self?.image = boundsToCrop != nil ? loadedImage.cropImage(toRect: boundsToCrop!) : loadedImage
                }
            }
        }
    }
    func cropImage(imageToCrop:UIImage, toRect rect:CGRect) -> UIImage{
        
        let imageRef:CGImage = imageToCrop.cgImage!.cropping(to: rect)!
        let cropped:UIImage = UIImage(cgImage:imageRef)
        return cropped
    }
}

extension UIImage{
    func cropImage(toRect rect: CGRect) -> UIImage{
        if let imageRef = self.cgImage!.cropping(to: rect){
            return UIImage(cgImage: imageRef)
        }
        return self
    }
}
