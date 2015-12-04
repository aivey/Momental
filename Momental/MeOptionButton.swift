//
//  MeOptionButton.swift
//  Momental
//
//  Created by Adrienne Ivey on 12/2/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class MeOptionButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        var frame = self.imageView?.frame
        frame = CGRectMake(self.bounds.size.width - frame!.size.width/2, 0.0, frame!.size.width, frame!.size.height)
        self.imageView?.frame = frame!
        
        frame = self.titleLabel?.frame
        frame = CGRectMake(self.bounds.size.width - frame!.size.width/2, 0.0, frame!.size.width, frame!.size.height)
        self.titleLabel!.frame = frame!
    }
}
