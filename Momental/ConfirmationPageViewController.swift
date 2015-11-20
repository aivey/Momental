//
//  ConfirmationPageViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/17/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit
import MessageUI

class ConfirmationPageViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var matchImageView: ImageViewController!
    @IBOutlet weak var confirmationMessage: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    
    
    var matchProfile: Profile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmationMessage.text = "You're seeing \(matchProfile.firstName) in \(matchProfile.dorm) \(matchProfile.roomNumber)."
        matchImageView.configure(matchProfile.image)
        cancelButton.layer.borderColor = Color.mainColor().CGColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelAppt(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
        //CODE TO REMOVE APPT FROM SAVED APPTS
    }
    
    @IBAction func clickTextButton() {
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = "";
        messageVC.recipients = ["\(self.matchProfile.phoneNumber)"]
        messageVC.messageComposeDelegate = self;
        
        
        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    
    @IBAction func clickCallButton() {
        if let url = NSURL(string: "tel://\(self.matchProfile.phoneNumber)") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func clickStarButton() {
        if !FakeData.favorites.contains(matchProfile) {
            starButton.setImage(UIImage(named: "Star Filled"), forState: UIControlState.Normal)
            FakeData.favorites.insert(matchProfile)
        } else {
            starButton.setImage(UIImage(named: "Star Icon"), forState: UIControlState.Normal)
            FakeData.favorites.remove(matchProfile)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "viewProfile") {
            if let profilePage = segue.destinationViewController as? ProfileViewController {
                profilePage.profile = matchProfile
            }
        }
    }
    

}
