//
//  CurrentSearchData.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 13/09/2022.
//

import Foundation
import FirebaseFirestore

class CurrentProductData: ObservableObject {
    @Published var currentProduct = [Product]()
    
    init(categoryClickedId: Int) {
        getData(categoryClickedId: categoryClickedId)
    }
    
    func getData(categoryClickedId: Int) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Read the doc at specific path
        db.collection("Products").whereField("category_id", isEqualTo: categoryClickedId).getDocuments { snapshot, error in
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
