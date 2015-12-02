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
    
    override func awakeFromNib() {
        let backgroundView: UIView = UIView(frame: self.bounds)
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.borderColor = UIColor.grayColor().CGColor
        backgroundView.layer.cornerRadius = 10
        self.backgroundView = backgroundView;

        let selectedBGView: UIView = UIView(frame: self.bounds)
        selectedBGView.layer.borderWidth = 1
        selectedBGView.layer.backgroundColor = UIColor.grayColor().CGColor
        selectedBGView.layer.cornerRadius = 10
        self.selectedBackgroundView = selectedBGView;
    }
}
