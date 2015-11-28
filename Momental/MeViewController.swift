//
//  MeViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/28/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "MyStaffSegue":
                if let dvc = segue.destinationViewController as? ProfileListViewController {
                    dvc.profiles = FakeData.myStaff()
                    dvc.title = "My Staff"
                }
            case "RecentsSegue":
                if let dvc = segue.destinationViewController as? ProfileListViewController {
                    dvc.profiles = FakeData.recents()
                    dvc.title = "Recents"
                }
            case "AppointmentsSegue":
                if let dvc = segue.destinationViewController as? ProfileListViewController {
                    dvc.profiles = FakeData.recents()
                    dvc.title = "Appointments"
                }
            default:
                return
            }
        }
    }
}
