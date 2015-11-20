//
//  Image.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/15/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class ImageViewController: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    private var borderWidth: CGFloat = 2.0
    
    func configure(image: String) {
        self.image = UIImage(named: image)
        let savedCenter = self.center
        self.layer.cornerRadius = self.frame.width / 2.0
        self.clipsToBounds = true;
        self.center = savedCenter
        self.layer.borderColor = Color.personImageBorderColor().CGColor
        self.layer.borderWidth = borderWidth
    }

}
