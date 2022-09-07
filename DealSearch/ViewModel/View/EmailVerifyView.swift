//
//  WelcomeView.swift
//  DealSearch
//
//  Created by Nguyen Hoang To Nhu on 01/09/2022.
//

import SwiftUI

struct EmailVerifyView: View {
    @State var isExisted: Bool = true
    @State private var willMoveToNextScreen: Int? = nil
    @State private var email: String = ""
    
    var body: some View {
        if !Defaults.getCurrentUserDetail().email.isEmpty {
            TestView()
        } else {
            content
        }
    }
    
    var content: some View {
        // MARK: Text
        VStack(alignment: .leading) {
            Text("Input Your")
                .font(Font.custom("Montserrat", size: 36)).foregroundColor(Color("Black"))
                .padding(.bottom, 0
                )
            // MARK: Input number field
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
            }.font(Font.custom("Montserrat-Regular", size: 20))
            
            // MARK: Button
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
            Spacer().frame(width: 0, height: 190)
        }
        .padding(.horizontal, 40)
        .background(
            NavigationLink(destination: CheckEmailExist(isExisted: $isExisted, emailInputted: $email), tag: 1, selection: $willMoveToNextScreen) { EmptyView() }
        )
    }
    
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
