//
//  UserData.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 03/09/2022.
//

import Foundation
import FirebaseFirestore

class UserData: ObservableObject {
    
    @Published var userList = [User]()
    
    init() {
        getData()
    }
    
    func updateData(userToUpdate: User) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("Users").document(userToUpdate.id).updateData(["email": "\(userToUpdate.email)"]) { error in
            if error == nil {
                // no error
                self.getData()
            }
        }
    }
    
    func deleteData(userToDelete: User) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("Users").document(userToDelete.id).delete { error in
            if error == nil {
                // No error
                // Update UI from the main thread
                DispatchQueue.main.async {
                    self.userList.removeAll { user in
                        return user.id == userToDelete.id
                    }
                }
                
                
            }
        }
    }
    
    func addData(phoneNum: String, firstName: String, lastName: String, password: String, email: String, dateOfBirth: String, address: String) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("Users").addDocument(data: ["phoneNumber" : phoneNum, "firstName": firstName, "lastName": lastName, "email": email, "dateOfBirth": dateOfBirth, "address": address]) { error in
            if error == nil {
                // No error
                // Call getData to retreive the lastest data
                self.getData()
                
            }
        }
    }
    
    func getData() {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Read the doc at specific path
        db.collection("Users").getDocuments { snapshot, error in
            if error == nil {
                // No error
                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    //cuz the data will cause UI change
                    DispatchQueue.main.async {
                        // Get all the doc
                        self.userList = snapshot.documents.map { d in
                            // Return the User for each doc returned
                            return User(id: d.documentID,
                                        phoneNumber: d["phoneNumber"] as? String ?? "",
                                        firstName: d["firstName"] as? String ?? "",
                                        lastName: d["lastName"] as? String ?? "",
                                        dateOfBirth: d["dateOfBirth"] as? String ?? "",
                                        email: d["email"] as? String ?? "",
                                        address: d["address"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
}
