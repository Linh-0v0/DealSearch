//
//  RegisterView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject private var users = UserData()
    @State var signUpProcessing = false
    @State var signUpErrorMessage = ""
    @Binding var emailInputted: String
    @StateObject var emailFound: CurrentUserData
    
    @State private var phoneNumber: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var dateOfBirth: String = ""
    @State private var password: String = ""
    @State private var address: String = ""
    @State private var isAdmin = 0
    @State private var adminPass: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Register new")
                    .font(Font.custom("Montserrat-Regular", size: 36)).foregroundColor(Color("Black"))
                    .padding(.bottom, 0)
                
                Text("Account")
                    .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color("Green"))
                    .padding(.bottom, 2)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                ).font(Font.custom("OpenSans-Regular", size: 16)).foregroundColor(Color("Gray"))
                    .padding(.bottom, 33)
                
                // MARK: Register Form
                VStack(alignment: .leading) {
                    Text("PHONE NUMBER*").modifier(registerFieldTitle())
                    TextField("Mobile number", text: $phoneNumber).modifier(registerInputField())
                }.modifier(registerPaddingBtwField())
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("FIRST NAME*").modifier(registerFieldTitle())
                        TextField("First Name", text: $firstName).modifier(registerInputField())
                    }.padding(.bottom, 0)
                    VStack(alignment: .leading) {
                        Text("LAST NAME*").modifier(registerFieldTitle())
                        TextField("Last Name", text: $lastName).modifier(registerInputField())
                    }.padding(.bottom, 0)
                }.modifier(registerPaddingBtwField())
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("PASSWORD*").modifier(registerFieldTitle())
                        SecureField("Password", text: $password).modifier(registerInputField())
                    }.modifier(registerPaddingBtwField())
                    VStack(alignment: .leading) {
                        Text("DATE OF BIRTH*").modifier(registerFieldTitle())
                        TextField("dd / mm / yyyy", text: $dateOfBirth).modifier(registerInputField())
                    }.modifier(registerPaddingBtwField())
                }
                
                VStack(alignment: .leading) {
                    Text("EMAIL*").modifier(registerFieldTitle())
                    TextField("Email Address", text: $emailInputted).modifier(registerInputField())
                }.modifier(registerPaddingBtwField())
                    .disabled(true)
                
                
                VStack(alignment: .leading) {
                    Text("ADDRESS*").modifier(registerFieldTitle())
                    TextField("Address", text: $address).modifier(registerInputField())
                }.modifier(registerPaddingBtwField())
                
                VStack {
                    Text("ACCOUNT TYPE*")
                        .modifier(registerFieldTitle())
                    Picker("Account Type", selection: $isAdmin) {
                        Text("Admin").tag(1)
                        Text("User").tag(0)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }.modifier(registerPaddingBtwField())
                
                if isAdmin == 1 {
                    VStack(alignment: .leading) {
                        Text("ADMIN VALIDATE PASS*").modifier(registerFieldTitle())
                        SecureField("Password", text: $adminPass).modifier(registerInputField())
                    }.modifier(registerPaddingBtwField())
                }
            }
            .padding(.horizontal, 30)
            
           
            
            // MARK: Register Button
            Button(action: {
                print("Register Click")
                if checkRegisterForm() {
                    
                    // Add Info to User db
                    users.addData(phoneNum: phoneNumber, firstName: firstName, lastName: lastName, email: emailInputted, dateOfBirth: dateOfBirth, address: address, isAdmin: isAdmin)
                    register()
                }
            }, label: {
                Capsule()
                    .fill(Color("Green"))
                    .frame(width: 280, height:60)
                    .overlay(Text("Register")
                        .font(Font.custom("Montserrat-Bold", size: 22))
                        .foregroundColor(.white))
            })
            .padding(.bottom, 10)
            .padding(.top, 10)
            
            // MARK: Error message
            if !signUpErrorMessage.isEmpty {
                Text("Failed creating account: \(signUpErrorMessage)")
                    .foregroundColor(.red)
            }
            
        }
    }
    
    // MARK: FUNCTIONS
    func checkRegisterForm() -> Bool {
        if isAdmin == 1 && adminPass != "098765" {
            signUpErrorMessage = "Wrong Admin Password!"
            return false
        }
        return true
    }
    
    func register() {
        // If the email has NOT been registered
        if emailFound.currentUserData.isEmpty {
            Auth.auth().createUser(withEmail: emailInputted, password: password) { result, error in
                if error != nil {
                    print("Could not create account!")
                    signUpErrorMessage = error!.localizedDescription
                    print(error?.localizedDescription)
                } else {
                    print("Register successfully!")
                    // Save Email to UserDefault
                    Defaults.save(emailInputted, firstName: firstName, lastName: lastName, favDeal: "")
                    signUpProcessing = true
                    viewRouter.currentPage = .mainTab
                }
            }
            
        } else {
            signUpErrorMessage = "Email has been registered!"
        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(emailInputted: .constant("random@gmail.com"), emailFound: CurrentUserData(emailInputted: ""))
    }
}
