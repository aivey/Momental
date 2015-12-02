//
//  CalendarViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/29/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    //@IBOutlet weak var profileImage: ImageViewController!
    
    //@IBOutlet weak var profileImage: ImageViewController!
    @IBOutlet weak var bookButtonView: UIView!
    //@IBOutlet weak var dayLabel: UILabel!
    //@IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var appointmentCollectionView: UICollectionView!
    @IBOutlet weak var bookButton: UIButton!
    
    var profile: Profile!
    var date: NSDate = NSDate()
    var daysOfWeek: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    var selectedApptDay: String?
    var selectedApptDate: String?
    var selectedAppt: String?
    var profilePos: Int?
    var apptPos: Int?
    var interval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appointmentCollectionView.dataSource = self
        appointmentCollectionView.delegate = self
        appointmentCollectionView.allowsMultipleSelection = false
        appointmentCollectionView.backgroundColor = Color.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profile.availableTimesArray[interval]!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AvailableAppointmentCell", forIndexPath: indexPath) as! AppointmentCollectionViewCell
        if let apptTimes = profile.availableTimesArray[interval] {
            cell.timeLabel.text = apptTimes[indexPath.row]
        } else {
            cell.timeLabel.text = "\(Int(arc4random_uniform(12) + 1)):00"
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let apptTimes = profile.availableTimesArray[interval] {
            selectedAppt = "\(selectedApptDay!) \(selectedApptDate!) at \(apptTimes[indexPath.row])"
        } else {
            selectedAppt = "at \(selectedApptDay!) \(selectedApptDate!) Appointment"
        }
        bookButtonView.hidden = false
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        selectedAppt = nil
        bookButtonView.hidden = true
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, shouldDeselectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var reusableView: UICollectionReusableView?
        
        if (kind == UICollectionElementKindSectionHeader) {
             let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", forIndexPath:indexPath) as! CalendarHeaderCollectionReusableView
            headerView.profileImage.configure(profile.image)
            headerView.viewController = self
            headerView.daysOfWeek = daysOfWeek
            headerView.maxInterval = profile.availableTimesArray.count
            headerView.calInterval = interval
            headerView.date = date
            headerView.setDateLabels()
            reusableView = headerView;
        }
        
        return reusableView!;
    }
    
    @IBAction func bookAppointment(sender: AnyObject) {
        if (selectedAppt != nil) {
            apptPos = FakeData.addAppointment(profile, timeString: selectedAppt!)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "bookAppointment") {
            if let confVC = segue.destinationViewController as? ConfirmationPageViewController {
                confVC.matchProfile = profile
                confVC.apptPos = apptPos
            }
        }
    }

}
