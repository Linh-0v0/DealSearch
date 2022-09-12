//
//  AdminDashboard.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 12/09/2022.
//

import SwiftUI

struct AdminDashboard: View {
    @StateObject var userData = CurrentUserData(emailInputted: Defaults.getCurrentUserDetail().email)
    @State var isCheckingEmail = true
    
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
            if userData.currentUserData[0].isAdmin == 1 {
                VStack {
                    List {
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
    }
    
    private func delayView() async {
        // Wait for 1 second to fetch data
        // (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        isCheckingEmail = false
    }
}

struct AdminDashboard_Previews: PreviewProvider {
    static var previews: some View {
        AdminDashboard()
    }
}
