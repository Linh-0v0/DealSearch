/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 07/09/2022
  Last modified: 12/09/2022
  Acknowledgement:
    https://blckbirds.com/post/user-authentication-with-swiftui-and-firebase/
*/

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
