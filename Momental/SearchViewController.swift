//
//  SearchViewController.swift
//  Momental
//
//  Created by Meredith Marks on 12/2/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var filtersLabel: UILabel!
    @IBOutlet weak var filtersScrollView: UIScrollView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var locationScrollView: UIScrollView!
    @IBOutlet weak var roleScrollView: UIScrollView!
    @IBOutlet weak var topicScrollView: UIScrollView!
    
    var selectedFilters = [String]()
    var labelSize = CGSize()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.returnKeyType = .Done
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.delegate = self

        labelSize = filtersLabel.frame.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedFilter(sender: UITapGestureRecognizer) {
//        print(sender.
        let point = sender.locationInView(view)
        if let tappedView = view.hitTest(point, withEvent: nil) {
            if let tappedLabel = tappedView as? UILabel {
                if selectedFilters.contains(tappedLabel.text!) {
                    tappedLabel.backgroundColor = UIColor.whiteColor()
                    tappedLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
                    tappedLabel.textColor = Color.mainColor()
                    selectedFilters.removeAtIndex(selectedFilters.indexOf(tappedLabel.text!)!)
                } else {
                    tappedLabel.backgroundColor = Color.mainColor()
                    tappedLabel.layer.borderColor = Color.mainColor().CGColor
                    tappedLabel.textColor = UIColor.whiteColor()
                    tappedLabel.layer.masksToBounds = true
                    selectedFilters.append(tappedLabel.text!)
                }
                
//                if selectedFilters.isEmpty {
//                    filtersLabel.text? = "type to search, tap tags to filter"
//                    filtersLabel.frame.size = labelSize
//                } else {
//                    filtersLabel.text? = "Filters: \(selectedFilters.joinWithSeparator(", "))"
//                    filtersLabel.sizeToFit()
//                    filtersScrollView.contentSize = CGSize(width: filtersLabel.frame.size.width + 16, height: filtersLabel.frame.size.height)
//                    if filtersLabel.frame.size.width + 48 > view.frame.size.width {
//                        filtersScrollView.contentOffset = CGPoint(x: filtersLabel.frame.size.width + 48 - view.frame.size.width, y: 0)
//                    }
//                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Search":
                if let dvc = segue.destinationViewController as? ProfileListViewController {
                    dvc.profiles = FakeData.myStaff()
                    dvc.type = FakeData.ProfileListType.Staff
                    dvc.title = "Results"
                }
            default:
                return
            }
        }

    }
    
    @IBAction func reset() {
        searchBar.text = "";
        selectedFilters.removeAll()
        FakeData.clearAppointments()
        for curr in locationScrollView.subviews {
            if let label = curr as? UILabel {
                label.backgroundColor = UIColor.whiteColor()
                label.layer.borderColor = UIColor.lightGrayColor().CGColor
                label.textColor = Color.mainColor()
            }
        }
        
        for curr in roleScrollView.subviews {
            if let label = curr as? UILabel {
                label.backgroundColor = UIColor.whiteColor()
                label.layer.borderColor = UIColor.lightGrayColor().CGColor
                label.textColor = Color.mainColor()
            }
        }
        
        for curr in topicScrollView.subviews {
            if let label = curr as? UILabel {
                label.backgroundColor = UIColor.whiteColor()
                label.layer.borderColor = UIColor.lightGrayColor().CGColor
                label.textColor = Color.mainColor()
            }
        }
        
    }

}
