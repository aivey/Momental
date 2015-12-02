//
//  ProfileViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/17/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit
import MessageUI

class ProfileViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet weak var profileImageView: ImageViewController!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    var profile: Profile!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.configure(profile.image)
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        nameLabel.text = "\(profile.firstName) \(profile.lastName)"
        positionLabel.text = "\(profile.dorm) \(profile.staffPosition)";
        
        // Do any additional setup after loading the view.
        
        if FakeData.favorites.contains(profile) {
            starButton.setImage(UIImage(named: "Star Filled White"), forState: UIControlState.Normal)
        } else {
            starButton.setImage(UIImage(named: "Star White"), forState: UIControlState.Normal)
        }
        
        for parent in self.navigationController!.navigationBar.subviews {
            for childView in parent.subviews {
                if(childView is UIImageView) {
                    childView.removeFromSuperview()
                }
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickTextButton() {
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = "";
        messageVC.recipients = ["\(self.profile.phoneNumber)"]
        messageVC.messageComposeDelegate = self;
        
        
        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    
    @IBAction func clickCallButton() {
        if let url = NSURL(string: "tel://\(self.profile.phoneNumber)") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func clickStarButton() {
        if !FakeData.favorites.contains(profile) {
            starButton.setImage(UIImage(named: "Star Filled White"), forState: UIControlState.Normal)
            FakeData.favorites.insert(profile)
        } else {
            starButton.setImage(UIImage(named: "Star White"), forState: UIControlState.Normal)
            FakeData.favorites.remove(profile)
        }
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
