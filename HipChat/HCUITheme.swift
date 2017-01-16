//
//  HCUITheme.swift
//  HipChat
//
//  Created by GIB on 1/17/17.
//  Copyright © 2017 Xmen. All rights reserved.
//

import UIKit

class HCUITheme {
    
    // MARK: Button Theme
    class func configureRoundedButton(button:inout UIButton) {
        button.backgroundColor = .clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = button.tintColor.cgColor
        
    }
    
    // MARK: UI Animations
    class func shakeTextField(textField: UITextField)  {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 4, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 4, y: textField.center.y))
        
        textField.layer.add(animation, forKey: "position")
    }
}


