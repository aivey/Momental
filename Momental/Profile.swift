//
//  Profile.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/19/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import Foundation
import UIKit

class Profile: Equatable, Hashable {
    var firstName: String!
    var lastName: String!
    var dorm: FakeData.Dorms!
    var roomNumber: Int!
    var staffPosition: FakeData.StaffPosition!
    var gender: FakeData.Gender!
    var image: String!
    var bio: String!
    var phoneNumber: String!
    var tags: [String]!
    var availableTimesArray: [Int: [String]]!
    var availableNow: Bool
    
    init(firstName: String, lastName: String, dormName: FakeData.Dorms, roomNumber: Int, staffPosition: FakeData.StaffPosition, gender: FakeData.Gender, image: String, bio: String, phoneNumber: String, tags: [String]) {
        self.firstName = firstName
        self.lastName = lastName
        self.dorm = dormName
        self.roomNumber = roomNumber
        self.staffPosition = staffPosition
        self.gender = gender
        self.image = image
        self.bio = bio
        self.phoneNumber = phoneNumber
        self.tags = tags;
        self.availableNow = Int(arc4random_uniform(5)) == 1
        self.availableTimesArray = [Int: [String]]()
        setUpAvailableTimesArray()
    }
    
    func setUpAvailableTimesArray() {
        for(var days = 0; days < 5; days++) {
            availableTimesArray[days] = []
            var fakeTimes = Set<Int>()
            let numTimes = Int(arc4random_uniform(7) + 1)
            for(var i = 0; i < numTimes; i++) {
                fakeTimes.insert(Int(arc4random_uniform(10) + 1))
            }
            var arr = Array(fakeTimes).sort()
            for(var x = 0; x < arr.count; x++) {
                availableTimesArray[days]!.append("\(arr[x]):00")
            }
        }
    }
    
    var hashValue: Int {
        get {
            return "\(firstName),\(lastName),\(phoneNumber)".hashValue
            //return firstName.hashValue << 15 + lastName.hashValue
        }
    }
}

func ==(lhs: Profile, rhs: Profile) -> Bool {
    return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
}

