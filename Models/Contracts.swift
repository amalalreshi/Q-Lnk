//
//  Contracts.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 20/05/2024.
//


import Foundation
import CloudKit

struct  Contracts{
    
    let id : CKRecord.ID
    let passenger_ID : CKRecord.ID
    let driver_ID : CKRecord.ID
    let contract_Type : String
    let contract_Start : Date
    let contract_End : Date
    let status : String
    let price : Double
    
    init(record:CKRecord){
        self.id = record.recordID
        self.passenger_ID = record.recordID
        self.driver_ID = record.recordID
        self.contract_Type = record["contract_Type "] as? String ?? "N/A"
        self.contract_Start = record["contract_Start"] as? Date ?? Date()
        self.contract_End  = record["contract_End"] as? Date ?? Date()
        self.status = record["status"] as? String ?? "N/A"
        self.price = record["price"] as? Double ?? 0.000
    }
    
}
