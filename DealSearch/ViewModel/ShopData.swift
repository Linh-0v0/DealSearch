/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 26/08/2022
  Last modified: 08/09/2022
  Acknowledgement: None
*/

import Foundation
import FirebaseFirestore

class ShopData: ObservableObject {
    @Published var shopList = [Shop]()
    
    init() {
        getData()
    }
    
    func updateData(shopToUpdate: Shop, shop_name: String, shop_logo: String) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("Shops").document(shopToUpdate.id).updateData(["shop_name": shop_name, "shop_logo": shop_logo]) { error in
            if error == nil {
                // no error
                self.getData()
            }
        }
    }
    
    func deleteData(shopToDelete: Shop) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("Shops").document(shopToDelete.id).delete { error in
            if error == nil {
                // No error
                // Update UI from the main thread
                DispatchQueue.main.async {
                    self.shopList.removeAll { shop in
                        return shop.id == shopToDelete.id
                    }
                }
            }
        }
    }
    
    func addData(shop_logo: String, shop_name: String) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("Shops").addDocument(data: ["shop_logo": shop_logo, "shop_name": shop_name]) { error in
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
        db.collection("Shops").getDocuments { snapshot, error in
            if error == nil {
                // No error
                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    //cuz the data will cause UI change
                    DispatchQueue.main.async {
                        // Get all the doc
                        self.shopList = snapshot.documents.map { d in
                            // Return the User for each doc returned
                            return Shop(id: d.documentID, shop_logo: d["shop_logo"] as? String ?? "", shop_name: d["shop_name"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
}

