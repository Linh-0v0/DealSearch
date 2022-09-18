/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 07/09/2022
  Last modified: 15/09/2022
  Acknowledgement:
    https://blckbirds.com/post/user-authentication-with-swiftui-and-firebase/
*/

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
            case .mainTab:
                MainTabView()
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

