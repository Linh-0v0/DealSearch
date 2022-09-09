//
//  TestView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 03/09/2022.
//

import SwiftUI
import FirebaseAuth

struct TestView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var signOutProcessing = false
//    @StateObject var productList = ProductData()
//    @StateObject var shopList = ShopData()
//    @StateObject var categoryList = CategoryData()
    
    var body: some View {
        VStack {
            Text("LANDING PAGE")
            
            Button {
                Defaults.clearUserSessionData()
                signOutUser()
                print("Click Log out !!!")
            } label: {
                Text("LOGOUT")
            }
            
            Button {
                print("")
//                categoryList.categoryList
            } label: {
                Text("Get Data")
            }
        }
    }
    
    func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
            signOutProcessing = false
        }
            viewRouter.currentPage = .emailVerifyPage
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
