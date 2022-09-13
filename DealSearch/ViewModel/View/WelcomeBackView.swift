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
    @StateObject var emailFound: CurrentUserData
    @State private var password: String = ""
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
   
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                // MARK: Title
                Text("Welcome back!")
                    .font(Font.custom("Montserrat-Regular", size: 36)).foregroundColor(Color("Black"))
                    .padding(.bottom, 0)
                
                HStack {
                    Group {
                        Text(emailFound.currentUserData[0].firstName)
                        Text(emailFound.currentUserData[0].lastName)
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
                        // Read-only
                        TextField("random@gmail.com", text: $emailInputted)
                            .disabled(true)
                        Divider()
                            .frame(height: 1)
                            .padding(.bottom, 30)
                        
                        SecureField("Password", text: $password)
                        Divider()
                            .frame(height: 1)
                            .padding(.bottom, 0)
                    }
                    .textInputAutocapitalization(.never)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(Font.custom("Montserrat-Regular", size: 20))
                }.padding(.bottom, 30)
                
            }
            .padding(.horizontal, 30)
            
            // MARK: Login Button
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
            
            // MARK: Error Message
            if !signInErrorMessage.isEmpty {
                Text("Error: \(signInErrorMessage)")
                    .foregroundColor(.red)
            }
            
            Spacer()
        }
      

    }
    
    // MARK: FUNCTIONS
    func login() {
        Auth.auth().signIn(withEmail: emailInputted, password: password) { result, error in
            if error != nil {
                print("Could not Sign in")
                signInErrorMessage = error!.localizedDescription
                print("LoginError:\(error?.localizedDescription)")
            } else {
                print("Logged In!")
                // Save account login to UserDefaults
                Defaults.save(emailInputted,
                              firstName: emailFound.currentUserData[0].firstName,
                              lastName: emailFound.currentUserData[0].lastName,
                              favDeal: Defaults.getSpecifiedUserDetail(email: emailInputted).favDeal)
                signInProcessing = true
                viewRouter.currentPage = .testPage
            }
        }
    }

}

struct WelcomeBackView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackView(emailInputted: .constant(""), emailFound: CurrentUserData(emailInputted: ""))
    }
}
