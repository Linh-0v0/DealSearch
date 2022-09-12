//
//  AddPopularSearch.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 12/09/2022.
//

import SwiftUI

struct AddPopularSearch: View {
    @StateObject private var popularSearchData = PopularSearchData()
    @StateObject private var productData = ProductData()
    @State private var searchText = ""
    @State private var addMessage = ""
    
    var body: some View {
        // MARK: INPUT FIELDS
        VStack {
            NavigationView {
                List {
                    ForEach(searchResults) { prod in
                        HStack(alignment: .top, spacing: 17) {
                            Text(prod.id)
                            Text(prod.product_name)
                            
                            Spacer()
                            
                            Group {
                                // Add Product to Trending list
                                Button {
                                    popularSearchData.addData(productToAdd: prod)
                                    addMessage = "Added!"
                                } label: {
                                    Image(systemName: "plus.circle").resizable().aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                }
                            }
                            
                        }
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle("Available Products")
            }
            
            if !addMessage.isEmpty {
                Text("Added!")
                    .foregroundColor(.green)
                    .font(.system(size: 25))
            }
        }
        
    }
    
    var searchResults: [Product] {
        if searchText.isEmpty {
            return productData.productList
        } else {
            return productData.productList.filter {$0.product_name.contains(searchText) || $0.id.contains(searchText)}
        }
    }
}

struct AddPopularSearch_Previews: PreviewProvider {
    static var previews: some View {
        AddPopularSearch()
    }
}
