/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 13/09/2022
  Last modified: 15/09/2022
  Acknowledgement: None
*/

import Foundation
import FirebaseFirestore

class CurrentSearchData: ObservableObject {
    @Published var currentSearch = [PopularSearch]()
    
    init(categoryClickedId: Int) {
        getData(categoryClickedId: categoryClickedId)
    }
    
    func getData(categoryClickedId: Int) {
        // Get a reference to db
        let db = Firestore.firestore()
        
        // Read the doc at specific path
        db.collection("PopularSearch").whereField("category_id", isEqualTo: categoryClickedId).getDocuments { snapshot, error in
            if error == nil {
                // No error
                if let snapshot = snapshot {
                    // Update the list property in the main thread
                    //cuz the data will cause UI change
                    DispatchQueue.main.async {
                        // Get all the doc
                        self.currentSearch = snapshot.documents.map { d in
                            // Return the User for each doc returned
                            return PopularSearch(id: d.documentID, category_id: d["category_id"] as? Int ?? 0, product_name: d["product_name"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
}
