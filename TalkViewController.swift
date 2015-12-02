//
//  TalkViewController.swift
//  Momental
//
//  Created by Meredith Marks on 11/19/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class TalkViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var topicPicker: UIPickerView!
    
    var locationPickerData: [String] = [String]()
    var genderPickerData: [String] = [String]()
    var topicPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        
        self.genderPicker.delegate = self
        self.genderPicker.dataSource = self
        
        self.topicPicker.delegate = self
        self.topicPicker.dataSource = self

        
        locationPickerData = FakeData.dormArray //["anywhere", "on east campus", "on west campus"]
        genderPickerData = FakeData.genderArray //["any gender", "male", "female", "nonbinary"]
        topicPickerData = FakeData.topicsArray //["anything", "LGBT", "relationships", "academic stress", "homesickness", "first-gen"]

        topicPicker.selectRow(14, inComponent:0, animated:false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == locationPicker {
            return locationPickerData.count
        }
        if pickerView == genderPicker {
            return genderPickerData.count
        }
        if pickerView == topicPicker {
            return 6000
        }
        return 1
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == locationPicker {
            return locationPickerData[row]
        }
        if pickerView == genderPicker {
            return genderPickerData[row]
        }
        if pickerView == topicPicker {
            return topicPickerData[row % topicPickerData.count]
        }
        return "fuck"
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
