/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 07/09/2022
  Last modified: 16/09/2022
  Acknowledgement: None
*/

import Foundation

struct Product: Identifiable {
    var id: String
    var category_id: Int
    var product_deal: Double
    var product_deal_1: Double
    var product_image: String
    var product_name: String
    var product_price: Double
    var product_price_1: Double
    var shop_id: Int
}

struct TrendingProduct: Identifiable {
    var id: String
    var category_id: Int
    var product_deal: Double
    var product_deal_1: Double
    var product_image: String
    var product_name: String
    var product_price: Double
    var product_price_1: Double
    var shop_id: Int
}
