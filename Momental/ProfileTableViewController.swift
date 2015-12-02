//
//  ProfileTableViewController.swift
//  Momental
//
//  Created by Meredith Marks on 11/20/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    var profile: Profile!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell", forIndexPath: indexPath)

        if (indexPath.row == 0) {
            cell.textLabel?.text = "Next\nAvailable"
            cell.detailTextLabel?.text = "Monday 7PM";
        } else if (indexPath.row == 1) {
            cell.textLabel?.text = "Bio"
//            if indexPath.row == selectedRowIndex.row {
                cell.detailTextLabel?.text = "\(profile.bio)";
//            } else {
//                cell.detailTextLabel?.text = "click for more";
//            }
        } else if (indexPath.row == 2) {
            cell.textLabel?.text = "Tags"
            cell.detailTextLabel?.text = profile.tags.joinWithSeparator(", ")

        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (selectedRowIndex == indexPath) {
            selectedRowIndex = NSIndexPath(forRow: -1, inSection: 0)
            tableView.reloadData()
        } else {
            selectedRowIndex = indexPath
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    
    var selectedRowIndex: NSIndexPath = NSIndexPath(forRow: -1, inSection: 0)
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 60;
        }
        if (indexPath.row == 1) {
//            if indexPath.row == selectedRowIndex.row {
//                return UITableViewAutomaticDimension
//            }
            return 180

        }
        if (indexPath.row == 2) {
            return 60;
        }
        return 60;
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
