//
//  ViewRouter.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 07/09/2022.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .landingNavigation
    
}

enum Page {
    case landingNavigation
    case welcomePage
    case emailVerifyPage
    case registerPage
    case welcomeBackPage
    case mainTab
    
    //Admin
    case editProduct
    case editTrendingProduct
    case editShop
    case editCategory
    
}
