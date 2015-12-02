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
    var interval = 0
    var daysOfWeek: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    var selectedAppt: String?
    var profilePos: Int?
    var apptPos: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appointmentCollectionView.dataSource = self
        appointmentCollectionView.delegate = self
        appointmentCollectionView.allowsMultipleSelection = false
        appointmentCollectionView.backgroundColor = Color.whiteColor()
        //profileImage.configure(profile.image)
        setDateLabels(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDateLabels(interval: Int) {
        let newDate = NSDate(timeInterval: NSTimeInterval(60*60*24*interval), sinceDate: date)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        //dateLabel.text = dateFormatter.stringFromDate(newDate)
        
        if(interval == 0) {
            //dayLabel.text = "Today"
        } else {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let myComponents = myCalendar.components(.Weekday, fromDate: newDate)
            let weekDay = myComponents.weekday
            //dayLabel.text = daysOfWeek[weekDay]
        }
    }
    
    @IBAction func nextDay(sender: AnyObject) {
        if interval < profile.availableTimesArray.count {
            interval++
            setDateLabels(interval)
            appointmentCollectionView.reloadData()
        }
    }

    @IBAction func previousDay(sender: AnyObject) {
        if interval > 0 {
            interval--
            setDateLabels(interval)
            appointmentCollectionView.reloadData()
        }
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
        //cell.backgroundView?.layer.borderWidth = 1
        //cell.backgroundView?.layer.borderColor = UIColor.grayColor().CGColor
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.grayColor().CGColor
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AvailableAppointmentCell", forIndexPath: indexPath) as! AppointmentCollectionViewCell
        if let apptTimes = profile.availableTimesArray[interval] {
            selectedAppt = "Day Date \(apptTimes[indexPath.row])"
        } else {
            selectedAppt = "Day Date Apointment"
        }
        bookButtonView.hidden = false
        cell.contentView.layer.borderColor = UIColor.blueColor().CGColor
        print("Selected")
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AvailableAppointmentCell", forIndexPath: indexPath) as! AppointmentCollectionViewCell
        selectedAppt = nil
        bookButtonView.hidden = true
        cell.contentView.layer.borderColor = UIColor.grayColor().CGColor
        print("deselected")
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
