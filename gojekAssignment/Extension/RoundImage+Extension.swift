//
//  RoundImage+Extension.swift
//  gojekAssignment
//
//  Created by Varsha Vijayvargiya on 09/09/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView
{
    func SetImageViewRound() {

        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}




