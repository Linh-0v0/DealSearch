//
//  ProductSorted.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 28/08/2022.
//

import SwiftUI

struct ProductSorted: View {
    @StateObject var prodDealSortedList = DealCalcSorted()
    
    var body: some View {
        List(prodDealSortedList.prodDealSorted) { item in
            VStack {
                
//                Text(item.productDeal)
            }
        }
    }
}

struct ProductSorted_Previews: PreviewProvider {
    static var previews: some View {
        ProductSorted()
    }
}
