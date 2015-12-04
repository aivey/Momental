//
//  CalendarHeaderCollectionReusableView.swift
//  Momental
//
//  Created by Adrienne Ivey on 12/2/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class CalendarHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var profileImage: ImageViewController!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    
    var calInterval: Int! {
        didSet {
            if calInterval == 0 {
                prevButton.enabled = false
                //prevButton.titleLabel?.textColor = Color.mainColor()
            } else if calInterval == maxInterval - 1 {
                nextButton.enabled = false
                //nextButton.titleLabel?.textColor = Color.mainColor()
            } else {
                nextButton.enabled = true
                prevButton.enabled = true
                //nextButton.titleLabel?.textColor = Color.mainColor()
                //prevButton.titleLabel?.textColor = Color.mainColor()
            }
        }
    }
    var date: NSDate!
    var maxInterval: Int!
    var viewController: CalendarViewController!
    var daysOfWeek: [String]!
    
    @IBAction func nextDate(sender: AnyObject) {
        if self.calInterval != nil && self.calInterval < maxInterval - 1 {
            calInterval!++
            setDateLabels()
            viewController.interval = calInterval
            viewController.appointmentCollectionView.reloadData()
        }
    }
   
    @IBAction func previousDate(sender: AnyObject) {
        if self.calInterval != nil && self.calInterval > 0 {
            calInterval!--
            setDateLabels()
            viewController.interval = calInterval
            viewController.appointmentCollectionView.reloadData()
        }
    }
    
    func setDateLabels() {
        let newDate = NSDate(timeInterval: NSTimeInterval(60*60*24*self.calInterval), sinceDate: date)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        dateLabel.text = dateFormatter.stringFromDate(newDate)
        viewController.selectedApptDate = dateLabel.text
        
        if(self.calInterval == 0) {
            dayLabel.text = "Today"
            viewController.selectedApptDay = "Today"
        } else {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let myComponents = myCalendar.components(.Weekday, fromDate: newDate)
            let weekDay = myComponents.weekday
            dayLabel.text = daysOfWeek[weekDay-1]
            viewController.selectedApptDay = dayLabel.text
        }
    }

}
