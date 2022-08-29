//
//  CategoryData.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 29/08/2022.
//

import Foundation

class CategoryData: ObservableObject {
    @Published var categoryList = [Category]()
    
    init() {
        load()
    }
    
    func load() {
        guard let url = Bundle.main.url(forResource: "Category", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode([Category].self, from: data!)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
//        print("JSON PARSED DATA: ", decodedData)
        self.categoryList = decodedData!
    }
    
}
