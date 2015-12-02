//
//  FakeData.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/19/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import Foundation

class FakeData {
    
    static let samProfile = Profile(firstName: "Sam", lastName: "Jonesian", dormName: FakeData.Dorms.Arroyo, roomNumber: 102, staffPosition: FakeData.StaffPosition.RA, gender: FakeData.Gender.Female, image: "samPhoto", bio: "Hi, my name is Sam and I am a junior originally from New York state. I study linguistics, and I love talking about all sorts of different languages - I speak 3 of them! I also love taking photographs, especially of nature.", phoneNumber: "4147373103", tags: ["LGBT", "academic stress", "homesickness", "Arroyo", "RA"])
    static let jamieProfile = Profile(firstName: "Jamie", lastName: "Lawyer", dormName: FakeData.Dorms.Branner, roomNumber: 205, staffPosition: FakeData.StaffPosition.RA, gender: FakeData.Gender.Female, image: "jamiePhoto", bio: "Hi, my name is Jamie and I am a junior originally from New York state. I study econ, and I love talking about all sorts of different languages - I speak 3 of them! I also love taking photographs, especially of nature.", phoneNumber: "4147373103", tags: ["LGBT", "academic stress", "homesickness", "Branner", "RA"])
    static let scottProfile = Profile(firstName: "Scott", lastName: "Bushman", dormName: FakeData.Dorms.Larkin, roomNumber: 109, staffPosition: FakeData.StaffPosition.FLIP, gender: FakeData.Gender.Male, image: "scottPhoto", bio: "Hi, my name is Scott and I am a junior originally from New York state. I study linguistics, and I love talking about all sorts of different languages - I speak 3 of them! I also love taking photographs, especially of nature.", phoneNumber: "4147373103", tags: ["LGBT", "academic stress", "homesickness", "Larkin", "FLIP"])
    static let susanProfile = Profile(firstName: "Susan", lastName: "Peterson", dormName: FakeData.Dorms.Otero, roomNumber: 102, staffPosition: FakeData.StaffPosition.PHE, gender: FakeData.Gender.Female, image: "susanPhoto", bio: "Hi, my name is Susan and I am a junior originally from New York state. I study linguistics, and I love talking about all sorts of different languages - I speak 3 of them! I also love taking photographs, especially of nature.", phoneNumber: "4147373103", tags: ["LGBT", "academic stress", "homesickness", "Arroyo", "RA"])
    static let hannahProfile = Profile(firstName: "Hannah", lastName: "Page", dormName: FakeData.Dorms.Arroyo, roomNumber: 207, staffPosition: FakeData.StaffPosition.PHE, gender: FakeData.Gender.Female, image: "hannahPhoto", bio: "Hi, my name is Hannah and I am a junior originally from New York state. I study linguistics, and I love talking about all sorts of different languages - I speak 3 of them! I also love taking photographs, especially of nature.", phoneNumber: "4147373103", tags: ["LGBT", "academic stress", "homesickness", "Arroyo", "PHE"])
    static let skylarProfile = Profile(firstName: "Skylar", lastName: "Roden", dormName: FakeData.Dorms.Arroyo, roomNumber: 112, staffPosition: FakeData.StaffPosition.RA, gender: FakeData.Gender.Female, image: "skylarPhoto", bio: "Hi, my name is Skylar and I am a junior originally from New York state. I study linguistics, and I love talking about all sorts of different languages - I speak 3 of them! I also love taking photographs, especially of nature.", phoneNumber: "4147373103", tags: ["LGBT", "academic stress", "homesickness", "Arroyo", "RA"])
    
    static var favorites = Set<Profile>()
    
    static let genderArray = ["any gender", "female", "male", "non-binary"]
    static let dormArray = ["anywhere", "Arroyo", "Branner", "East Campus", "FloMo", "FroSoCo", "GovCo", "Lagunita", "Larkin", "Rinconada", "Stern", "West Campus", "Wilbur"]
    static let positionArray = ["Any Position", "Bridge", "CM", "FLIP", "PHE", "RA", "RCC", "RF", "SHPRC"]
    static let topicsArray = ["anything", "academics", "conflict", "depression", "failure", "first-gen", "homesickness", "LGBTQ", "race/identity", "relationships", "self-harm", "sexual assault", "sexuality", "stress"]
    
    class func talkMatches() -> [Profile] {
       return [samProfile, jamieProfile, scottProfile, susanProfile]
    }
    
    class func myStaff() -> [Profile] {
        return [samProfile, hannahProfile, skylarProfile]
    }
    
    class func myFavorites() -> [Profile] {
        favorites.insert(samProfile)
        return Array(favorites)
    }
    
    class func recents() -> [Profile] {
        return [samProfile, hannahProfile, skylarProfile, scottProfile]
    }
    
    enum ProfileListType {
        case Staff
        case Recents
        case Favorites
        case Appointments
    }

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
        case Otero
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