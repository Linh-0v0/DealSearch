/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 12/09/2022
  Last modified: 16/09/2022
  Acknowledgement: None
*/

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
        try? await Task.sleep(nanoseconds: 500_000_000)
        isCheckingEmail = false
    }
}

struct AdminDashboard_Previews: PreviewProvider {
    static var previews: some View {
        AdminDashboard()
    }
}
