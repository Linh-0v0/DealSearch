//
//  WelcomeBackView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI
import FirebaseAuth

struct WelcomeBackView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @Binding var emailInputted: String
    @State private var password: String = ""
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Welcome back!")
                    .font(Font.custom("Montserrat-Regular", size: 36)).foregroundColor(Color("Black"))
                    .padding(.bottom, 0)
                
                HStack {
                    Group {
                        Text(Defaults.getSpecifiedUserDetail(email: emailInputted).firstName)
                        Text(Defaults.getSpecifiedUserDetail(email: emailInputted).lastName)
                    }
                    .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color("Green"))
                    .padding(.bottom, 2)
                }
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                ).font(Font.custom("OpenSans-Regular", size: 16)).foregroundColor(Color("Gray"))
                    .padding(.bottom, 33)
                
                // MARK: INPUT FIELD
                VStack {
                    Group {
                        TextField("random@gmail.com", text: $emailInputted)
                        Divider()
                            .frame(height: 1)
                            .padding(.bottom, 30)
                        
                        TextField("Password", text: $password)
                        Divider()
                            .frame(height: 1)
                            .padding(.bottom, 0)
                    }
                    .textInputAutocapitalization(.never)
                    .font(Font.custom("Montserrat-Regular", size: 20))
                }.padding(.bottom, 30)
                
            }
            .padding(.horizontal, 30)
            
            // MARK: Button
            Button(action: {
                login()
                print("Login Clicked!")
            }, label: {
                Capsule()
                    .fill(Color("Green"))
                    .frame(width: 280, height:60)
                    .overlay(Text("Login")
                        .font(Font.custom("Montserrat-Bold", size: 22))
                        .foregroundColor(.white))
            })
            
            if !signInErrorMessage.isEmpty {
                Text("Failed creating account: \(signInErrorMessage)")
                    .foregroundColor(.red)
            }
            
            Spacer().frame(width: 0, height: 170)
        }
        

    }
    
    func login() {
        Auth.auth().signIn(withEmail: emailInputted, password: password) { result, error in
            if error != nil {
                print("Could not Sign in")
                signInErrorMessage = error!.localizedDescription
                print("LoginError:\(error?.localizedDescription)")
            } else {
                print("Logged In!")
                signInProcessing = true
                viewRouter.currentPage = .testPage
            }
        }
    }

}

struct WelcomeBackView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackView(emailInputted: .constant("random@gmail.com"))
    }
}