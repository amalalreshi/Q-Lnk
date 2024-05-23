//
//  UserViewModel.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 20/05/2024.
//


import Foundation
import CloudKit


@MainActor
class UserViewModel: ObservableObject {
    
    private var db = CKContainer.default().privateCloudDatabase
    
    @Published var users: [User] = []
    
   
    func fetchUser(){
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType:"User", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        operation.recordMatchedBlock = { recordId, result in
            DispatchQueue.main.async {
                switch result{
                case .success(let record):
                    let user = User(record: record)
                    self.users.append(user)
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        }
        db.add(operation)
    }
    
    func addUser(_ user: User) {
        
        let record = CKRecord(recordType: "User")
        record["name"] = user.name
        record["phone"] = String(user.phone)
        record["userType"] = user.userType == .driver ? "driver" : "passenger" // Store as String
        

        
        db.save(record){ record, error in
            guard  error  == nil else{
                print(error?.localizedDescription ?? "an unknown error occurred")
                return
            }
        }
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

