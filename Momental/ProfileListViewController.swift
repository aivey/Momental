//
//  ProfileListViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/28/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class ProfileListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var profileTableView: UITableView!
    
    var profiles: [Profile] = FakeData.myFavorites() {
        didSet {
            profileTableView?.reloadData()
        }
    }
    var type: FakeData.ProfileListType = FakeData.ProfileListType.Favorites
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.delegate = self
        profileTableView.dataSource = self
        if (type == .Favorites) {
            self.title = "Favorites"
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (type == .Favorites) {
            profiles = FakeData.myFavorites()
        }
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
        print(FakeData.appointments)
        if (type == .Appointments) {
            var count = 0
            for(var i = 0; i < profiles.count; i++) {
                if let appts = FakeData.appointments[profiles[i]] {
                    count += appts.count
                }
            }
            return count
        } else {
            return profiles.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as! PersonTableViewCell
        cell.type = type
        if (type != .Appointments) {
            cell.profile = profiles[indexPath.row]
        } else {
            var count = indexPath.row
            for(var i = 0; i < FakeData.appointmentsMap.count; i++) {
                let prof = FakeData.appointmentsMap[i]
                let numAppts = FakeData.appointments[prof]?.count
                if(count < numAppts) {
                    cell.apptString = FakeData.appointments[prof]?[count]
                    cell.profile = prof
                } else {
                    count = count - numAppts!
                }
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ProfileSegue", sender: tableView.cellForRowAtIndexPath(indexPath))
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "ProfileSegue":
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
