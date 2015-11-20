//
//  FakeData.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/19/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import Foundation

class FakeData {
    
    static let samProfile = Profile(firstName: "Sam", lastName: "Regal", dormName: FakeData.Dorms.Arroyo, roomNumber: 102, staffPosition: FakeData.StaffPosition.RA, gender: FakeData.Gender.Female, image: "samPhoto", bio: "This is my bio...")
    static let jamieProfile = Profile(firstName: "Jamie", lastName: "Lawyer", dormName: FakeData.Dorms.Branner, roomNumber: 205, staffPosition: FakeData.StaffPosition.RA, gender: FakeData.Gender.Female, image: "jamiePhoto", bio: "This is my bio...")
    static let scottProfile = Profile(firstName: "Scott", lastName: "Bush", dormName: FakeData.Dorms.Larkin, roomNumber: 109, staffPosition: FakeData.StaffPosition.FLIP, gender: FakeData.Gender.Male, image: "scottPhoto", bio: "This is my bio...")
    static let susanProfile = Profile(firstName: "Susan", lastName: "Peters", dormName: FakeData.Dorms.Rinconada, roomNumber: 102, staffPosition: FakeData.StaffPosition.PHE, gender: FakeData.Gender.Female, image: "susanPhoto", bio: "This is my bio...")
    static let hannahProfile = Profile(firstName: "Hannah", lastName: "Page", dormName: FakeData.Dorms.Arroyo, roomNumber: 207, staffPosition: FakeData.StaffPosition.PHE, gender: FakeData.Gender.Female, image: "hannahPhoto", bio: "This is my bio...")
    static let skylarProfile = Profile(firstName: "Skylar", lastName: "Roden", dormName: FakeData.Dorms.Arroyo, roomNumber: 112, staffPosition: FakeData.StaffPosition.RA, gender: FakeData.Gender.Female, image: "skylarPhoto", bio: "This is my bio...")
    
    class func talkMatches() -> [Profile] {
       return [samProfile, jamieProfile, scottProfile, susanProfile]
    }
    
    class func myStaff() -> [Profile] {
        return [samProfile, hannahProfile, skylarProfile]
    }
    
    static let genderArray = ["Any Gender", "Female", "Male", "None"]
    static let dormArray = ["Anywhere", "Arroyo", "Branner", "East Campus", "Flomo", "FroSoCo", "GovCo", "Lagunita", "Larkin", "Rinconada", "Stern", "West Campus", "Wilbur"]
    static let positionArray = ["Any Position", "Bridge", "CM", "FLIP", "PHE", "RA", "RCC", "RF", "SHPRC"]
    static let topicsArray = ["Anything", "Academics", "Conflict", "Depression", "Failure", "First-Gen", "Homesickness", "LGBTQ", "Race/Identity", "Relationships", "Self-Harm", "Sexual Assault", "Sexuality", "Stress"]

    enum Gender {
        case Female
        case Male
        case None
        
        static var count: Int { return Gender.None.hashValue + 1}
    }

    enum Dorms {
        case Larkin
        case Branner
        case Arroyo
        case Rinconada
        case Wilbur
        case EastCampus
        case WestCampus
        case Stern
        case Flomo
        case FroSoCo
        case GovCo
        case Lagunita
        
        static var count: Int { return Dorms.Lagunita.hashValue + 1}
    }

    enum StaffPosition {
        case RA
        case RCC
        case PHE
        case Bridge
        case CM
        case RF
        case SHPRC
        case FLIP
        
        static var count: Int { return StaffPosition.FLIP.hashValue + 1}
    }
    
    enum Topics {
        case Academics
        case Conflict
        case Depression
        case Failure
        case FirstGen
        case Homesickness
        case LGBTQ
        case RaceAndIdentity
        case Relationships
        case SelfHarm
        case SexualAssault
        case Sexuality
        case Stress
        
        static var count: Int { return Topics.Stress.hashValue + 1}
    }
}