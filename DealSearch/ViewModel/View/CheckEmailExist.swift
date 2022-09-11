//
//  CheckPhoneExistView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 02/09/2022.
//

import SwiftUI

struct CheckEmailExist: View {
    @Binding var isExisted: Bool
    @Binding var emailInputted: String
    @StateObject var emailFinding: CurrentUserData
    @State var isCheckingEmail = true
    
    var body: some View {
        ZStack {
            if isCheckingEmail {
                EmptyView()
            } else {
                // Check in UserDefault (isExisted) beofre check in FireStore DB
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
        // (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        isCheckingEmail = false
    }
}
