//
//  ShopView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 26/08/2022.
//

import Foundation

class ShopData: ObservableObject {
    @Published var shopList = [Shop]()
//    
//    init() {
//        load()
//    }
//    
//    func load() {
//        guard let url = Bundle.main.url(forResource: "Shop", withExtension: "json")
//        else {
//            print("Json file not found")
//            return
//        }
//        
//        let data = try? Data(contentsOf: url)
//        
//        let decoder = JSONDecoder()
//        let decodedData = try? decoder.decode([Shop].self, from: data!)
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        
////        print("JSON PARSED DATA: ", decodedData)
//        self.shopList = decodedData!
//    }
    
}

