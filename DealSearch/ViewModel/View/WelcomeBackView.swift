//
//  WelcomeBackView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI
import FirebaseAuth

struct WelcomeBackView: View {
    @Binding var emailInputted: String
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Welcome back!")
                    .font(Font.custom("Montserrat-Regular", size: 36)).foregroundColor(Color("Black"))
                    .padding(.bottom, 0)
                
                Text("Duc Ho")
                    .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color("Green"))
                    .padding(.bottom, 2)
                
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
//                Text("")
                login()
            }, label: {
                Capsule()
                    .fill(Color("Green"))
                    .frame(width: 280, height:60)
                    .overlay(Text("Login")
                        .font(Font.custom("Montserrat-Bold", size: 22))
                        .foregroundColor(.white))
            })
            Spacer().frame(width: 0, height: 170)
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: emailInputted, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
    
}

struct WelcomeBackView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackView(emailInputted: .constant("random@gmail.com"))
    }
}
