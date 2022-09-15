//
//  CategoryData.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 29/08/2022.
//

import Foundation
import FirebaseFirestore

class CategoryData: ObservableObject {
    @Published var categoryList = [Category]()
   
    init() {
        getData()
    }
    
    func updateData(categoryToUpdate: Category, category_name: String, category_image: String) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("Category").document(categoryToUpdate.id).updateData(["category_name": category_name, "category_image": category_image]) { error in
            if error == nil {
                // no error
                self.getData()
            }
        }
    }
    
    func deleteData(categoryToDelete: Category) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("Category").document(categoryToDelete.id).delete { error in
            if error == nil {
                // No error
                // Update UI from the main thread
                DispatchQueue.main.async {
                    self.categoryList.removeAll { category in
                        return category.id == categoryToDelete.id
                    }
                }
            }
        }
    }
    
    func addData(category_image: String, category_name: String) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        db.collection("Category").addDocument(data: ["category_image": category_image, "category_name": category_name]) { error in
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
        db.collection("Category").getDocuments { snapshot, error in
            if error == nil {
                // No error
                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    //cuz the data will cause UI change
                    DispatchQueue.main.async {
                        // Get all the doc
                        self.categoryList = snapshot.documents.map { d in
                            // Return the User for each doc returned
                            return Category(id: d.documentID, category_image: d["category_image"] as? String ?? "", category_name: d["category_name"] as? String ?? "")
                        }
                        print(self.categoryList)
                    }
                }
            }
        }
    }
    
}
