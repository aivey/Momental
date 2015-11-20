//
//  TalkViewController.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/19/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class TalkViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var topicPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configurePickers() {
        locationPicker.dataSource = self
        locationPicker.delegate = self
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        topicPicker.dataSource = self
        topicPicker.delegate = self
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == locationPicker {
            return FakeData.dormArray.count
        } else if pickerView == genderPicker {
            return FakeData.genderArray.count
        } else if pickerView == topicPicker {
            return FakeData.topicsArray.count
        }
        
        return 0
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var data: [String]?
        if pickerView == locationPicker {
            data = FakeData.dormArray
        } else if pickerView == genderPicker {
            data = FakeData.genderArray
        } else if pickerView == topicPicker {
            data = FakeData.topicsArray
        }
        
        return data![row]
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
