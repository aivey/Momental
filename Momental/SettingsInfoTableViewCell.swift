//
//  SettingsInfoTableViewCell.swift
//  Momental
//
//  Created by Adrienne Ivey on 12/4/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class SettingsInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: ImageViewController!
    @IBOutlet weak var profileNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.configure("sierrakcPhoto")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
