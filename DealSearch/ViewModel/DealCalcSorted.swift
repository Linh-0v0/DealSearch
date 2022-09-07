//
//  DealCalculate.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 28/08/2022.
//

import Foundation
import SwiftUI

class DealCalcSorted: ObservableObject {
    @Published var prodDealSorted = [Product]()
    @StateObject var productList = ProductData()
    
    init() {
        productDealSorted(productList: productList.productList)
    }
    
    func productDealSorted(productList: [Product]) {
        // [Product]
        var prodDealSortedTemp: [Product] = []
        // Array<(key, value)>
        let dealSortedList = dealSort(prodDealCalc: calcDeal(product: productList))

        for ele in dealSortedList {
            for prod in productList {
                if ele.key == prod.id {
                    prodDealSortedTemp.append(prod)
                }
            }
        }
//        print(prodDealSortedTemp)
        self.prodDealSorted = prodDealSortedTemp
    }
    
    //Return Array cuz .sorted() return array
    func dealSort(prodDealCalc: [String:Double]) -> Array<(key:String, value:Double)> {
        var arrSorted = prodDealCalc.sorted(by: {$0.value > $1.value})

//        print("ARRRAY SORTED")
//        print(arrSorted)
        return arrSorted
    }

    func calcDeal(product: [Product]) -> [String:Double]{
        var productArrTemp = [String: Double]()
        for item in product {
            var ratio = item.product_price / item.product_deal
            productArrTemp[item.id] = ratio
        }
        return productArrTemp
    }
    
}
