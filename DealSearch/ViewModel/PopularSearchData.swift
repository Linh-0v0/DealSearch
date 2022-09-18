/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 12/09/2022
  Last modified: 16/09/2022
  Acknowledgement: None
*/

import Foundation
import FirebaseFirestore

class PopularSearchData: ObservableObject {
    @Published var popularSearchList = [PopularSearch]()
    
    init() {
        getData()
    }
    
    func updateData(searchctToUpdate: Product, category_id: Int, product_name: String) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("PopularSearch").document(searchctToUpdate.id).updateData(["category_id": category_id, "product_name": product_name]) { error in
            if error == nil {
                // no error
                self.getData()
            }
        }
    }
    
    func deleteData(searchToDelete: PopularSearch) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("PopularSearch").document(searchToDelete.id).delete { error in
            if error == nil {
                // No error
                // Update UI from the main thread
                DispatchQueue.main.async {
                    self.popularSearchList.removeAll { search in
                        return search.id == searchToDelete.id
                    }
                }
            }
        }
    }
    
    func addData(productToAdd: Product) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("PopularSearch").document(productToAdd.id).setData(["category_id": productToAdd.category_id, "product_name": productToAdd.product_name]) { error in
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
        db.collection("PopularSearch").getDocuments { snapshot, error in
            if error == nil {
                // No error
                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    //cuz the data will cause UI change
                    DispatchQueue.main.async {
                        // Get all the doc
                        self.popularSearchList = snapshot.documents.map { d in
                            // Return the User for each doc returned
                            return PopularSearch(id: d.documentID, category_id: d["category_id"] as? Int ?? 0, product_name: d["product_name"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
}
