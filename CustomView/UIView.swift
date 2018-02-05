//
//  UIView.swift
//  CustomView
//
//  Created by Lullaby on 2/2/2561 BE.
//  Copyright © 2561 Lullaby. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let cgColor = layer.borderColor {
                return UIColor(cgColor: cgColor)
            } else { return .none }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func updateLayout() {
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    func setShadow(radius:CGFloat, opacity:Float,color:UIColor = UIColor.black, offset:CGSize = CGSize.zero) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
  
}
