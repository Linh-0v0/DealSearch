//
//  KeysearchByCategView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 13/09/2022.
//

import SwiftUI

struct KeysearchByCategView: View {
    @StateObject var currentCateg: CurrentSearchData
    @StateObject private var categoryData = CategoryData()
    @State var isFetching = true
    @State var fetchedSearchkey: [PopularSearch] = []
    
    var body: some View {
        VStack {
            if !fetchedSearchkey.isEmpty {
            List {
                ForEach(fetchedSearchkey) { search in
                    Button {
                        // Go to the product
                        Text("")
                    } label: {
                        Text(search.product_name)
                    }
                }
            }
            }
            
            List {
                ForEach(categoryData.categoryList) { categ in
                    Button {
                        currentCateg.getData(categoryClickedId: Int(categ.id)!)
                        fetchedSearchkey = currentCateg.currentSearch
                        print("CURRENT SEARCH AFTER CLICKED: \(fetchedSearchkey)")
                    } label: {
                        Text(categ.category_name)
                    }
                }
            }
        }
    }
    
}

struct KeysearchByCategView_Previews: PreviewProvider {
    static var previews: some View {
        KeysearchByCategView(currentCateg: CurrentSearchData(categoryClickedId: 1), fetchedSearchkey: [])
    }
}
