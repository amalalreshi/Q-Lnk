//
//  Post.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 20/05/2024.
//

import Foundation
import CloudKit

enum TripType: String {
    case oneWay = "One Way"
    case roundTrip = "Round Trip"
}

enum WorkType: String {
    case fullTime = "Full Time"
    case partTime = "Part Time"
}

enum ContractType: String {
    case temporary = "Temporary"
    case permanent = "Permanent"
}

struct Post {
    
    var recordId: CKRecord.ID?
    var user_ID: CKRecord.ID?
    let first_Destination: String
    let trip_Type: TripType
    var time_Arrive: Date
    let num_People: Int
    let second_Destination: String
    let work_Type: WorkType
    let days_Work: Int
    var time_End: Date
    let contract_Type: ContractType
    var contract_Start: Date
    var contract_End: Date
    let tittle: String
    let notes: String
    
    init(record: CKRecord) {
        self.recordId = record.recordID
        self.user_ID = record.recordID
        self.first_Destination = record["first_Destination"] as? String ?? "N/A"
        self.trip_Type = TripType(rawValue: record["trip_Type"] as? String ?? "") ?? .oneWay
        self.time_Arrive = record["time_Arrive"] as? Date ?? Date()
        self.num_People = record["num_People"] as? Int ?? 0
        self.second_Destination = record["second_Destination"] as? String ?? "N/A"
        self.work_Type = WorkType(rawValue: record["work_Type"] as? String ?? "") ?? .fullTime
        self.days_Work = record["days_Work"] as? Int ?? 0
        self.time_End = record["time_End"] as? Date ?? Date()
        self.contract_Type = ContractType(rawValue: record["contract_Type"] as? String ?? "") ?? .temporary
        self.contract_Start = record["contract_Start"] as? Date ?? Date()
        self.contract_End = record["contract_End"] as? Date ?? Date()
        self.tittle = record["tittle"] as? String ?? "N/A"
        self.notes = record["notes"] as? String ?? "N/A"
    }
}
