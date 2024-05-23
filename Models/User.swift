//
//  User.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 20/05/2024.
// in CloudKit is Profile 

import Foundation
import CloudKit


enum UserType {
    case driver
    case passenger
}

struct User {
    
    var recordId: CKRecord.ID?
    let name: String
    let phone: String
    let carType: String
    let carModel: Int
    let carColor: String
    let carNum: Int
    let carImage: [Data]
    var userType: UserType
    
    init(record: CKRecord) {
        self.recordId = record.recordID
        self.name = record["name"] as? String ?? "N/A"
        self.phone = record["phone"] as? String ?? "N/A"
        self.carType = record["carType"] as? String ?? "N/A"
        self.carModel = record["carModel"] as? Int ?? 0000
        self.carColor = record["carColor"] as? String ?? "N/A"
        self.carNum  = record["carNum"] as? Int ?? 0000
        self.carImage = record["carImage"] as? [Data] ?? []
        self.userType = record["userType"] as? Bool ?? false ? .driver : .passenger
    }
    
    // Second initializer for simpler passenger user creation
    init(name: String, phone: String, userType: UserType) {
        self.name = name
        self.phone = phone
        self.userType = userType

        // Set all other properties to default values as they are not relevant for passengers
        self.carType = "N/A"
        self.carModel = 0
        self.carColor = "N/A"
        self.carNum  = 0
        self.carImage = []
        self.recordId = nil  // Assuming no record ID is needed at the time of this initializer's usage
    }
}
