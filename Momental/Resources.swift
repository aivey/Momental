//
//  Resources.swift
//  Momental
//
//  Created by Meredith Marks on 11/19/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff)
    }
}


extension CALayer {
    func setBorderColorFromUIColor(color: UIColor) {
        self.borderColor = color.CGColor;
    }
}