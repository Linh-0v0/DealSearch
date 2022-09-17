//
//  AccountView.swift
//  DealSearch
//
//  Created by Duc Ho on 12/09/2022.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    @StateObject var emailFinding: CurrentUserData
    @State private var isCheckingEmail = true
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var signOutProcessing = false
    @StateObject var userData = CurrentUserData(emailInputted: Defaults.getCurrentUserDetail().email)
    
    var body: some View {
        ZStack {
            if isCheckingEmail {
                // While fetching data, display this view
                EmptyView()
            } else {
                VStack(alignment: .center) {
                    VStack {
                        headerView
                        
                        actionButton
                        
                        profileDetail
                    }
                    Spacer()
                    if emailFinding.currentUserData[0].isAdmin == 1 {
                        editDashboard
                            .padding(.horizontal, 30)
                    }
                    logoutSession
                        .padding(.horizontal, 30)
                }
                .frame(maxWidth: .infinity)
            }
        } .task {
            await delayView()
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
        try? await Task.sleep(nanoseconds: 500_000_000)
        isCheckingEmail = false
    }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(emailFinding: CurrentUserData(emailInputted: "hoa@gmail.com"))
    }
}

extension AccountView {
    var logoutSession: some View {
        Text("Log out")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("Green"))
            )
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Log out") {
                        Defaults.clearUserSessionData()
                        signOutUser()
                        print("Click Log out !!!")
                    }
                }
            }
    }
}

extension AccountView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color("Green")
                .ignoresSafeArea()
            
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 11, y: 12)
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
}

extension AccountView {
    var actionButton: some View {
        HStack {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
        }
        .padding(.trailing,30)
        .padding(.vertical,10)
    }
}

extension AccountView {
    var profileDetail: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Duc Ho Minh")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
                
            }
            .padding(.bottom, 40)
            
            // MARK: Info Form
            if !emailFinding.currentUserData.isEmpty {
                
                HStack {
                    Text("Phone Number:").modifier(accountProfileTitle())
                    Text(emailFinding.currentUserData[0].phoneNumber).modifier(accountProfileField())
                }
                .modifier(accountProfilePaddingBtwField())
                
                HStack {
                    Text("Email:").modifier(accountProfileTitle())
                    Text(emailFinding.currentUserData[0].email).modifier(accountProfileField())
                }
                .modifier(accountProfilePaddingBtwField())
                
                HStack {
                    Text("Date of birth:").modifier(accountProfileTitle())
                    Text(emailFinding.currentUserData[0].dateOfBirth).modifier(accountProfileField())
                }
                .modifier(accountProfilePaddingBtwField())
                
                HStack {
                    Text("Account Type:").modifier(accountProfileTitle())
                    if emailFinding.currentUserData[0].isAdmin == 1 {
                        Text("Admin").modifier(accountProfileField())
                        
                    } else {
                        Text("Member").modifier(accountProfileField())
                    }
                    
                }
                .modifier(accountProfilePaddingBtwField())
                
            }
        }
        .frame(maxWidth: .infinity)
    }
}

extension AccountView {
    var editDashboard: some View {
        Text("Edit Dashboard")
            .font(Font.custom("Montserrat-Regular", size: 15)).foregroundColor(.blue)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: AdminDashboard()){
                        Text("Edit Dashboard")
                    }
                }
            }
    }
}
