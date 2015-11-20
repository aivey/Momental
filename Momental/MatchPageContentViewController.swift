//
//  MatchPageViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/15/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit
import MessageUI

class MatchPageContentViewController: UIViewController, UIAlertViewDelegate, MFMessageComposeViewControllerDelegate
 {

    var matchProfile: Profile!
    var pageIndex: Int?
    
    @IBOutlet weak var matchImageView: ImageViewController!

    @IBOutlet weak var matchNameLabel: UILabel!
    @IBOutlet weak var matchMessageLabel: UILabel!
    @IBOutlet weak var viewBioButton: UIButton!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var bioScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchImageView.configure(matchProfile.image)
        matchNameLabel.text = "\(matchProfile.firstName) \(matchProfile.lastName)"
        matchMessageLabel.text = "is available now in \(matchProfile.dorm) \(matchProfile.roomNumber)."
        bioLabel.text = matchProfile.bio;
        
        viewBioButton.layer.borderColor = Color.mainColor().CGColor
        bioScrollView.layer.borderColor = Color.mainColor().CGColor
        bioScrollView.layer.borderWidth = 1
        bioScrollView.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func viewBio(sender: AnyObject) {
        if bioScrollView.hidden {
            bioScrollView.hidden = false;
            UIView.setAnimationsEnabled(false)
            viewBioButton.setTitle("Close Bio", forState: .Normal)
            viewBioButton.layoutIfNeeded()
            UIView.setAnimationsEnabled(true)

        } else {
            bioScrollView.hidden = true;
            UIView.setAnimationsEnabled(false)
            viewBioButton.setTitle("View Bio", forState: .Normal)
            viewBioButton.layoutIfNeeded()
            UIView.setAnimationsEnabled(true)
        }
    }
    
    
    @IBAction func book(sender: AnyObject) {
//        let alert = UIAlertView(title: "Confirm", message: "You are about to schedule a meeting with \(matchProfile.firstName). Continue?", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Book")
//        alert.show()
        
        let optionMenu = UIAlertController(title: nil, message: "Talk to \(matchProfile.firstName)", preferredStyle: .ActionSheet)
        
        let inPersonAction = UIAlertAction(title: "In person", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
                self.performSegueWithIdentifier("bookAppt", sender: nil)
        })
        let textAction = UIAlertAction(title: "Text", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
                let messageVC = MFMessageComposeViewController()
                
                messageVC.body = "";
                messageVC.recipients = ["\(self.matchProfile.phoneNumber)"]
                messageVC.messageComposeDelegate = self;
            
                
                self.presentViewController(messageVC, animated: false, completion: nil)

        })
        let callAction = UIAlertAction(title: "Call", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
                if let url = NSURL(string: "tel://\(self.matchProfile.phoneNumber)") {
                    UIApplication.sharedApplication().openURL(url)
                }

        })
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        
        optionMenu.addAction(inPersonAction)
        optionMenu.addAction(textAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }


    
//    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
//        if(buttonIndex != 0) {
//            //CODE TO ADD APPT TO SAVED APPT
//            performSegueWithIdentifier("bookAppt", sender: nil)
//        }
//    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "bookAppt")
        {
            if let confirmationPage = segue.destinationViewController as? ConfirmationPageViewController {
                confirmationPage.matchProfile = matchProfile
            }
//        } else if (segue.identifier == "PresentBio")
//        {
//            if let bioPopover = segue.destinationViewController as? BioPopoverViewController {
//                bioPopover.bio = matchProfile.bio
//            }
        }
    }


}
