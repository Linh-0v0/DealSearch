//
//  SearchViewModel.swift
//  DealSearch
//
//  Created by Duc Ho on 17/09/2022.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var searchText = ""
    
    var searchableProduct: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return products.filter({
                $0.product_name.contains(lowercasedQuery)
            })
        }
    }
}
