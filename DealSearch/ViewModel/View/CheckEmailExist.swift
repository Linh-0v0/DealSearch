/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 02/09/2022
  Last modified: 12/09/2022
  Acknowledgement: None
*/

import SwiftUI

struct CheckEmailExist: View {
    @Binding var isExisted: Bool
    @Binding var emailInputted: String
    @StateObject var emailFinding: CurrentUserData
    @State private var isCheckingEmail = true
    
    var body: some View {
        ZStack {
            if isCheckingEmail {
                // While fetching data, display this view
                EmptyView()
            } else {
                // Check "email existence" in UserDefault (isExisted) beofre check in FireStore DB
                if isExisted || !emailFinding.currentUserData.isEmpty {
                    WelcomeBackView(emailInputted: $emailInputted, emailFound: emailFinding)
                } else {
                    RegisterView(emailInputted: $emailInputted, emailFound: emailFinding)
                }
            }
        }.task {
            await delayView()
        }
    }
    
    private func delayView() async {
        // Wait for 1 second to fetch data
        // (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        isCheckingEmail = false
    }
}
