//
//  WelcomeView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State private var willMoveToNextScreen = false
    
    var body: some View {
        NavigationView {
            // MARK: Image
            VStack {
                Image("money-penguin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 290)
                    .padding(.bottom, 0)
                
                // MARK: Text
                VStack(alignment: .leading) {
                    Text("Welcome to")
                        .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color("Black"))
                        .padding(.bottom, 0)
                    
                    Text("Canh Cut!")
                        .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color("Green"))
                        .padding(.bottom, 13)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                    ).font(Font.custom("OpenSans-Regular", size: 16)).foregroundColor(Color("Gray"))
                        .padding(.bottom, 33)
                }
                .padding(.horizontal, 30)
                
                // MARK: Button
                NavigationLink(destination: EmailVerifyView(), isActive: $willMoveToNextScreen) {
                Button(action: {
                    willMoveToNextScreen = true
                    print(Defaults.getCurrentUserDetail())
                }, label: {
                    Capsule()
                        .fill(Color("Green"))
                        .frame(width: 280, height:60)
                        .overlay(Text("Let's buy ")
                            .font(Font.custom("Montserrat-Bold", size: 22))
                            .foregroundColor(.white))
                })
                .padding(.bottom, 40)
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
