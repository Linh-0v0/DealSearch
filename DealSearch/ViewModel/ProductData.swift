//
//  GetProductData.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 28/08/2022.
//

import Foundation
import SwiftUI

class ProductData: ObservableObject {
    @Published var productList = [Product]()
    
    init() {
        load()
    }
    
    func load() {
        guard let url = Bundle.main.url(forResource: "Product", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode([Product].self, from: data!)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
//        print("JSON PARSED DATA: ", decodedData)
        self.productList = decodedData!
    }
    
}
