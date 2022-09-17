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
    
    func productDealSorted(productList: [Product], lowToHigh: Bool) {
        // [Product]
        var prodDealSortedTemp: [Product] = []
        if lowToHigh {
            // Array<(key, value)>
            let dealSortedList = dealSortLowHigh(prodDealCalc: calcDeal(product: productList))
            
             for ele in dealSortedList {
                 for prod in productList {
                     if ele.key == prod.id {
                         prodDealSortedTemp.append(prod)
                     }
                 }
             }
             print("prodDealSortedTemp")
             
             self.prodDealSorted = prodDealSortedTemp
            
        } else {
             let dealSortedList = dealSortHighLow(prodDealCalc: calcDeal(product: productList))
            
             for ele in dealSortedList {
                 for prod in productList {
                     if ele.key == prod.id {
                         prodDealSortedTemp.append(prod)
                     }
                 }
             }
             print("prodDealSortedTemp")
             
             self.prodDealSorted = prodDealSortedTemp
        }
        
    }
    
    //Return Array cuz .sorted() return array
    func dealSortLowHigh(prodDealCalc: [String:Double]) -> Array<(key:String, value:Double)> {
        var arrSorted = prodDealCalc.sorted(by: {$0.value > $1.value})
//        print(arrSorted)
        return arrSorted
    }
    
    func dealSortHighLow(prodDealCalc: [String:Double]) -> Array<(key:String, value:Double)> {
        var arrSorted = prodDealCalc.sorted(by: {$0.value < $1.value})
//        print(arrSorted)
        return arrSorted
    }

    func calcDeal(product: [Product]) -> [String:Double]{
        var productArrTemp = [String: Double]()
        for item in product {
            var ratio = item.product_price / item.product_deal
            productArrTemp[item.id] = ratio
            print(item.id)
        }
        print("calcDeal")
        return productArrTemp
    }
    
}
