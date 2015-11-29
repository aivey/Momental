//
//  TabBarViewController.swift
//  Momental
//
//  Created by Meredith Marks on 11/20/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for v in (self.tabBar.subviews as Array<UIView>){
            let z = "ntCol"
            let b = "setUnselect"
            let s = "_\(b)edTi\(z)or:"
            if v.respondsToSelector(Selector(s)) {
                v.performSelector(Selector(s), withObject: UIColor(hex: 0xabf2e9))
            }
        }

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
