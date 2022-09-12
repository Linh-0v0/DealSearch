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
    @StateObject var userData = CurrentUserData(emailInputted: Defaults.getCurrentUserDetail().email)
    @State var isCheckingEmail = true
    
    //    @StateObject private var productList = ProductData()
    //    @StateObject private var shopList = ShopData()
    //    @StateObject private var categoryList = CategoryData()
    
    var body: some View {
        ZStack {
            if isCheckingEmail {
                EmptyView()
            } else {
                content
            }
        }.task {
            await delayView()
        }
    }
    
    var content: some View {
        VStack {
            Text("LANDING PAGE")
            
            Button {
                Defaults.clearUserSessionData()
                signOutUser()
                print("Click Log out !!!")
            } label: {
                Text("LOGOUT")
            }
            
            if userData.currentUserData[0].isAdmin == 1 {
                VStack {
                    NavigationLink(destination: EditProduct()) {
                        Text("Edit Products")
                    }
                    NavigationLink(destination: EditTrendingProduct()) {
                        Text("Edit Trending Products")
                    }
                    NavigationLink(destination: EditShop()) {
                        Text("Edit Shops")
                    }
                    NavigationLink(destination: EditCategory()) {
                        Text("Edit Category")
                    }
                }
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
    
    private func delayView() async {
        // Wait for 1 second to fetch data
        // (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        isCheckingEmail = false
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
