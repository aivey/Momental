//
//  ProfileViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/17/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: ImageViewController!
//    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    var profile: Profile!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.configure(profile.image)
        nameLabel.text = "\(profile.firstName) \(profile.lastName)"
        positionLabel.text = "\(profile.dorm) \(profile.staffPosition)";
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Embed") {
            if let profileTable = segue.destinationViewController as? ProfileTableViewController {
                profileTable.profile = profile;
            }
        }
    }
    

}
