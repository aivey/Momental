//
//  MatchPageViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/15/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class MatchPageContentViewController: UIViewController {

    var matchProfile: String! = "Sam P."
    var pageIndex: Int?
    
    @IBOutlet weak var matchImageView: ImageViewController!
    
    @IBOutlet weak var matchNameLabel: UILabel!

    @IBOutlet weak var matchMessageLabel: UILabel!
    
    @IBOutlet weak var viewBioButton: UIButton!
    
    @IBOutlet weak var bookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchImageView.configure()
        matchNameLabel.text = matchProfile
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
