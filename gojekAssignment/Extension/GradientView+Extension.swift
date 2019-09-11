//
//  GradientView+Extension.swift
//  gojekAssignment
//
//  Created by Varsha Vijayvargiya on 10/09/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//

import Foundation
import UIKit


extension UIView
{
    func setGradientBackground() {
        let colorTop =  UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 100).cgColor
        let colorBottom = UIColor(red: 214.0/255.0, green: 249.0/255.0, blue: 241.0/255.0, alpha: 83.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at:0)
       
    }
}
