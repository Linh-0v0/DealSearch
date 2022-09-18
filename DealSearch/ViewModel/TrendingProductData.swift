/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 12/09/2022
  Last modified: 15/09/2022
  Acknowledgement: None
*/

import Foundation

import SwiftUI
import FirebaseFirestore

class TrendingProductData: ObservableObject {
    @Published var trendingProductList = [Product]()
    
    init() {
        getData()
    }
    
    func updateData(productToUpdate: Product, category_id: Int, product_deal: Double, product_image: String, product_name: String, product_price: Double, shop_id: Int) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("TrendingProducts").document(productToUpdate.id).updateData(["category_id": category_id, "product_deal": product_deal, "product_deal_1": 0, "product_image": product_image, "product_name": product_name, "product_price": product_price, "product_price_1": 0, "shop_id": shop_id]) { error in
            if error == nil {
                // no error
                self.getData()
            }
        }
    }
    
    func deleteData(productToDelete: Product) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("TrendingProducts").document(productToDelete.id).delete { error in
            if error == nil {
                // No error
                // Update UI from the main thread
                DispatchQueue.main.async {
                    self.trendingProductList.removeAll { product in
                        return product.id == productToDelete.id
                    }
                }
            }
        }
    }
    
    func addData(productToAdd: Product) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("TrendingProducts").document(productToAdd.id).setData(["category_id": productToAdd.category_id, "product_deal": productToAdd.product_deal, "product_deal_1": 0, "product_image": productToAdd.product_image, "product_name": productToAdd.product_name, "product_price": productToAdd.product_price, "product_price_1": 0, "shop_id": productToAdd.shop_id]) { error in
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
        db.collection("TrendingProducts").getDocuments { snapshot, error in
            if error == nil {
                // No error
                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    //cuz the data will cause UI change
                    DispatchQueue.main.async {
                        // Get all the doc
                        self.trendingProductList = snapshot.documents.map { d in
                            // Return the User for each doc returned
                            return Product(id: d.documentID, category_id: d["category_id"] as? Int ?? 0, product_deal: d["product_deal"] as? Double ?? 0, product_deal_1: d["product_deal_1"] as? Double ?? 0, product_image: d["product_image"] as? String ?? "", product_name: d["product_name"] as? String ?? "", product_price: d["product_price"] as? Double ?? 0, product_price_1: d["product_price_1"] as? Double ?? 0, shop_id: d["shop_id"] as? Int ?? 0)
                        }
                    }
                }
            }
        }
    }
    
}
