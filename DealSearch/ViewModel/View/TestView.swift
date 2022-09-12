//
//  TestView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 03/09/2022.
//

import SwiftUI
import FirebaseAuth

// MARK: HOME PAGE
struct TestView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var signOutProcessing = false
//    @StateObject private var productList = ProductData()
//    @StateObject private var shopList = ShopData()
//    @StateObject private var categoryList = CategoryData()
    
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
