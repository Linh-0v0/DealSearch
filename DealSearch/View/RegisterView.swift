//
//  RegisterView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var phoneNumber: String = ""
    
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
                
                
                VStack(alignment: .leading) {
                    Text("PHONE NUMBER*").modifier(registerFieldTitle())
                    TextField("Mobile number (pre-filled)", text: $phoneNumber).modifier(registerInputField())
                }.modifier(registerPaddingBtwField())
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("FIRST NAME*").modifier(registerFieldTitle())
                        TextField("First Name", text: $phoneNumber).modifier(registerInputField())
                    }.padding(.bottom, 0)
                    VStack(alignment: .leading) {
                        Text("LAST NAME*").modifier(registerFieldTitle())
                        TextField("Last Name", text: $phoneNumber).modifier(registerInputField())
                    }.padding(.bottom, 0)
                }.modifier(registerPaddingBtwField())
                
                VStack(alignment: .leading) {
                    Text("EMAIL*").modifier(registerFieldTitle())
                    TextField("Email Address", text: $phoneNumber).modifier(registerInputField())
                }.modifier(registerPaddingBtwField())
                
                VStack(alignment: .leading) {
                    Text("DATE OF BIRTH*").modifier(registerFieldTitle())
                    TextField("dd / mm / yyyy)", text: $phoneNumber).modifier(registerInputField())
                }.modifier(registerPaddingBtwField())
                
                VStack(alignment: .leading) {
                    Text("ADDRESS*").modifier(registerFieldTitle())
                    TextField("Address", text: $phoneNumber).modifier(registerInputField())
                }.modifier(registerPaddingBtwField())
            }
            .padding(.horizontal, 30)
            
            // MARK: Button
            Button(action: {
                Text("")
            }, label: {
                Capsule()
                    .fill(Color("Green"))
                    .frame(width: 280, height:60)
                    .overlay(Text("Register")
                        .font(Font.custom("Montserrat-Bold", size: 22))
                        .foregroundColor(.white))
            })
            .padding(.bottom, 20)
            .padding(.top, 10)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
