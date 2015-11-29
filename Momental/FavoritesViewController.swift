//
//  FavoritesViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/27/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    var profiles: [Profile] = FakeData.myFavorites()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
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
                    if let indexPath = favoritesTableView.indexPathForCell(cell!) {
                        dvc.profile = profiles[indexPath.row]
                    }
                }
//                if let dvc = segue.destinationViewController as? UINavigationController {
//                    if let pvc = dvc.visibleViewController as? ProfileViewController {
//                        let cell = sender as? PersonTableViewCell
//                        if let indexPath = favoritesTableView.indexPathForCell(cell!) {
//                            pvc.profile = profiles[indexPath.row]
//                        }
//                    }
//                }
            default:
                return
            }
        }
    }
}
