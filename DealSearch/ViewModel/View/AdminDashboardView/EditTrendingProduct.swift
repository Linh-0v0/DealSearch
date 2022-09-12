//
//  EditTrendingProduct.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 12/09/2022.
//

import SwiftUI

struct EditTrendingProduct: View {
    @State private var showingAddSheet = false
    @StateObject var productData = TrendingProductData()
    @State private var searchText = ""
    
    var body: some View {
        // MARK: TRENDING PRODUCT LIST
        List {
            ForEach(searchResults) { prod in
                HStack(alignment: .top, spacing: 17) {
                    Text(prod.id)
                    Text(prod.product_name)
                    
                    Spacer()
                    
                    // Delete Product
                    Button {
                        productData.deleteData(productToDelete: prod)
                    } label: {
                        Image(systemName: "minus.circle").resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Trending Products")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Add Product") {
                    showingAddSheet.toggle()
                    print("Pressed")
                }
                .sheet(isPresented: $showingAddSheet) {
                    AddToTrendingList()
                }
            }
        }
        
    }
    
    var searchResults: [Product] {
        if searchText.isEmpty {
            return productData.trendingProductList
        } else {
            return productData.trendingProductList.filter {$0.product_name.contains(searchText) || $0.id.contains(searchText)}
        }
    }
}


struct EditTrendingProduct_Previews: PreviewProvider {
    static var previews: some View {
        EditTrendingProduct(productData: TrendingProductData())
    }
}
