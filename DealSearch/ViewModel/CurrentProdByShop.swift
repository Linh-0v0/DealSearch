/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 17/09/2022
  Last modified: 17/09/2022
  Acknowledgement: None
*/

import Foundation
import FirebaseFirestore

class CurrentProdByShop: ObservableObject {
    @Published var currentProduct = [Product]()
    
    init(shopClickedId: Int) {
        getData(shopClickedId: shopClickedId)
    }
    
    func getData(shopClickedId: Int) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Read the doc at specific path
        db.collection("Products").whereField("shop_id", isEqualTo: shopClickedId).getDocuments { snapshot, error in
            if error == nil {
                // No error
                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    //cuz the data will cause UI change
                    DispatchQueue.main.async {
                        // Get all the doc
                        self.currentProduct = snapshot.documents.map { d in
                            // Return the User for each doc returned
                            return Product(id: d.documentID, category_id: d["category_id"] as? Int ?? 0, product_deal: d["product_deal"] as? Double ?? 0, product_deal_1: d["product_deal"] as? Double ?? 0, product_image: d["product_image"] as? String ?? "", product_name: d["product_name"] as? String ?? "", product_price: d["product_price"] as? Double ?? 0, product_price_1: d["product_price_1"] as? Double ?? 0, shop_id: d["shop_id"] as? Int ?? 0)
                        }
                    }
                }
            }
        }
    }
    
}
