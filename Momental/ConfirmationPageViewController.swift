//
//  ConfirmationPageViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/17/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class ConfirmationPageViewController: UIViewController {

    var matchProfile: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
