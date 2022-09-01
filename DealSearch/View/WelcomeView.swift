//
//  WelcomeView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        // MARK: Image
        VStack {
            Spacer().frame(width: 0, height: 20)
            Image("money-penguin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 280)
                .padding(.bottom, 0)
            // MARK: Text
            VStack(alignment: .leading) {
                Text("Welcome to")
                    .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color("Black"))
                    .padding(.bottom, 0)
                
                Text("Canh Cut!")
                    .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color("Green"))
                    .padding(.bottom, 23)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                ).font(Font.custom("OpenSans-Regular", size: 16)).foregroundColor(Color("Gray"))
                    .padding(.bottom, 30)
            }
            .padding(.horizontal, 30)
            // MARK: Button
            Button(action: {
                Text("")
            }, label: {
                Capsule()
                    .fill(Color("Green"))
                    .frame(width: 280, height:60)
                    .overlay(Text("Let's buy ")
                        .font(Font.custom("Montserrat-Bold", size: 22))
                        .foregroundColor(.white))
            })
        }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
