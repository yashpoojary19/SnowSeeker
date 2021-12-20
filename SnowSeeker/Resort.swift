//
//  Resort.swift
//  SnowSeeker
//
//  Created by Yash Poojary on 16/12/21.
//

import Foundation

struct Resort: Codable, Identifiable, Comparable {
  
    
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    static var resorts: [Resort] = Bundle.main.decode("resorts.json")
    static var example = resorts[0]
    
    static func < (lhs: Resort, rhs: Resort) -> Bool {
        lhs.id < rhs.id
    }
    
    static func alphabetical (lhs: Resort, rhs: Resort) -> Bool {
        lhs.name < rhs.name
    }
    
    static func country (lhs: Resort, rhs: Resort) -> Bool {
        lhs.country < rhs.country
    }
    
   
}
