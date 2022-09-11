//
//  CurrentUserData.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 06/09/2022.
//

import Foundation
import FirebaseFirestore

class CurrentUserData: ObservableObject {
    @Published var currentUserData = [User]()
    
    init(emailInputted: String) {
        getUserData(emailToFound: emailInputted)
    }

    func getUserData(emailToFound: String) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("Users").whereField("email", isEqualTo: emailToFound).getDocuments { snapshot, error in
            if error == nil {
                // No error
                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    //cuz the data will cause UI change
                    DispatchQueue.main.async {
                        // Get the doc
                        self.currentUserData = snapshot.documents.map { d in
                            // Return the User for each doc returned
                            return User(id: d.documentID,
                                        phoneNumber: d["phoneNumber"] as? String ?? "",
                                        firstName: d["firstName"] as? String ?? "",
                                        lastName: d["lastName"] as? String ?? "",
                                        dateOfBirth: d["dateOfBirth"] as? String ?? "",
                                        email: d["email"] as? String ?? "",
                                        address: d["address"] as? String ?? "")
                        }
                        print("CURRENTUSER: \(self.currentUserData)")
                    }
                }
            }
        }
    }
    
}
