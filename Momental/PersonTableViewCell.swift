//
//  PersonTableViewCell.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/27/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: ImageViewController!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nextAvailableLabel: UILabel!
    
    var profile: Profile? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configure()
    }
    
    func configure() {
        if let person = profile {
            profileImageView.configure(person.image)
            nameLabel.text = "\(person.firstName) \(person.lastName)"
            infoLabel.text  = "\(person.dorm) \(person.staffPosition)"
            nextAvailableLabel.text = "Next available at \(Int(arc4random_uniform(10) + 1))pm"
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
