//
//  WelcomeView.swift
//  DealSearch
//
//  Created by Nguyen Hoang To Nhu on 01/09/2022.
//

import SwiftUI

struct PhoneNumVerifyView: View {
    @State private var phoneNum: String = ""
    var body: some View {
       
            // MARK: Text
        VStack(alignment: .leading) {
                Text("Input Your")
                    .font(Font.custom("Montserrat", size: 36)).foregroundColor(Color("Black"))
                    .padding(.bottom, 0
                    )
            
            // MARK: Input field
                Text("Mobile Number")
                    .font(Font.custom("Montserrat-Bold", size: 36
                        )).foregroundColor(Color("Green"))
                    .padding(.bottom, 13)
                
                Text("Lorem ipsum dolor sit amet, consec adipiscing elit."
                ).font(Font.custom("OpenSans-Regular", size: 16)).foregroundColor(Color("Gray"))
                    .padding(.bottom, 20)
            VStack{
            Group{
                  
                        TextField(
                                "Input your phone number",
                                text: $phoneNum
                        )
                        
                    }.padding(.bottom, 20)
            }.font(Font.custom("Montserrat-Regular", size: 20))
            // MARK: Button
            Button(action: {
                Text("")
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
        
        }
        
    }


struct PhoneNumVerifyView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumVerifyView()
            .previewInterfaceOrientation(.portrait)
    }
}
