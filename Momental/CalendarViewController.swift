//
//  CalendarViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/29/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var profileImage: ImageViewController!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var appointmentCollectionView: UICollectionView!
    
    var profile: Profile!
    var date: NSDate = NSDate()
    var interval = 0
    var daysOfWeek: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    var appts: [NSDate]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.configure(profile.image)
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
        
        dateLabel.text = dateFormatter.stringFromDate(newDate)
        
        if(interval == 0) {
            dayLabel.text = "Today"
        } else {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let myComponents = myCalendar.components(.Weekday, fromDate: newDate)
            let weekDay = myComponents.weekday
            dayLabel.text = daysOfWeek[weekDay]
        }
    }
    
    @IBAction func nextDay(sender: AnyObject) {
        interval++
        setDateLabels(interval)
    }

    @IBAction func previousDay(sender: AnyObject) {
        interval--
        setDateLabels(interval)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AvailableAppointmentCell", forIndexPath: indexPath) 
        return cell
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
