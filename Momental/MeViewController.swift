//
//  MeViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/28/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    @IBOutlet weak var staffButton: UIButton!
    @IBOutlet weak var recentsButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var apptButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons(true, top: false, left: false, right: true, btn: staffButton)
        setUpButtons(true, top: false, left: true, right: false, btn: recentsButton)
        setUpButtons(false, top: true, left: false, right: true, btn: apptButton)
        setUpButtons(false, top: true, left: true, right: false, btn: settingsButton)
        
        // Do any additional setup after loading the view.
    }
    
    func setUpButtons(bottom: Bool, top: Bool, left: Bool, right: Bool, btn: UIButton) {
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.minimumScaleFactor = 0.6
        
        if bottom {
            let bottomBorder = UIView(frame: CGRectMake(0, btn.frame.size.height, btn.frame.size.width, 1))
            bottomBorder.backgroundColor = UIColor.mainColor()
            btn.addSubview(bottomBorder)
        }
        
        if top {
            let topBorder = UIView(frame: CGRectMake(0, 1, btn.frame.size.width, 1))
            topBorder.backgroundColor = UIColor.mainColor()
            btn.addSubview(topBorder)
        }
        
        if left {
            let leftBorder = UIView(frame: CGRectMake(0, 0, 1, btn.frame.size.height))
            leftBorder.backgroundColor = UIColor.mainColor()
            btn.addSubview(leftBorder)
        }
        
        if right {
            let rightBorder = UIView(frame: CGRectMake(btn.frame.size.width - 1, 0, 1, btn.frame.size.height))
            rightBorder.backgroundColor = UIColor.mainColor()
            btn.addSubview(rightBorder)
        }
        
        //btn.centerLabelVerticallyWithPadding(6)
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
                    dvc.type = FakeData.ProfileListType.Staff
                    dvc.title = "My Staff"
                }
            case "RecentsSegue":
                if let dvc = segue.destinationViewController as? ProfileListViewController {
                    dvc.profiles = FakeData.recents()
                    dvc.type = FakeData.ProfileListType.Recents
                    dvc.title = "Recents"
                }
            case "AppointmentsSegue":
                if let dvc = segue.destinationViewController as? ProfileListViewController {
                    dvc.profiles = FakeData.appointmentsMap
                    dvc.type = FakeData.ProfileListType.Appointments
                    dvc.title = "Appointments"
                }
            default:
                return
            }
        }
    }
}

extension UIButton {
    func centerLabelVerticallyWithPadding(spacing:CGFloat) {
        // update positioning of image and title
        let imageSize = self.imageView!.frame.size
        self.titleEdgeInsets = UIEdgeInsets(top:0,
            left:-imageSize.width,
            bottom:-(imageSize.height + spacing),
            right:0)
        let titleSize = self.titleLabel!.frame.size
        self.imageEdgeInsets = UIEdgeInsets(top:-(titleSize.height + spacing),
            left:0,
            bottom: 0,
            right:-titleSize.width)
        
        // reset contentInset, so intrinsicContentSize() is still accurate
        let trueContentSize = CGRectUnion(self.titleLabel!.frame, self.imageView!.frame).size
        let oldContentSize = self.intrinsicContentSize()
        let heightDelta = trueContentSize.height - oldContentSize.height
        let widthDelta = trueContentSize.width - oldContentSize.width
        self.contentEdgeInsets = UIEdgeInsets(top:heightDelta/2.0,
            left:widthDelta/2.0,
            bottom:heightDelta/2.0,
            right:widthDelta/2.0)
    }
}

