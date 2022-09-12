//
//  MotherView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 07/09/2022.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationView {
            switch viewRouter.currentPage {
            case .landingNavigation:
                LandingNavigation()
            case .welcomePage:
                WelcomeView()
            case .emailVerifyPage:
                EmailVerifyView()
            case .testPage:
                TestView()
            case .registerPage:
                RegisterView(emailInputted: .constant(""), emailFound: CurrentUserData(emailInputted: ""))
            case .welcomeBackPage:
                WelcomeBackView(emailInputted: .constant(""), emailFound: CurrentUserData(emailInputted: ""))
                
                //Admin
            case .editProduct:
                EditProduct()
            case .editTrendingProduct:
                EditTrendingProduct()
            case .editCategory:
                EditCategory()
            case .editShop:
                EditShop()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}

