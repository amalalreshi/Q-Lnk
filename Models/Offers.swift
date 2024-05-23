//
//  Offers.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 20/05/2024.
//

import Foundation
import CloudKit

struct Offers{
    
    let id : CKRecord.ID
    let post_ID : CKRecord.ID
    let passenger_ID : CKRecord.ID
    let driver_ID : CKRecord.ID
    let status : String
    let price : Double
    
    init(record:CKRecord){
        self.id = record.recordID
        self.post_ID = record.recordID
        self.passenger_ID = record.recordID
        self.driver_ID = record.recordID
        self.status = record["status"] as? String ?? "N/A"
        self.price = record["price"] as? Double ?? 0.000
    }
    
}
