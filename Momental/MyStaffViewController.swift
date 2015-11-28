//
//  MyStaffViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/28/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class MyStaffViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var profileTableView: UITableView!
    
    var profiles: [Profile] = FakeData.myStaff() {
        didSet {
            profileTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as! PersonTableViewCell
        cell.profile = profiles[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("MeProfileSegue", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "MeProfileSegue":
                if let dvc = segue.destinationViewController as? ProfileViewController {
                    let cell = sender as? PersonTableViewCell
                    if let indexPath = profileTableView.indexPathForCell(cell!) {
                        dvc.profile = profiles[indexPath.row]
                    }
                }
            default:
                return
            }
        }
    }
}
