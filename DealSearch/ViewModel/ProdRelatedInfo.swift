//
//  GetOtherInfoFromProduct.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 29/08/2022.
//

import Foundation
import SwiftUI

func getShopInfo(shopId: String, shopList: [Shop]) -> Shop {
    var shopFound: Shop?
    for shop in shopList {
        if shop.id == shopId {
            shopFound = shop
            break
        }
    }
    return shopFound!
}

func getCategoryInfo(categoryId: String) -> Category {
    @StateObject var categoryList = CategoryData()
    var categoryFound: Category?
    for category in categoryList.categoryList {
        if category.id == categoryId {
            categoryFound = category
            break
        }
    }
    return categoryFound!
}
