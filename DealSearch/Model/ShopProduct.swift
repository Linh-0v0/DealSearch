//
//  Product.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 26/08/2022.
//

import Foundation

struct Shop: Codable, Identifiable {
    var id: Int
    var shopName, shopLogo: String
    
    enum CodingKeys: String, CodingKey {
        case id = "shop_id"
        case shopName = "shop_name"
        case shopLogo = "shop_logo"
    }
}

struct Category: Codable, Identifiable {
    var id: Int
    var categoryName, categoryImage: String
    
    enum CodingKeys: String, CodingKey {
        case id = "category_id"
        case categoryName = "category_name"
        case categoryImage = "category_image"
    }
}

struct Product: Codable, Identifiable {
    var id: Int
    var shopId: Shop.ID
    var categoryId: Category.ID
    var productName,productImage: String
    var productPrice, productDeal: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "product_id"
        case shopId = "shop_id"
        case categoryId = "category_id"
        case productName = "product_name"
        case productImage = "product_image"
        case productPrice = "product_price"
        case productDeal = "product_deal"
    }
}



