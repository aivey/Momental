//
//  AppointmentCollectionViewCell.swift
//  Momental
//
//  Created by Adrienne Ivey on 12/1/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class AppointmentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    func viewDidLoad() {
        self.backgroundView = UIView(frame: self.bounds)
    }
 
//    func viewDidLoad() {
//        let backgroundView: UIView = UIView(frame: self.bounds)
//        backgroundView.layer.borderWidth = 1
//        backgroundView.layer.borderColor = UIColor.grayColor().CGColor
//        self.backgroundView = backgroundView;
//        
//        let selectedBGView: UIView = UIView(frame: self.bounds)
//        selectedBGView.layer.borderWidth = 1
//        selectedBGView.layer.borderColor = UIColor.grayColor().CGColor
//        self.selectedBackgroundView = selectedBGView;
//    }
}
