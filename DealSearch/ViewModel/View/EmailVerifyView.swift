//
//  WelcomeView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 03/09/2022.
//

import SwiftUI

struct EmailVerifyView: View {
    @State var isExisted: Bool = true
    @State private var willMoveToNextScreen: Int? = nil
    @State var email: String = ""
    
    var body: some View {
        // If logged in, go to Home Page
        if !Defaults.getCurrentUserDetail().email.isEmpty {
            TestView()
        } else {
            content
        }
    }
    
    var content: some View {
        VStack(alignment: .center) {
            // MARK: Title
            VStack(alignment: .leading) {
                Text("Input Your")
                    .font(Font.custom("Montserrat", size: 36)).foregroundColor(Color("Black"))
                    .padding(.bottom, 0
                    )
                // MARK: Input field
                Text("Email")
                    .font(Font.custom("Montserrat-Bold", size: 36
                                     )).foregroundColor(Color("Green"))
                    .padding(.bottom, 13)
                
                Text("Lorem ipsum dolor sit amet, consec adipiscing elit."
                ).font(Font.custom("OpenSans-Regular", size: 16)).foregroundColor(Color("Gray"))
                    .padding(.bottom, 20)
                VStack{
                    Group{
                        TextField(
                            "Input your email",
                            text: $email
                        )
                    }.padding(.bottom, 20)
                        .textInputAutocapitalization(.never)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }.font(Font.custom("Montserrat-Regular", size: 20))
                
                Spacer().frame(width: 0, height: 15)
            }
            .padding(.horizontal, 40)
            
            
            // MARK: Submit Button
            Button(action: {
                if !email.isEmpty {
                    isEmailExisted(email: email)
                    willMoveToNextScreen = 1
                }
            }, label: {
                Capsule()
                    .fill(Color("Green"))
                    .frame(width: 280, height:60)
                    .overlay(Text("Verify")
                        .font(Font.custom("Montserrat-Bold", size: 22))
                        .foregroundColor(.white))
            })
            .background(
                // Go to next page when specific condition is checked
                NavigationLink(destination: CheckEmailExist(isExisted: $isExisted, emailInputted: $email, emailFinding: CurrentUserData(emailInputted: email)), tag: 1, selection: $willMoveToNextScreen) { EmptyView() }
            )
        }
    }
    
    // MARK: Functions
    // check email existence in UserDefaults
    func isEmailExisted(email: String) {
        if !Defaults.getSpecifiedUserDetail(email: email).email.isEmpty {
            // Go to WelcomeBack page
            isExisted = true
        } else {
            // Go to Register page
            isExisted = false
        }
    }
}



struct EmailVerifyView_Previews: PreviewProvider {
    static var previews: some View {
        EmailVerifyView()
            .previewInterfaceOrientation(.portrait)
    }
}
