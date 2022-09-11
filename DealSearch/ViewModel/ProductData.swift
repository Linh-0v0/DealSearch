//
//  GetProductData.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 28/08/2022.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class ProductData: ObservableObject {
    @Published var productList = [Product]()
    
    init() {
        getData()
    }
    
    func updateData(productToUpdate: Product) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("Products").document(productToUpdate.id).updateData(["product_name": "\(productToUpdate.product_name)"]) { error in
            if error == nil {
                // no error
                self.getData()
            }
        }
    }
    
    func deleteData(productToDelete: Product) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("Products").document(productToDelete.id).delete { error in
            if error == nil {
                // No error
                // Update UI from the main thread
                DispatchQueue.main.async {
                    self.productList.removeAll { product in
                        return product.id == productToDelete.id
                    }
                }
            }
        }
    }
    
    func addData(category_id: Int, product_deal: Double, product_deal_1: Double, product_image: String, product_name: String, product_price: Double, product_price_1: Double, shop_id: Int) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("Products").addDocument(data: ["category_id": category_id, "product_deal": product_deal, "product_deal_1": product_deal_1, "product_image": product_image, "product_name": product_name, "product_price": product_price, "product_price_1": product_price_1, "shop_id": shop_id]) { error in
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
        db.collection("Products").getDocuments { snapshot, error in
            if error == nil {
                // No error
                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    //cuz the data will cause UI change
                    DispatchQueue.main.async {
                        // Get all the doc
                        self.productList = snapshot.documents.map { d in
                            // Return the User for each doc returned
                            return Product(id: d.documentID, category_id: d["category_id"] as? Int ?? 0, product_deal: d["product_deal"] as? Double ?? 0, product_deal_1: d["product_deal_1"] as? Double ?? 0, product_image: d["product_image"] as? String ?? "", product_name: d["product_name"] as? String ?? "", product_price: d["product_price"] as? Double ?? 0, product_price_1: d["product_price_1"] as? Double ?? 0, shop_id: d["shop_id"] as? Int ?? 0)
                        }
                    }
                }
            }
        }
    }
    
}
