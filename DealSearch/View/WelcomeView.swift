//
//  WelcomeView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("penguin-money")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 230)
                .padding(.bottom, 30)
            
            Text("Welcome to")
                .font(.system(size: 12, weight: .light, design: .serif)).foregroundColor(ColorConstants.textDescr)
                .padding(.bottom, 10)
            Text("Canh Cut!")
                .font(.system(size: 12, weight: .light, design: .serif)).foregroundColor(ColorConstants.textDescr)
                .padding(.bottom, 10)
            
            Spacer()
            Button(action: {
                active = false
            }, label: {
                Capsule()
                    .fill(ColorConstants.buttonDescr)
                    .frame(width: 300, height:60)
                    .overlay(Text("Continue ")
                        .font(Font.custom("Inter-SemiBold", size: 20))
                        .foregroundColor(.white))
            })
            .zIndex(100)
            .padding(.bottom, 20)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
