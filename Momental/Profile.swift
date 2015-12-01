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
    }
    
    var hashValue: Int {
        get {
            return firstName.hashValue << 15 + lastName.hashValue
        }
    }
}

func ==(lhs: Profile, rhs: Profile) -> Bool {
    return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
}

