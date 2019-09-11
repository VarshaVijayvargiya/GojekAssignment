//
//  Extension+UIVIewController.swift
//  GameChangeAssignment
//
//  Created by Varsha Vijayvargiya on 17/08/19.
//  Copyright © 2019 Varsha Vijayvargiya. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController
{
    
    
    func hideKeyboardWhenTappedAround() {
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismisKeyboard()
    {
        view.endEditing(true)
    }
    
    // When Call  self.hideKeyboardWhenTappedAround()
    
}
