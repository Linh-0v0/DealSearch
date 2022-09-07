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
    @State private var willMoveToNextScreen = false
    @State var signOutProcessing = false
    
//    var body: some View {
//        if loginState.userIsLoggedIn {
//            content
//        } else {
//            WelcomeView()
//        }
//    }
//
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
                
            } label: {
                Text("")
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
