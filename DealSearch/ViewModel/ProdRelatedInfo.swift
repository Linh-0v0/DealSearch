/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 29/08/2022
  Last modified: 17/09/2022
  Acknowledgement: None
*/

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
