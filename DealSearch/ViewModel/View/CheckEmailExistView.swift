//
//  CheckPhoneExistView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 02/09/2022.
//

import SwiftUI

struct CheckEmailExistView: View {
    @Binding var isExisted: Bool
    @Binding var emailInputted: String
    
    var body: some View {
        ZStack {
            if isExisted {
                WelcomeBackView(emailInputted: $emailInputted)
            } else {
                RegisterView(emailInputted: $emailInputted)
            }
        }
    }
}
