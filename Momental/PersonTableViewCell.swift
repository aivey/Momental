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
    
    var type: FakeData.ProfileListType!
    var apptString: String?
    var profile: Profile? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        if let person = profile {
            profileImageView.configure(person.image)
            nameLabel.text = "\(person.firstName) \(person.lastName)"
            infoLabel.text  = "\(person.dorm) \(person.staffPosition)"
            switch type! {
            case .Appointments:
                nextAvailableLabel.text = "\(apptString!)"
            default:
                if (profile?.availableNow == true) {
                    nextAvailableLabel.text = "Available Now!"
                } else {
                    if let time = profile?.availableTimesArray[0]![0] {
                        nextAvailableLabel.text = "Next available at \(time)pm"
                    }
                }
            }
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
