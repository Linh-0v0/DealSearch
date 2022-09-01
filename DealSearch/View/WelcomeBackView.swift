//
//  WelcomeBackView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI

struct WelcomeBackView: View {
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome back!")
                .font(Font.custom("Montserrat-Regular", size: 36)).foregroundColor(Color("Black"))
                .padding(.bottom, 0)
            
            Text("Duc Ho")
                .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color("Green"))
                .padding(.bottom, 13)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            ).font(Font.custom("OpenSans-Regular", size: 16)).foregroundColor(Color("Gray"))
                .padding(.bottom, 33)
            
            //MARK: INPUT FIELD
            VStack {
                TextField("Username", text: $username)
            }
        }
        .padding(.horizontal, 30)
    }
}

struct WelcomeBackView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackView()
    }
}
