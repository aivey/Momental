//
//  FakeData.swift
//  Momental
//
//  Created by Adrienne Ivey on 11/19/15.
//  Copyright © 2015 CS147 Mometal Team. All rights reserved.
//

import Foundation

class FakeData {
    
    let samProfile = Profile()
    let jamieProfile = Profile()
    let scottProfile = Profile()
    let susanProfile = Profile()
    let hannahProfile = Profile()
    let skylarProfile = Profile()
    
    class func talkMatches() -> [Profile] {
       return [samProfile, jamieProfile, scottProfile, susanProfile]
    }
    
    class func myStaff() -> [Profile] {
        return [samProfile, hannahProfile, skylarProfile]
    }

    enum Gender {
        case Female
        case Male
        case None
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
    }
}